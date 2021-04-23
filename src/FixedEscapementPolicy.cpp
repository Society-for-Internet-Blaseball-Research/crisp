// FixedEscapementPolicy.cc

#include <math.h>
#include <assert.h>
#include "NamedPtrVec.h"
#include "log.h"
#include "globals.h"
#include "Harvest.h"
#include "FixedEscapementPolicy.h"
    
// ctors and dtors

FixedEscapementPolicy::
FixedEscapementPolicy(const FisheryList &fl, const StockList &sl,
		      const BoolVec &mgt, const BoolVec &forced)
    : Policy(fl), slist(sl), management_on_(mgt), forced_esc_(forced),
      nr_flist_done(FALSE)
{
    fish_avail = new HvAgeVec<double> [slist.num()];
    for (int i=0; i < slist.num(); ++i)
	fish_avail[i] = 0;
}

FixedEscapementPolicy::~FixedEscapementPolicy()
{
    delete [] fish_avail;
}

// utility routine to do late init of non-river fishlist, after harvest
// lists are built

void FixedEscapementPolicy::
init_non_river_flist()
{
    // find the non-river fisheries and insert each in the list exactly once
    for (int i=0; i < slist.num(); ++i) {
	HvIter iter(slist[i].get_harvest_list());
	Harvest *hv;
	while (hv = ++iter) {
	    const Fishery *f = hv->get_fishery();
	    if (!fishlist.find(f->get_name()) && !non_river_flist.contains(f))
		non_river_flist.insert((Fishery *) f); // cast away const
	}
    }
    nr_flist_done = TRUE;
}

// determine if a given stock is harvestable by any fishery in a list

static Bool harvestable(FisheryList &flist, const Stock &stock)
{
    for (int f=0; f < flist.num(); ++f)
	if (flist[f].get_harvest(&stock))
	    return TRUE;
    return FALSE;
}

// age specific terminal mortality for this stock over a group of fisheries

static double term_mort(const FisheryList &flist, const Stock &stock, Age age)
{
    double mort=0;
    for (int i=0; i < flist.num(); ++i) {
	Harvest *hv = flist[i].get_harvest(&stock);
	if (hv)
	    mort += hv->get_phase_mort(TERM, age);
    }
    return mort;
}

// find the index of the requested stock in the stocklist.  returns
// -1 if not found.

static int stock_index(const Stock &stock, const StockList &sl)
{
    // locate the index of the stock
    int s=0;
    while (s < sl.num() && !(stock == sl[s])) 
	++s;

    if (s == sl.num())
	s = -1;
    return s;
}

// total adult river mortality, but bounded at each age by the
// available fish
// two versions, based on either stock or stock index param
//
// precondition: fish_avail[] up to date

double FixedEscapementPolicy::
adult_river_mort(int s) const
{
    double rmort = 0;
    for (Age age=ADULT_AGE; age <= age.top(); ++age) {
	double mort = term_mort(fishlist, slist[s], age);
	rmort += ((mort < fish_avail[s][age]) ? mort : fish_avail[s][age]);
    }
    return rmort;
}

double FixedEscapementPolicy::
adult_river_mort(const Stock &stock) const
{
    int s = stock_index(stock, slist);
    if (s == -1)
	return 0;
    else
	return adult_river_mort(s);
}

// sum of available adult fish for a stock (term run - nonriver term morts)
// two versions, based on either stock or stock index param
//
// precondition: fish_avail[] up to date

double FixedEscapementPolicy::
adult_fish_avail(int s) const
{
    double fish = 0;
    for (Age age=ADULT_AGE; age <= age.top(); ++age) 
	fish += fish_avail[s][age];

    return fish;
}

inline double FixedEscapementPolicy::
adult_fish_avail(const Stock &stock) const
{
    int s = stock_index(stock, slist);
    if (s == -1)
	return 0;
    else
	return adult_fish_avail(s);
}

// take the terminal harvests using the new bounded harvest fn.  otherwise
// this is identical to the default take_terminal_harvests() routine in the
// Policy class.  this fn is called from the virtual take_river_harvests().
//
// precondition:
// 	poisson catchability coefficients must be calculated and
// 	  stored in the harvests prior to execution of this routine,
//	  as performed in take_initial_bounded_harvests();
// other pre- and post- conditions as in Policy::take_terminal_harvests()

void FixedEscapementPolicy::
take_bounded_term_harvests()
{
    for (int i=0; i < fishlist.num(); ++i) {
	const HarvestList &hvl = fishlist[i].get_harvest_list();
	hvl.traverse(&Harvest::bounded_terminal_harvest);
	fishlist[i].set_shakers(TERM);	// sets shakers in harvests
	hvl.traverse(&Harvest::terminal_cnrs);
    }
}

// do a first pass on the terminal harvests using the bounded harvest
// method.  stash fish_avail and catchability for later use.
//
// precondition: all fishlists, including non_river_flist, properly
//	initialized
// postconditions:
//	in management years:
//		local fish_avail[stocks][age] set for use by other fns;
//		catchability set in all river harvests
// also see pre and postconditions for Policy::take_terminal_harvests()

void FixedEscapementPolicy::
take_initial_bounded_harvests()
{
    // compute and save poisson catchability coefficients by age,
    // a rather involved process.  do this for all stocks harvested
    // by any river fishery
    for (int i = 0; i < ::Stocks.num(); ++i) {
	if (harvestable(fishlist, Stocks[i])) {
	    Stock &stock = ::Stocks[i];
	    for (Age age = FIRST_HV_AGE; age <= age.top(); ++age) {
		double pscal = 0;
		double term_run = stock.get_term_run(age);
		double fish = term_run - term_mort(non_river_flist, stock, age);
		if (fish < 0)
		    fish = 0;
		int s = stock_index(stock, slist);
		if (s > -1)
		    fish_avail[s][age] = fish;
		if (fish) {
		    double maxp = fish / term_run;
		    double totp = 0;
		    for (int f=0; f < fishlist.num(); ++f) {
			Harvest *hv = fishlist[f].get_harvest(&stock);
			if (hv) 
			    totp += hv->hv_rate(age);
		    }
		    if (totp <= maxp)
			pscal = 1;
		    else
			pscal = maxp / totp;
		}
		for (int f=0; f < fishlist.num(); ++f) {
		    Harvest *hv = fishlist[f].get_harvest(&stock);
		    if (hv) {
			double p = hv->hv_rate(age);
			double q;
			// check for max possible harvest
			if (p * pscal >= 1.0)
			    q = Harvest::MAX_CATCHABILITY;
			else
			    q = -log(1.0 - (p * pscal));
			hv->set_catchability(age, q);
		    }
		}
	    }
	}
    }
    // actually take the harvest
    take_bounded_term_harvests();
}

// top level routine to do the river harvest.  take terminal harvests
// using either the standard method or the bounded one, depending on
// whether management currently active.
//
// if management is active, an initial bounded terminal harvest is
// computed, at which time various other necessary parameters are also
// computed.  the remainder of this routine iterates, computing new
// terminal harvests until the modification ratio stabilizes.

void FixedEscapementPolicy::
take_river_harvests()
{
    if (!management_on()) {
	Policy::take_terminal_harvests();
	return;
    }

    // late initialization to set up the non-river fishery list.  done here,
    // where the first real use of this class takes place.
    if (!nr_flist_done)
	init_non_river_flist();
    
    take_initial_bounded_harvests();

    static const int MAX_ITER = 100;
    static const double FIXED_ESC_TOLERANCE = 0.00001;
    int count = 0;
    Bool done;
    do {
	done = TRUE;
	
	// compute newscale
	double newscale = compute_newscale();

	// check for non-harvest
	if (newscale != -1) {
	    // apply policy if appropriate.  
	    if ((count || forced_esc() || newscale < 1.0)
		&& (newscale - 1.0 > FIXED_ESC_TOLERANCE
		    || newscale - 1.0 < -FIXED_ESC_TOLERANCE)) {

		for (int i=0; i < fishlist.num(); ++i) 
		    fishlist[i].set_hv_scalar(
			fishlist[i].policy_hv_scalar() * newscale);

		take_bounded_term_harvests();
		++count;

		// if we've nuked the harvest, then stop, otherwise iterate
		if (newscale == 0)
		    done = TRUE;
		else
		    done = FALSE;
	    }
	}
    } while (!done && count < MAX_ITER);
    if (count == MAX_ITER)
	::LogMsg(L_Error, "maximum iterations (%d) exceeded while applying"
		 "\n\tin-river policy.\n", MAX_ITER);

    ::LogMsg(L_DbgMsg, "%d iterations in fixed escapement policy\n", count);
}

// compute a new scaling factor
//
// NOTE: in this routine, compute_ratio() must be called prior to
// avg_hv_rate(), for proper functioning of the strength management scenario.
// see comment under FixedEscapementStrength::avg_hv_rate()

double FixedEscapementPolicy::
compute_newscale()
{
    double ratio = compute_ratio();
    if (ratio == 0 || ratio == -1)
	return ratio;

    double avg_hr = avg_hv_rate();
    double scale = ratio * avg_hr;

    if (avg_hr <= 0.0)
	return 0;
    if (avg_hr >= 1 || scale >= 1)
	LogMsg(L_Fatal, "boundary condition failure in fixed escapements!\n");
    
    return (log(1.0 - scale) / log(1.0 - avg_hr));
}

// compute_ratio is pure virtual declared in FixedEscapementPolicy.
// all derived definitions must return a non-negative ratio,
// (possibly 0), or -1 if unable to compute (as in no terminal catch
// originally taken).
//
// all of the compute_ratio() routines require that a meaningful
// management_idl exist in the stocks.
//
// combined management option
// note: can't cause a catch if there is none to begin with

double FixedEscapementCombined::
compute_ratio()
{
    double fish_left = 0;
    for (int i=0; i < slist.num(); ++i) 
	fish_left += slist[i].management_idl() * adult_fish_avail(i);
    fish_left -= escapement_goal();

    // compute ratio.  no fish left means no terminal harvest.
    double ratio;
    if (fish_left < 0)
	ratio = 0;
    else {
	double fish_taken = 0;
	for (i=0; i < slist.num(); ++i)
	    fish_taken += slist[i].management_idl()
		* adult_river_mort(i);
	if (fish_taken == 0)
	    ratio = -1;
	else 
	    ratio = fish_left / fish_taken;
    }
    return ratio;
}

// double avg_hv_rate() implements the pure virtual in FixedEscapementPolicy.
// returns the average harvest rate over adult ages for the appropriate
// harvests, weighted by the cohort contribution to the terminal run.
//
// combined policy: average over all managed stocks and fisheries

double FixedEscapementCombined::
avg_hv_rate()
{
    double weighted_hr = 0;
    double total_weight = 0;
    int num = 0;

    for (int f=0; f < fishlist.num(); ++f) {
	for (int s=0; s < slist.num(); ++s)
	{
	    double adult_term_run = slist[s].get_adult_term_run();
	    Harvest *hv = fishlist[f].get_harvest(&slist[s]);
	    if (hv) {
		for (Age age=ADULT_AGE; age <= age.top(); ++age) {
		    double hr = 1.0 - exp(-hv->get_catchability(age));
		    double weight = slist[s].get_term_run(age) / adult_term_run;
		    weighted_hr += hr*weight;
		    total_weight += weight;
		}
	    }
	}
    }
    return (total_weight ? weighted_hr / total_weight : 0);
}


// compute_ratio is pure virtual declared in FixedEscapementPolicy.
// all derived definitions must return a non-negative ratio,
// (possibly 0), or -1 if unable to compute (as in no terminal catch
// originally taken).
//
// all of the compute_ratio() routines require that a meaningful
// management_idl exist in the stocks.
//
// strong/weak management option - returns the ratio for the "strength"
// stock, which is the stock with the largest stock ratio (STRONG mngmt)
// or smallest ratio (WEAK mngmt.)  Also records which stock was used, for
// later use by this and other routines (e.g.avg_hv_rate()).
//
// note: can't cause a catch if there is none to begin with

double FixedEscapementStrength::
compute_ratio()
{
    double ratio;

    // if we've already identified the indicator stock in this year,
    // then we shouldn't do it again.
    if ((int)year() == this_year)
	ratio = compute_stock_ratio(*strength_stock);
    else {
	// strong management uses the largest stock ratio,
	// weak uses the smallest
	ratio = (type==STRONG) ? -HUGE_VAL : HUGE_VAL;
	for (int i=0; i < slist.num(); ++i) {
	    double r1 = compute_stock_ratio(slist[i]);
	    if ((type==STRONG && (r1 > ratio))
		|| (type==WEAK && (r1 < ratio))) {
	    
		// keep track of which stock had the largest/smallest ratio
		ratio = r1;
		strength_stock = &slist[i];
	    }
	}
    }
    this_year = year();
    return ratio;
}

// utility routine to do the real work of compute_ratio() for strength
// management.
// returns non-negative ratio, or -1.

double FixedEscapementStrength::
compute_stock_ratio(const Stock &stock)
{
    double fish_left = adult_fish_avail(stock)
	- stock.escapement_goal() / stock.management_idl();

    // compute ratio.  no fish left means no terminal harvest.
    double ratio;
    if (fish_left < 0)
	ratio = 0;
    else {
	double fish_taken = adult_river_mort(stock);
	if (fish_taken == 0)
	    ratio = -1;
	else
	    ratio = fish_left / fish_taken;
    }
    return ratio;
}

		    
// double avg_hv_rate() implements the pure virtual in FixedEscapementPolicy.
// returns the average harvest rate over adult ages for the appropriate
// harvests, weighted by the cohort contribution to the terminal run.
//
// strength policy: use average over ages from only the "strength" stock,
// which was identified the last time compute_ratio() occurred.  this means
// that compute_ratio() for this particular policy in this year must be
// called prior to this routine.
//
// precondition: strength stock previously identified as described above.

double FixedEscapementStrength::
avg_hv_rate()
{
    double weighted_hr = 0;
    double total_weight = 0;
    int num = 0;

    if (!strength_stock) {
	::LogMsg(L_Fatal, "programmer error in fixed escapement strength:\n"
		 "\tno strength stock for avg hr rate computation.\n");
    }

    double adult_term_run = strength_stock->get_adult_term_run();
    for (int f=0; f < fishlist.num(); ++f) {
	Harvest *hv = fishlist[f].get_harvest(strength_stock);
	if (hv) {
	    for (Age age=ADULT_AGE; age <= age.top(); ++age) {
		double hr = 1.0 - exp(-hv->get_catchability(age));
		double weight =
		    strength_stock->get_term_run(age) / adult_term_run;
		weighted_hr += hr*weight;
		total_weight += weight;
	    }
	}
    }
    return (total_weight ? weighted_hr / total_weight : 0);
}
