// FisheryManagement.cc

#include <stdio.h>
#include <rw/tpordvec.h>
#include <rw/tvordvec.h>
#include "globals.h"
#include "log.h"
#include "FisheryManagement.h"
#include "FisheryList.h"

#include "Policy.h"
#include "FixedHarvestPolicy.h"
#include "CeilingPolicy.h"
#include "FixedEscapementPolicy.h"
#include "FixedCombHarv.h"
#include "MultiCeilingPolicy.h"

// queue up requests to add policies during late initialization.
// since only one request per type is meaningful and order doesn't
// matter, this is implemented as a bit field.

void FisheryManagement::queue_policy_init(Policies::PolicyType ptype)
{
    requests.setBit(ptype);
}


// late initializaton phase.  create policies for which requests have
// been queued.

void FisheryManagement::init_policies()
{
    while (requests != FALSE) {
	Policies::PolicyType ptype =
	    (Policies::PolicyType) requests.firstTrue();
	
	switch (ptype) {
	  case Policies::FIXED_HARVEST:
	  case Policies::CEILING:
	  case Policies::MULTI_CEILING:
	    add_new_policy(ptype);
	    break;

	  default:
	    // dont know how to make other policies on the fly
	    ::LogMsg(L_Fatal,
		     "programmer error - bad queued policy request, code %d\n",
		     ptype);
	}
	requests.clearBit(ptype);
    }
}

// make a new policy of the given type and add it to the list.
// prerequisite:
//	policy types properly set up for all fisheries

void FisheryManagement::add_new_policy(Policies::PolicyType ptype)
{
    // search the global fishery list and construct a new one with the
    // appropriate subset of fisheries.  this is most easily done in
    // two passes.  

    int num=0, i, j;
    for (i=0; i < Fisheries.num(); ++i) {
	if (Fisheries[i].policy_type() == ptype) 
	    ++num;
    }
    FisheryList flist(num);
    for (i=0, j=0; i < Fisheries.num(); ++i) {
	if (Fisheries[i].policy_type() == ptype) 
	    flist.insert(&Fisheries[i]);
    }

    Policy *p;
    switch (ptype) {
      case Policies::FIXED_HARVEST:
	p = new FixedHarvestPolicy(flist); assert(p);
	break;

      case Policies::CEILING:
	p = new CeilingPolicy(flist); assert(p);
	break;

    case Policies::MULTI_CEILING:
	p = new MultiCeilingPolicy(flist); assert(p);
	break;

      default:
	// dont know how to make other policies on the fly
	::LogMsg(L_Fatal,
		 "programmer error - bad queued policy request, code %d\n",
		 ptype);
    }
    add_policy(p);
}


// actually add policies to the master list.  enforce ordering of
// phase-specific vs. non-phase-specific policies.

void FisheryManagement::add_policy(Policy *p)
{
    if (p->num_fisheries()) {
	if (p->phase_specific())
	    policies.append(p);
	else
	    policies.prepend(p);
    }
}


// routines to walk the policy lists and perform the harvests

void FisheryManagement::take_preterm_harvests() 
{
    RWTPtrSlistIterator<Policy> next(policies);
    Policy *p;

    while (p = next())
	p->take_preterm_harvests();
}

void FisheryManagement::take_terminal_harvests()
{
    RWTPtrSlistIterator<Policy> next(policies);
    Policy *p;

    while (p = next())
	p->take_terminal_harvests();
}

void FisheryManagement::take_river_harvests()
{
    RWTPtrSlistIterator<Policy> next(policies);
    Policy *p;

    while (p = next())
	p->take_river_harvests();
}

// utility fn to read in a range of years, and set corresponding values
// in the passed in Bool vector.  this routine probably belongs in
// a different file.
//
// preconditions: file pointer at first year
//		  vec size ::Chronrapher->nyears()
//
// return: 0 on success
//	   1 on error

static int activate_year_range(FILE *fp, RWTValVector<Bool> &vec)
{
    int yr;
    while (fscanf(fp, "%d", &yr) == 1) {
	// adjust to year index
	int i = yr - ::Chronographer->base_year();
	if (i < 0 || i >= ::Chronographer->nyears()) {
	    ::LogMsg(L_Error, "bad year %d in policy file\n", yr);
	    return 1;
	}
	vec[i] = TRUE;
    }
    return 0;
}

// utility fn to read doubles into a vector, but indexed by a second
// vector.
//
// preconditions: file pointer at value
//		  target vector size ::Chronrapher->nyears()
//
// return: 0 on success
//	   1 on error

static int parse_indexed_vec(FILE *fp, RWTValVector<double> &vec,
			     const RWTValOrderedVector<int> &index_vec)
{
    int num = index_vec.entries();
    if (num == 0) {
	::LogMsg(L_Error,
		 "management years must be specified before"
		 " fixed escapement or idl data.\n");
	return 1;
    }
    else {
	for (int i=0; i < num; ++i) {
	    double val;
	    if (fscanf(fp, "%lf", &val) != 1) 
		return 1;
	    else {
		::LogMsg(L_DbgMsg, "val %lf in yr %d\n", val,
		       index_vec[i]);
		vec[index_vec[i]] = val;
	    }
	}
    }
    return 0;
}

// read policy information from open file.  allocates some Policy (or subclass)
// objects, which are added to the FisheryManager list, and destroyed from
// there.
//
// this routine is pretty hairy, but we expect to junk it in favor of a
// proper token-based parser before long.
//
// note: comments aren't handled properly yet, so they should be avoided
// in the data file, except after "end" tokens
//
//   precondition: open file (fp)
//   return 0 on success, 1 on error


extern int SkipComment(FILE *fp);	// in IOCrud.cc
    

int operator>>(FILE* fp, FisheryManagement& manager)
{
    char inp_str[256];
    int erc=0;
    int ret = 0;

    // we allow fixed escapement or combined harvest rate policies;
    // the two are very similar

    while (!erc && (ret = fscanf(fp, " %[^,\t\n ]", inp_str) == 1)) {
	// "policy" token is the only one recognized at the top level
	if (strcmp(inp_str, "policy")) {
	    LogMsg(L_Error, "unrecognized token %s in policy config\n",
		   inp_str);
	    erc = 1;
	    break;
	}

	// pick up and identify policy type
	Policies::PolicyType policy_type;
	if ((ret = fscanf(fp, " %[^,\n\t ]", inp_str)) != 1) {
	    erc = 1;
	    break;
	}
	if (!strcmp(inp_str, "fixed_escapement"))
	    policy_type = Policies::FIXED_ESCAPEMENT;
	else if (!strcmp(inp_str, "combined_harvest_rate"))
	    policy_type = Policies::FIXED_COMBINED_HARVEST;
	else {
	    LogMsg(L_Error, "unidentified in-river policy type %s\n", inp_str);
	    erc = 1;
	    break;
	}

	::SkipComment(fp);
	
	while (!erc && (ret = fscanf(fp, " %[^,\t\n ]", inp_str) == 1)) {

	    // river level
	    if (!strcmp(inp_str, "river")) {
		::SkipComment(fp); // scrap the river name

		enum { COMBINED, STRONG, WEAK } mgt_code = COMBINED;

		// temporary lists to hold the fisheries and stocks,
		// and other data, with proper max sizes.  all possible
		// vecs for any policy permitted here.
		RWTPtrOrderedVector<Fishery> fishlist(::Fisheries.num());
		RWTPtrOrderedVector<Stock> stocklist(::Stocks.num());
		RWTValVector<double> combined_esc(::Chronographer->nyears(), 0);
		RWTValVector<double> indiv_esc(::Chronographer->nyears(), 0);
		RWTValVector<double> mgt_idls(::Chronographer->nyears(), 1.0);
		RWTValVector<Bool> mgt_years(::Chronographer->nyears(), FALSE);
		RWTValVector<Bool> forced_years(::Chronographer->nyears(),
						FALSE);
		RWTValVector<double> hrs(::Chronographer->nyears(), 0);

		// convenience vector to give the array indices of the
		// active management years.
		RWTValOrderedVector<int>
		    mgt_yrs_index(::Chronographer->nyears());
		    
		// within river level
		while (!erc && (ret = fscanf(fp, " %[^,\t\n ]", inp_str)== 1)) {
		    // this section works by gathering all the data from
		    // the various tokens in temp variables, then
		    // using them to create the proper policy when
		    // the "end" token is encountered.
		    
		    if (!strcmp(inp_str, "mgmt_type")) {
			if (fscanf(fp, "%s", inp_str) != 1)
			    erc = 1;
			else {
			    if (!strcmp(inp_str, "combined"))
				mgt_code = COMBINED;
			    else if (!strcmp(inp_str, "strong"))
				mgt_code = STRONG;
			    else if (!strcmp(inp_str, "weak"))
				mgt_code = WEAK;
			    else {
				::LogMsg(L_Error,
					 "unrecognized fixed escapment type: "
					 "%s\n", inp_str);
				erc = 1;
			    }
			}
		    }
		
		    else if (!strcmp(inp_str, "mgmt_years")) {
			if (!(erc = activate_year_range(fp, mgt_years))) {
			    // clear, then generate index array
			    mgt_yrs_index.clear();
			    for (size_t i=0; i < mgt_years.length(); ++i) {
				if (mgt_years[i]) {
				    mgt_yrs_index.insert(i);
				    LogMsg(L_DbgMsg,
					   "management on in year %d\n",i);
				}
			    }
			}
		    }
		    else if (!strcmp(inp_str, "forced_years")) {
			erc = activate_year_range(fp, forced_years);
		    }
		    else if (!strcmp(inp_str, "escapements")) {
			erc += parse_indexed_vec(fp,combined_esc,mgt_yrs_index);
		    }
		    else if (!strcmp(inp_str, "harvest_rates")) {
			erc += parse_indexed_vec(fp,hrs,mgt_yrs_index);
		    }
		    else if (!strcmp(inp_str, "fishery")) {
			if (fscanf(fp, " %[^\n,]", inp_str) != 1)
			    erc = 1;
			else {
			    // strip trailing blanks
			    int len = strlen(inp_str);
			    while (len && (inp_str[len-1] == ' '
					   || inp_str[len-1] == '\t'))
				inp_str[--len] = 0;

			    Fishery *f = ::Fisheries.find(inp_str);
			    LogMsg(L_DbgMsg,
				   "found fishery %s\n", f->get_name());
			    if (f) {
				// add this fishery to the list
				fishlist.insert(f);
				f->set_policy(policy_type);
			    }
			    else {
				::LogMsg(L_Error, "unable to find fishery %s "
					 "for fixed policy management.\n",
					 inp_str);
				erc=1;
			    }
			}
		    }
		    else if (!strcmp(inp_str, "stock")) {
			// stocks identified by abbrevs.  simpler for
			// parsing, but tougher for searching
			if (fscanf(fp, "%s", inp_str) != 1)
			    erc = 1;
			else {
			    Stock *s=0;
			    for (int i=0; i < ::Stocks.num(); ++i) {
				if (!strcmp(::Stocks[i].get_abbrv(), inp_str)) {
				    s = &::Stocks[i];
				    break;
				}
			    }
			    if (!s) {
				::LogMsg(L_Error, "unable to find stock %s "
					 "for in-river policy managment.\n",
					 inp_str);
				erc=1;
			    }
			    else {
				LogMsg(L_DbgMsg,
				       "found stock %s\n", s->get_name());

				// add this stock to the list
				stocklist.insert(s);

				// parse stock
				while (!erc
				       && (ret = fscanf(fp,
							" %[^,\t\n ]", inp_str)
					   == 1)) {
				    if (!strcmp(inp_str, "escapements")) {
					erc +=
					    parse_indexed_vec(fp,
							      indiv_esc,
							      mgt_yrs_index);
				    }
				    else if (!strcmp(inp_str, "mgmt_idls")) {
					erc +=
					    parse_indexed_vec(fp,
							      mgt_idls,
							      mgt_yrs_index);
				    }
				    else if (!strcmp(inp_str, "end")) { 
					// end stock
					erc += ::SkipComment(fp);

					// make and add the stock
					if (!mgt_yrs_index.entries()) {
					    erc = 1;
					    ::LogMsg(L_Error,
						     "no management years "
						     "specified for in-river "
						     "policy managment/\n");
					}
					else {
					    LogMsg(L_DbgMsg,
						   "adding stock data\n");
					    if (policy_type ==
						Policies::FIXED_COMBINED_HARVEST
						|| mgt_code == COMBINED) {

						FixedEscStock fes(mgt_idls);
						s->add_fixed_escapement(fes);
					    }
					    else {
						FixedEscStock fes(mgt_idls,
								  indiv_esc);
						s->add_fixed_escapement(fes);
					    }
					}
					break;
				    } // fi end stock token
				    else {
					LogMsg(L_Error,
					       "unrecognized stock token %s "
					       "in policy config\n",
					       inp_str);
					erc = 1;
					break;
				    }
				} // od stock level
			    } // fi stock abbrv found
			} // fi stock name token
		    } // fi stock token
			
		    else if (!strcmp(inp_str, "end")) { // end river
			erc += ::SkipComment(fp);

			if (!mgt_yrs_index.entries()) {
			    ::LogMsg(L_Error, "no management years specified "
				     "for in-river policy.\n");
			    erc = 1;
			    break;
			}
		    
			// construct the proper fishlist and stocklist
			// created on the heap because the compiler has fits
			// otherwise.  deleted just below.
			FisheryList *flist =new FisheryList(fishlist.entries());
			StockList *slist = new StockList(stocklist.entries());
			if (!flist || !slist) {
			    erc=1; break;
			}
			for (size_t i=0; i < fishlist.entries(); ++i)
			    flist->insert(fishlist[i]);
			for (i=0; i < stocklist.entries(); ++i)
			    slist->insert(stocklist[i]);

			// make the proper policy
			Policy *pp;
			if (policy_type == Policies::FIXED_ESCAPEMENT) {
			    if (mgt_code == COMBINED) {
				pp = new FixedEscapementCombined(*flist, *slist,
						 mgt_years,
						 forced_years,
						 combined_esc);
			    }
			    else if (mgt_code == STRONG) {
				pp = new FixedEscapementStrength(*flist, *slist,
						 mgt_years,
						 forced_years,
						 FixedEscapementStrength::STRONG);
			    }
			    else  {  // WEAK
				pp = new FixedEscapementStrength(*flist, *slist,
						 mgt_years,
						 forced_years,
						 FixedEscapementStrength::WEAK);
			    }
			}
			else if (policy_type
				 == Policies::FIXED_COMBINED_HARVEST) {
			    pp = new FixedCombHarv(*flist, *slist,
						   mgt_years,
						   forced_years,
						   hrs);
			}
			else {
			    erc = 1;
			    ::LogMsg(L_Error,
				     "unable to identify in-river policy"
				     " type\n");
			    break;
			}
			delete flist;
			delete slist;
			if (!pp) {
			    erc = 1;
			    ::LogMsg(L_Error, "no memory for new fixed "
				     "escapement policy.\n");
			    break;
			}
 			
			manager.add_policy(pp);
			if (policy_type == Policies::FIXED_COMBINED_HARVEST) {
			    LogMsg(L_DbgMsg,
				   "adding combined harvest rate policy.\n");
			}
			else {
			    LogMsg(L_DbgMsg,
				   "adding fixed escapement policy.\n");
			}
			break;
		    }  // fi end river token
		    else {
			LogMsg(L_Error,
			       "unrecognized river token %s in policy config\n",
			       inp_str);
			erc = 1;
			break;
		    }
		} // od river level
	    } // fi river token

	    else if (!strcmp(inp_str, "end")) { // end policy
		erc += ::SkipComment(fp);
		break;
	    }
	    else {
		LogMsg(L_Error, "unrecognized token %s in policy config\n",
		       inp_str);
		erc = 1;
		break;
	    }

	    // always check for comment field
//	    erc += ::SkipComment(fp);

	} // od policy level
    }// od top level
    if (ret == EOF)
	erc = 1;

    if (erc)
	LogMsg(L_Error, "trouble reading policy config.\n");

    return erc;
}
