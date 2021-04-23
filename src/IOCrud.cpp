/* Routines to read in the input from PSC style data files.  This will
 * all be dumped later, in favor of our infinitely superior token-based
 * parsing scheme.
 *
 * Note that at the moment this file includes some class implementations
 * for parsing.  These will be put in their proper files when the Big Change
 * comes.
 */
#include <ctype.h>
#include <stdio.h>
#include <string.h>
#ifdef WIN32
#include <iostream.h>
#else
#include <unistd.h>
#include <strings.h>
#endif
#include <assert.h>
#include "strtools.h"
#include "IOCrud.h"
#include "globals.h"
#include "statistics.h"
#include "Calibrator.h"
#include "Fishery.h"
#include "Harvest.h"
#include "Stock.h"
#include "FisheryManagement.h"
#include "CNR.h"
#include "log.h"
#include "tokens.h"
#include "parseutil.h"
#include "NaturalProduction.h"
#include "HatcheryProduction.h"
#include "HatchSurplusProduction.h"
#include "MonteControl.h"
#include "MonteStockIntrfc.h"
#include "MonteStockTracking.h"
#include "Bootstrap.h"
#include "Stochastic.h"

// static definition of psc_output helper class to store output config
psc_output IOCrud::psc_out;

// forward declaration
static int skip_lines(int num, FILE *fp, char *err_str);

/********************************************************************
 * this section of this file contains implementations for other classes.
 * they are here because they will go away when this file does.
 * they are only used by other functions in this file
 *
 * all functions return 0 on success and non-zero on error
 ********************************************************************/


inline int Fishery::parse_net_age(IOCrud *psc)
{
    // the term net age has already been parsed, but not put in place
    
    term_net_age.assign_from_int(psc->get_term_net_age());
    return 0;
}

int Fishery::parse_name_and_gear(IOCrud *psc)
{
    char fname[MAX_TOKEN_LEN];

    if (fscanf(psc->b_fp(), " %[^\n]\n", fname) != 1)
    {
	::LogMsg(L_Error, "bad fishery name\n");
	return 1;
    }
    int len = strlen(fname);
    name = new char[len+1];
    assert(name != 0);
    strcpy(name, fname);

    // type is inferred from last char of name
    switch(name[len-1])
    {
      case 'T':
	gear = TROLL; break;
      case 'N':
	gear = NET; break;
      case 'S':
	gear = SPORT; break;
      default:
	::LogMsg(L_Error, "unrecognized gear type for %s\n", name);
	return 1;
    }
    return 0;
}

// read pnvs into the FisheryTactics object
inline int Fishery::parse_pnv(IOCrud *psc)
{
    return tactics.read_default_pnvs(psc);
}

// read the default pnvs, and copy them into all years.
int FisheryTactics::read_default_pnvs(IOCrud *psc)
{
    for (Age age = FIRST_HV_AGE; age <= age.top(); ++age)
    {
	if (fscanf(psc->b_fp(), "%lf", &pnvs[age][0]) != 1)
	{
	    ::LogMsg(L_Error, "bad pnv\n");
	    return 1;
	}
	for (int i=1; i < Chronographer->nyears(); ++i)
	    pnvs[age][i] = pnvs[age][0];
    }
    return 0;
}

// this one is a little strange, because it acts on all fisheries
// it parses the shaker morts (incidental mortality rates)
int Fishery::parse_imrs(IOCrud *psc)
{
    double imr_troll, imr_net, imr_sport;
    if (fscanf(psc->b_fp(), "%lf %lf %lf",
	       &imr_troll, &imr_net, &imr_sport) != 3)
    {
	::LogMsg(L_Error, "bad imrs\n");
	return 1;
    }
    for (int i = 0; i < Fisheries.num(); ++i)
    {
	if (Fisheries[i].gear == TROLL)
	    Fisheries[i].shaker_mort_rate = imr_troll;
	else if (Fisheries[i].gear == NET)
	    Fisheries[i].shaker_mort_rate = imr_net;
	else if (Fisheries[i].gear == SPORT)
	    Fisheries[i].shaker_mort_rate = imr_sport;
    }
    return 0;
}

int Fishery::parse_ocn_net(IOCrud *psc)
{
    int ocn_net;

    if (fscanf(psc->b_fp(), "%d", &ocn_net) != 1)
    {
	::LogMsg(L_Error, "bad ocean net flag\n");
	return 1;
    }
    ocn_net_flg = Bool(ocn_net);
    return 0;
}

// read the optional cnr data for this fishery.  expects cnr_fp to be valid.

int Fishery::parse_cnrs(IOCrud *psc, int first_year_index, int last_year_index)
{
    double legal, sublegal;
    if (fscanf(psc->cnr_fp(), "%lf , %lf%*[^\n]", &legal, &sublegal) != 2)
    {
	::LogMsg(L_Error, "trouble reading cnr selectivities for %s\n", name);
	return 1;
    }
    int err_year = tactics.read_cnrs(psc, first_year_index, last_year_index,
				    legal, sublegal);
    if (err_year)
    {
	::LogMsg(L_Error, "trouble reading cnr data for %s in year %d\n",
		name, Chronographer->base_year() + err_year - 1);
	return 1;
    }

    return 0;
}

// read the cnr data for this tactics.  cnr_fp must be valid.  first is
// first year array index, last is last year array index.

int FisheryTactics::read_cnrs(IOCrud* psc, int first, int last,
			     double lsel, double slsel)
{
    int flag, method;
    
    if (first < 0)
    {
	if (skip_lines(1 + -first , psc->cnr_fp(),
		       "trouble skipping cnr years\n"))
	    return 1;
	first = 0;
    }
    int last_skip = 0;
    if (last > nyears()-1)
    {
	last_skip = last - (nyears() -1);
	last -= last_skip;
    }
    for (int year = first; year <= last; ++year)
    {
	if (fscanf(psc->cnr_fp(), "%d", &flag) != 1)
	    return year+1;

	if (flag)
	{
	    if (fscanf(psc->cnr_fp(), " , %d", &method) != 1)
	    	return year+1;
	    
	    switch (method)
	    {
	    case 0:			// rt method
		cnrs[year] = new CNR_HarvestRatio(lsel, slsel);
		break;
	    case 1:			// season length method
		cnrs[year] = new CNR_SeasonLength(lsel, slsel);
		break;
	    case 2:			// reported encounter method
		cnrs[year] = new CNR_ReportedEncounter(lsel, slsel);
		break;
	    case 3:			// WAG method
		cnrs[year] = new CNR_WildAssGuess(lsel, slsel);
		break;		
	    }
	    if (! cnrs[year])
	    {
		::LogMsg(L_Error, "cnr allocation failure!\n");
		return year+1;
	    }

	    if (cnrs[year]->read_cnr(psc) != 0)
		return year+1;
	}
	else fscanf(psc->cnr_fp(), "%*[^\n]"); // no cnr, only a comment
    }
    if (last_skip)
    {
	if (skip_lines(1 + last_skip , psc->cnr_fp(),
		       "trouble skipping cnr years\n"))
	    return 1;
    }
    return 0;
}

int CNR_HarvestRatio::read_cnr(IOCrud* psc)
{
    // only a comment
    fscanf(psc->cnr_fp(), "%*[^\n]");
    return 0;
}

// the dumb commas are before each piece of data

int CNR_SeasonLength::read_cnr(IOCrud* psc)
{
    if (fscanf(psc->cnr_fp(), " , %lf , %lf%*[^\n]",
	       &legal_season_len, &cnr_season_len) != 2)
	return 1;
    else
	return 0;
}

int CNR_WildAssGuess::read_cnr(IOCrud* psc)
{
    if (fscanf(psc->cnr_fp(), " , %lf%*[^\n]",   &cnr_season_fraction) != 1){
	if(cnr_season_fraction>1.0)   cnr_season_fraction=1.0;
	if(cnr_season_fraction<0.0)   cnr_season_fraction=0.001;
	printf("cnr_season_fraction = %lf\n",cnr_season_fraction);
	return 1;
    }
    else
	return 0;
}

int CNR_ReportedEncounter::read_cnr(IOCrud* psc)
{
    if (fscanf(psc->cnr_fp(), " , %lf , %lf , %lf%*[^\n]",
	       &rpt_legal_enc, &rpt_sublegal_enc, &rpt_catch) != 3)
	return 1;
    else
	return 0;
}

// read the optional pnv file into this fishery.  calling fn closes file.
// precondition: pnv_fp valid and pointing at year information

int Fishery::parse_opt_pnvs(IOCrud* psc)
{
    int first_year, last_year;
    
    if (fscanf(psc->pnv_fp(), "%d %d", &first_year, &last_year) != 2)
	return 1;

    first_year -= psc->get_base_year();
    last_year  -= psc->get_base_year();

    // check header info
    if (psc->get_num_years() != Chronographer->nyears())
    {
	::LogMsg(L_Error, "bad pnv header\n");
	return 1;
    }

    // have the tactics object read the data
    if (tactics.read_pnvs(psc, first_year, last_year))
	return 1;

    return 0;
}

// read the optional pnv file data into this fishery tactics object.
// params: IOCrud ptr,
//	   first element of array (year) to fill
//	   last  ""

int FisheryTactics::read_pnvs(IOCrud *psc, int first, int last)
{
    for (Age age = FIRST_HV_AGE; age <= age.top(); ++age)
    {
	for (int i = first; i <= last; ++i)
	{
	    if (i < 0 || i >= nyears())
		fscanf(psc->pnv_fp(), "%*lf");
	    else
	    {
		if (fscanf(psc->pnv_fp(), "%lf", &pnvs[age][i]) != 1)
		    return 1;
	    }
	}
	// copy last value into remaining years
	for (i = last+1; i < nyears(); ++i)
	    pnvs[age][i] = pnvs[age][last];
    }
    return 0;
}

// a chain of funtions to read the ceiling data.  the file pointer should
// be at the first line of catch data for this fishery.
// parameters are:  IOCrud* pointer to IOCrud,
//		    int size of base period (number of years)
//		    int first, last year of ceiling management
//		    int number of ceiling changes
//		    int* array of years in which ceiling changes occur

// the fishery ceiling fn calls the tactics one with the same params and
// reports errors

int Fishery::parse_clngs(IOCrud *psc, int base_size,
				int first_clng_year, int last_clng_year,
				int num_change_years, int *change_years)
{
    // mark this fishery as ceilinged
    policy_type_ = Policies::CEILING;
    if (tactics.read_ceilings(psc, base_size, first_clng_year, last_clng_year,
			     num_change_years, change_years))
    {
	::LogMsg(L_Error, "problem reading ceiling data for %s\n", name);
	return 1;
    }
    else return 0;
}

// the tactics ceiling fn creates the ceiling object, then calls its member
// fn to actually read the data

int FisheryTactics::read_ceilings(IOCrud *psc, int base_size,
					int first_clng_year, int last_clng_year,
					int num_change_years, int *change_years)
{
    ceiling = new Ceiling(first_clng_year, last_clng_year);
    return ceiling->read_ceilings(psc, base_size,
				  num_change_years, change_years);
}

int Ceiling::read_ceilings(IOCrud *psc, int base_period_size,
			   int num_change_years, int *change_years)
{
    unsigned int year;
    double f_catch;
    double total = 0;
    
    // read in base period catches and compute average
    for (size_t i=0; i < (size_t)base_period_size; ++i)
    {
	if (fscanf(psc->clng_fp(), "%lf , %d%*[^\n]", &f_catch, &year) != 2
		|| year != base_year() + i)
	{
	    ::LogMsg(L_Error, "trouble reading ceiling base period year %d\n",
		     year);
	    return 1;
	}
	total += f_catch;
    }
    initial_base_catch = total / base_period_size;
    
    // next line is first ceiling year
    if (fscanf(psc->clng_fp(), "%lf , %d%*[^\n]", &f_catch, &year) != 2
	|| year != first+base_year())
	return 1;

    // initial_ratios[] in the ceiling stores the initial conversion
    // ratios, identical for both phases.
    initial_ratios[0] = f_catch / initial_base_catch;
    
    // read in the catchs for each change year; use array indices 
    int prev_year = year - base_year() - first;	
    for (i = 0; i < (size_t)num_change_years; ++i)
    {
	if (fscanf(psc->clng_fp(), "%lf , %d%*[^\n]", &f_catch, &year) != 2
	    || (int)year != change_years[i] || year <= base_year() + first
	    || year > base_year() + last
	    || year <= base_year() + prev_year + first)
	{
	    ::LogMsg(L_Error, "bad ceiling year %d\n", year);
	    return 1;
	}
	// convert year to array index
	year = year - base_year() - first;
	
	// copy data from previous years into intervening years, then set new
	for (size_t j = prev_year + 1; j < year; ++j)
	    initial_ratios[j] = initial_ratios[prev_year];
	initial_ratios[year] = f_catch / initial_base_catch;

	prev_year = year;
    }
    // one more copy, from last change year through last ceiling year
    for (size_t j = prev_year + 1; j < last - first + 1; ++j)
	initial_ratios[j] = initial_ratios[prev_year];

    // now read the force ceiling data
    size_t num_forces;
    if (fscanf(psc->clng_fp(), "%d%*[^\n]", &num_forces) != 1
	|| num_forces > first - last + 1)
    {
	::LogMsg(L_Error, "bad force ceiling data\n");
	return 1;
    }
    for (i = 0; i < num_forces; ++i)
    {
	if (fscanf(psc->clng_fp(), "%d", &year) != 1
	    || year < base_year() + first
	    || year > base_year() + last)
	{
	    ::LogMsg(L_Error, "bad force ceiling data\n");
	    return 1;
	}
	forced[year - base_year() - first] = 1;
    }
    // skip to the end of the line
    if (skip_lines(1, psc->clng_fp(), "EOF while reading ceilings.\n"))
	return 1;
    
    // copy force flag (if set) from last change year through last ceiling year
//    if (forced[prev_year])
//	for (j = prev_year + 1; j < last - first + 1; ++j)
//	    forced[j] = forced[prev_year];

    return 0;
}

int Harvest::parse_termpt(IOCrud *psc)
{
    int termpt;

    if (fscanf(psc->b_fp(), "%d", &termpt) != 1)
    {
	::LogMsg(L_Error, "bad terminal flag\n");
	return 1;
    }
    terminal = Bool(termpt);
    return 0;
}

int Harvest::parse_hr(IOCrud *psc)
{
    for (Age age = FIRST_HV_AGE; age <= age.top(); ++age)
	if (fscanf(psc->s_fp(), "%lf", &harvest_rate[age]) != 1)
	{
	    ::LogMsg(L_Error, "bad harvest rate\n");
	    return 1;
	}
    return 0;
}

// get the fp for this harvest; just calls tactics fn to do the work

inline int Harvest::parse_fp(IOCrud *psc, int year)
{
    return (tactics.parse_fp(psc, year));
}
    
// read the optional fp file data into this harvest tactics object.
// precondition: fp file open with pointer in proper location for this harvest.

int HarvestTactics::parse_fp(IOCrud *psc, int year)
{
    if (fscanf(psc->fp_fp(), "%lf", &fps[year]) != 1)
    {
	::LogMsg(L_Error, "problem with fp data\n");
	return 1;
    }
    return 0;
}

/*
 * all the Stock and StockConfig low level parsing fns.
 * return: 0 on success
 *	   non-0 on error
 */

int Stock::parse_term_stats_age(IOCrud *psc)
{
    // the term stats age has already been parsed, but not put in place

    // this is ugly.  subtract one from the numerical age to make it
    // conform to the enum Age values.  

    term_stats_age.assign_from_int(psc->get_term_stats_age());
    return 0;
}

// surv_rt
int Stock::parse_surv_rt(IOCrud *psc)
{
    for (Age age = AGE1; age <= age.top(); ++age)
    {
	if (fscanf(psc->b_fp(), "%lf", &surv_rt[age]) != 1)
	{
	    ::LogMsg(L_Error, "bad survival rate\n");
	    return 1;
	}
	surv_rt[age] = 1.0 - surv_rt[age];
    }
    
    return 0;
}

// adult eqs
int StockConfig::parse_default_adult_eqs(IOCrud *psc)
{
    for (Age age = FIRST_HV_AGE; age <= age.top(); ++age)
    {
	if (fscanf(psc->s_fp(), "%lf", &adult_eqs[age][0]) != 1)
	{
	    ::LogMsg(L_Error, "bad adult equivalence\n");
	    return 1;
	}
	// copy into remaining years
	for (int i=0; i < nyears(); ++i)
	    adult_eqs[age][i] = adult_eqs[age][0];
    }
    return 0;
}

inline int Stock::parse_adult_eqs(IOCrud *psc, int year)
{
    return config.parse_adult_eqs(psc, year);
}

int StockConfig::parse_adult_eqs(IOCrud *psc, int yr)
{
    for (Age age=AGE2; age <= AGE4; ++age)
	if (fscanf(psc->mat_fp(), "%lf", &adult_eqs[age][yr]) != 1)
	    return 1;
    return 0;
}

// maturation rates
int StockConfig::parse_default_maturation_rates(IOCrud *psc)
{
    for (Age age = FIRST_HV_AGE; age <= age.top(); ++age)
    {
	if (fscanf(psc->s_fp(), "%lf", &maturation_rates[age][0]) != 1)
	{
	    ::LogMsg(L_Error, "bad maturation rate\n");
	    return 1;
	}
	for (int i=1; i < nyears(); ++i)
	    maturation_rates[age][i] = maturation_rates[age][0];
    }
    return 0;
}

inline int Stock::parse_maturation_rates(IOCrud *psc, int year)
{
    return config.parse_maturation_rates(psc, year);
}

int StockConfig::parse_maturation_rates(IOCrud *psc, int yr)
{
    // read and set maturation data
    for (Age age = AGE2; age <= AGE4; ++age)
	if (fscanf(psc->mat_fp(), "%lf", &maturation_rates[age][yr]) != 1)
	    return 1;
    return 0;
}

// idls
int StockConfig::parse_default_inter_dam_loss(IOCrud *psc)
{
    if (fscanf (psc->b_fp(), "%lf", &inter_dam_losses[0]) != 1)
    {
	::LogMsg(L_Error, "unable to read inter_dam_loss\n");
	return 1;
    }
    for (int i=1; i < nyears(); ++i)
	inter_dam_losses[i] = inter_dam_losses[0];
    
    return 0;
}

inline int Stock::parse_opt_idls(IOCrud *psc, int first_year, int num_years)
{
    return config.parse_variable_inter_dam_loss(psc, first_year, num_years);
}

int StockConfig::parse_variable_inter_dam_loss(IOCrud *psc,
					       int first_year, int n_years)
{
    double val;
    for (int i = 0; i < n_years; ++i)
    {
	if (fscanf(psc->idl_fp(), "%lf %*[,]", &val) != 1)
	{
	    ::LogMsg(L_Error, "trouble reading idls\n");
	    return 1;
	}
	if (first_year + i >= base_year()
	    && first_year + i < base_year() + nyears())
	    inter_dam_losses[first_year + i - base_year()] = val;
    }
    // assign the last value to all remaining years
    for (i = first_year + n_years - base_year(); i < nyears(); ++i)
	inter_dam_losses[i] = val;
    
    return 0;
}

int Stock::parse_hunk(IOCrud *psc)
{
    char fname[MAX_TOKEN_LEN];
    double rick_a, sopt;
    int hatch_flag, skip_msh;
    
    // base file first
    if (fscanf(psc->b_fp(), " %[^,],", fname) != 1)
    {
	::LogMsg(L_Error, "bad stock name\n");
	return 1;
    }
    // strip trailing blank space
    int len = strlen(fname);
    while (len && (fname[len-1] == ' ' || fname[len-1] == '\t'))
	fname[--len] = 0;
    name = new char[strlen(fname)+1];
    assert(name != 0);
    strcpy(name, fname);
    if (fscanf(psc->b_fp(), "%lf %lf", &rick_a, &sopt) != 2)
    {
	::LogMsg(L_Error, "unable to read ricker params\n");
	return 1;
    }
    
    if (config.parse_default_inter_dam_loss(psc))
    {
	return 1;
    }
    
    if (fscanf(psc->b_fp(), "%d %d", &hatch_flag, &skip_msh) != 2)
    {
	::LogMsg(L_Error, "unable to read hatch and msh flags\n");
	return 1;
    }
    
    if (fscanf(psc->b_fp(), " ,%[^,], %lf", fname, &scale2to1) != 2)
    {
	::LogMsg(L_Error, "unable to read base stock data fname or scale\n");
	return 1;
    }
    // strip trailing blank space
    len = strlen(fname);
    while (len && (fname[len-1] == ' ' || fname[len-1] == '\t'))
	fname[--len] = 0;
    
    abbrv = new char[strlen(fname)+1];
    assert(abbrv != 0);
    strcpy(abbrv, fname);
    
    // set up the correct Production object
    
    static NaturalProduction *gst_natprod = 0;
    if (hatch_flag)
    {
	if (!strcmp(abbrv, "GSH")) 		// ugly special case
	{
	    if (!gst_natprod)
	    {
		::LogMsg(L_Error, "unable to find GST for "
			 " GSH production initialization.\n"
			 " Natural stock must appear first in .bse file\n");
		return 1;
	    }
	    production =
		new HatchSurplusProduction(this, gst_natprod,
					   rick_a, sopt,
					   (skip_msh) ? TRUE : FALSE,
					   (psc->get_enh_dens_dep()) ? TRUE : FALSE);
	}
	else
	    // standard hatchery production
	    production = new HatcheryProduction(this, rick_a, sopt);
    }
    else if (!hatch_flag)
    {
	NaturalProduction *natprod;
	production = natprod =
	    new NaturalProduction(this, rick_a, sopt,
				  (skip_msh) ? TRUE : FALSE,
				  (psc->get_enh_dens_dep()) ? TRUE : FALSE);
	
	// snag the ugly special case for GST
	if (!strcmp(abbrv, "GST"))
	    gst_natprod = natprod;
    }
    else
    {
	::LogMsg(L_Error, "unable to determine production type for %s\n",
		 name);
	return 1;
    }
    
    // on to the stock file
    if (fscanf(psc->s_fp(), "%s", fname) != 1)
    {
	::LogMsg(L_Error, "bad stock abbrev %s in stock file\n", fname);
	return 1;
    }
    if (strcmp(abbrv, fname) != 0)
    {
	::LogMsg(L_Error, "unable to match stock abbrevs:\n"
	    "\t%s in .bse with %s in .stk\n", abbrv, fname);
	return 1;
    }
    for (Age age = FIRST_HV_AGE; age <= age.top(); ++age)
	if (fscanf(psc->s_fp(), "%lf", &initial_cohort[age]) != 1)
	{
	    ::LogMsg(L_Error, "bad cohort abundance\n");
	    return 1;
	}

    if (config.parse_default_maturation_rates(psc))
	return 1;
    if (config.parse_default_adult_eqs(psc))
	return 1;
    
    return 0;
}


/*******************************************************************
 * some utility fns
 *******************************************************************/

// skip lines - return 0 on success, 1 on failure

static int skip_lines(int num, FILE *fp, char *err_str)
{
    char tmps[LINE_LENGTH];
    
    for (int i=0; i < num; ++i)
	if (! fgets(tmps, LINE_LENGTH-1, fp))
	{
	    ::LogMsg(L_Error, err_str);
	    fclose(fp);
	    return 1;
	    }

//	fscanf(fp, "%*[^\n]\n");
    return 0;
}

inline int skip_comment(FILE *fp)
{
    return skip_lines(1, fp, "error skipping comment");
}

// external interface
int SkipComment(FILE *fp)
{
    return skip_comment(fp);
}

/*******************************************************************
 * the rest of the PSC input crud follows
 *******************************************************************/

/*
 * read the save stats configuration.
 * precondition: config file open and pointing to save stats designator line
 * postcondition: any requested data read and appropriate flags thrown,
 *	file pointer at start of next line after this data.
 *	file closed on error condition.
 * return: 0 on success, non-zero on error.
 */

int IOCrud::read_save_stats()
{
    char tmps[MAX_TOKEN_LEN]; tmps[0] = 0;
    int erc = 0;
    
    if (fscanf(config_fp, " %[^,\n\t ]", tmps) != 1 || skip_comment(config_fp))
	erc = 1;
    else if (tmps[0] == 'y' || tmps[0] == 'Y')
    {
	int t1, t2, t3, t4;			// tmp vars
	
	// get the output file prefix and the save stat selections
	if ((fscanf(config_fp, " %[^,\n\t ]", psc_out.file_prefix) != 1)
	    || skip_comment(config_fp)
	    || (fscanf(config_fp, "%d", &t1) != 1) || skip_comment(config_fp)
	    || (fscanf(config_fp, "%d", &t2) != 1) || skip_comment(config_fp)
	    || (fscanf(config_fp, "%d", &t3) != 1) || skip_comment(config_fp)
	    || (fscanf(config_fp, "%d", &psc_out.ohr_opt) != 1)
	    || skip_comment(config_fp)
	    || (fscanf(config_fp, "%d", &psc_out.thr_opt) != 1)
	    || skip_comment(config_fp)
	    )
	    erc = 1;

	tmps[0] = '\0';
	if ((fscanf(config_fp, "%d%[^,\n]", &psc_out.mrt_opt, tmps) < 1)
	    || skip_comment(config_fp))
	    erc = 1;
	
	char *tstr = strchr(tmps, ',');
	if (tstr) *tstr = '\0';
	psc_out.mrt_stocks = new char[strlen(tmps) + 1];
	assert(psc_out.mrt_stocks);
	strcpy(psc_out.mrt_stocks, tmps);	

	if ((fscanf(config_fp, "%d", &t4) != 1) || skip_comment(config_fp))
	    erc = 1;

	if (!erc)
	{
	    psc_out.stat_flags = 0;
	    if (t1) psc_out.stat_flags |= psc_out.CATCH;
	    if (t2) psc_out.stat_flags |= psc_out.TERM;
	    if (t3) psc_out.stat_flags |= psc_out.ESC;
	    if (t4) psc_out.stat_flags |= psc_out.I_MORT;
	}
	
	// get the fishery selections
	if (!erc && !(erc = (fscanf(config_fp,"%d", &t1) != 1) ? 1 : 0))
	{
	    skip_comment(config_fp);

	    // very implementation dependent.  good thing this all goes
	    // away eventually.
	    
	    if (t1 > 64)
	    {
		erc = 1;
		::LogMsg(L_Error, "%d is too many fisheries.  "
			 "Current max is 64.\n", t1);
	    }
	    else
	    {
		psc_out.fishery_flags = 0;
		for (int i=0; i < t1; ++i)
		{
		    if (erc =((fscanf(config_fp,"%d", &t2) != 1)
			      || skip_comment(config_fp))
			? 1 : 0)
			break;
		    else
			psc_out.fishery_flags |= (unsigned long) 1 << (t2 - 1);
		}
	    }
	}
    }
    
    if (erc)
    {
	::LogMsg(L_Error, "trouble reading save stats from config file.\n");
	fclose(config_fp);
	return 1;
    }
    return 0;
}

/*
 * read additional save stats configuration.  painfully like the standard
 * save stats, but appearing at the end of the config file.
 *
 * precondition: config file open and pointing to save additional stats
 *      designator line 
 * postcondition: any requested data read and appropriate flags thrown,
 *	file pointer at start of next line after this data.
 *	file closed on error condition.
 * return: 0 on success, non-zero on error.
 */

int IOCrud::read_additional_save_stats()
{
    char tmps[MAX_TOKEN_LEN]; tmps[0] = 0;
    int erc = 0;

    // output prefix must already have been specified
    if (!psc_out.file_prefix[0])
    {
	LogMsg(L_Error,
	       "output file prefix must be specified for output statistics\n");
	return 1;
    }

    // get the stock selections
    int nstocks = 0;
    if (!(erc = (fscanf(config_fp,"%d", &nstocks) != 1) ? 1 : 0))
    {
	erc += skip_comment(config_fp);

	// very implementation dependent.  good thing this all goes
	// away eventually.
	    
	if (nstocks > 64)
	{
	    erc = 1;
	    ::LogMsg(L_Error, "%d is too many stocks.  "
		     "Current max is 64.\n", nstocks);
	}
	else
	{
	    for (int i=0; i < nstocks; ++i)
	    {
		int s;
		if (erc =((fscanf(config_fp,"%d", &s) != 1)
			      || skip_comment(config_fp))
		    ? 1 : 0)
		    break;
		else
		    psc_out.stock_flags |= (unsigned long) 1 << (s - 1);

		// currently OCN_CAT is the default file to write
		psc_out.stat_flags |= psc_output::OCN_CAT;
	    }
	}
    }
    
    if (erc)
    {
	::LogMsg(L_Error,
		 "trouble reading additional save stats from config file.\n");
	fclose(config_fp);
	return 1;
    }
    return 0;
}

/*
 * read in a set of pnv filenames from the config file.
 * precondition: config file open, filepointer at first pnv filename,
 *	num_pnv_fnames contains number of files to read.
 * postcondition: config file fp after last pnv filename.
 * return: 0 on success, non-zero on error.
 */

int IOCrud::read_pnv_fnames()
{
    char tmps[MAX_TOKEN_LEN];
    
    if (num_pnv_fnames < 0)
	return 1;
    pnv_fnames = (char **) new char* [num_pnv_fnames];
    assert(pnv_fnames);
    for (int i=0; i < num_pnv_fnames; ++i)
    {
	if (fscanf(config_fp, " %[^,\n\t ]", tmps) != 1
	    || skip_comment(config_fp))
	    return 1;
	pnv_fnames[i] = (char *) new char[strlen(tmps)+1];
	assert(pnv_fnames[i]);
	strcpy(pnv_fnames[i], tmps);
    }
    return 0;
}

/*
 * read all of the optional pnv tactics data into the appropriate fisheries.
 * this consists of going through the pnv filenames, finding the
 * corresponding fishery (string match on name), then reading the file data.
 *
 * precondition: global fisheries structure must exist
 * return: 0 on success, non-zero on error
 */

int IOCrud::read_pnv_data()
{
    int f;
    int erc = 0;
    for (int i=0; i < num_pnv_fnames; ++i)
    {
	char *fn = pnv_fnames[i];
	if ( ! (cur_pnv_fp = fopen(fn, "r")))
	{
	    ::LogMsg(L_Error, "cannot open pnv file %s\n", fn);
	    erc = 1;
	    continue;
	}
	if (fscanf(cur_pnv_fp, "%d", &f) != 1 || f < 1 || f > Fisheries.num())
	{
	    ::LogMsg(L_Error, "bad fishery #%d in %s\n", f, fn);
	    fclose(cur_pnv_fp);
	    erc = 1;
	    continue;
	}
	f -= 1;				// convert f to array index
	
	if (Fisheries[f].parse_opt_pnvs(this))
	{
	    ::LogMsg(L_Error, "problem reading pnv file %s\n", fn);
	    fclose(cur_pnv_fp);
	    erc = 1;
	    continue;
	}
	fclose(cur_pnv_fp);
    }
    return erc;
}

/*
 * read the idl data from the specified file into the appropriate
 * stocks.  no file specified by user is indicated with a null string
 * for the filename.
 *
 * precondition: global stocks structure must exist, including config members
 * return: 0 on success, non-zero on error
 */

int IOCrud::read_idl_data()
{
    int erc = 0;
    if (!idl_fn[0])
	return 0;
    if ( ! (opt_idl_fp = fopen(idl_fn, "r")))
    {
	::LogMsg(L_Error, "cannot open idl file %s\n", idl_fn);
	return 1;
    }
    
    int nstocks;
    if (fscanf(opt_idl_fp, "%d", &nstocks) != 1 || nstocks< 1
	|| nstocks > Stocks.num())
    {
	::LogMsg(L_Error, "bad number of stocks in %s\n", idl_fn);
	fclose(opt_idl_fp);
	return 1;
    }
    
    for (int i=0; i < nstocks; ++i)
    {
	char stock_abbrv[MAX_TOKEN_LEN];
	if (fscanf(opt_idl_fp, "%s", stock_abbrv) != 1)
	{
	    ::LogMsg(L_Error, "bad stock abbrv %s\n", stock_abbrv);
	    erc = 1; break;
	}
	
	int first, last;
	fscanf(opt_idl_fp, "%d %d", &first, &last);
	if (first > last)
	{
	    ::LogMsg(L_Error, "years out of range in idl file %s\n", idl_fn);
	    erc = 1; break;
	}
	int found = 0;
	for (int j=0; j < Stocks.num(); ++j)
	{
	    if (!strcmp(stock_abbrv, Stocks[j].get_abbrv()))
	    {
		found = 1;
		if (Stocks[j].parse_opt_idls(this, first, last - first + 1) !=0)
		{
		    fclose(opt_idl_fp);
		    return 1;
		}
	    }
	}
	if (!found)
	{
	    ::LogMsg(L_Error, "stock %s in idl file not found\n", stock_abbrv);
	    erc = 1; break;
	}
    }
    fclose(opt_idl_fp);
    return erc;
}

/*
 * read all of the optional fp tactics data into the appropriate harvests.
 *
 * precondition: fp filename set, num_years set,
 *		 global harvest list exists, UNPRUNED!
 * return: 0 on success, non-zero on error
 */

int IOCrud::read_fp_data()
{
    if ( ! (opt_fp_fp = fopen(fp_fn, "r")))
    {
	::LogMsg(L_Error, "cannot open fp file %s\n", fp_fn);
	return 1;
    }
    // for every year, traverse the harvests in order, reading an fp at each.
    // note the dependency on the proper ordering.  blech.
    for (int yr=0; yr < num_years; ++yr)
    {
	for (Harvest *hv = Harvests.head(); hv; hv = Harvests.next())
	    if (hv->parse_fp(this, yr) != 0)
	    { fclose(opt_fp_fp); return 1; }
    }
    fclose(opt_fp_fp);
    return 0;
}

/*
 * read all of the optional ev scalar config data into the appropriate stocks.
 * first checks to see if ev data exists.  if so, the ev file is opened,
 * the header parsed, then for each stock the data is read and the
 * add_ev_scalars() method called.  stocks are identified by index.
 *
 * precondition: global stocks structure must exist, and Chronographer
 *
 * return: 0 on success, non-zero on error
 */

int IOCrud::read_ev_data()
{
    FILE *opt_ev_fp;
    int erc = 0;
    if (num_ev_stocks == 0)
	return 0;			// no optional ev data
    
    if ( ! (opt_ev_fp = fopen(ev_fn, "r")))
    {
	::LogMsg(L_Error, "cannot open ev file %s\n", ev_fn);
	return 1;
    }
    
    int start_year, end_year;
    fscanf(opt_ev_fp, "%d%*[^\n]", &start_year);
    fscanf(opt_ev_fp, "%d%*[^\n]", &end_year);
    
    // make the array of evancement changes, which will be copied
    double *evs = new double[Chronographer->nyears()];
    if (!evs)
	LogMsg(L_Fatal, "trouble allocating mem for ev scalars.\n");

    // vars for monte control
    int last_seed = -1;			
    BootstrapControl *bsc = 0;

    for (int i=0; i < num_ev_stocks && !erc; ++i)
    {
	int s;
	
	if (fscanf(opt_ev_fp, "%d", &s) !=1 || s < 1 || s > num_stocks)
	{
	    ::LogMsg(L_Error, "bad stock #%d in ev file %s\n",
		     s, ev_fn);
	    erc = 1; break;
	}
	strzero((char *) evs, sizeof(double) * Chronographer->nyears());
	for (int year = start_year; year <= end_year; ++year)
	{
	    double ev;
	    if (fscanf(opt_ev_fp, "%lf", &ev) != 1)
	    {
		erc = 1; break;
	    }
	    if (year >= Chronographer->base_year()
		&& year < Chronographer->base_year() +  Chronographer->nyears())
		evs[year - Chronographer->base_year()] = ev;
	}
	s -= 1;				// convert s to array index
	Stocks[s].add_ev_scalars(evs);

	// check for optional monte data on this line
	char tmps[64];
	strcpy(tmps, "");
	if (fscanf(opt_ev_fp, "%[ \t\n]", tmps) == 1 && !strchr(tmps, '\n'))
	{
	    fscanf(opt_ev_fp, "%s", tmps);
	    if (!strcasecmp(tmps, "Bootstrap"))
	    {
		// check to see if a seed is specified
		if (fscanf(opt_ev_fp, "%[ \t\n]",tmps) == 1
		    && !strchr(tmps, '\n'))
		{
		    int seed;
		    fscanf(opt_ev_fp, "%d", &seed);

		    // make a new bootstrap control if the seed has changed.
		    // evs with a common seed must appear consecutively to
		    // share a random number stream.  (seed==0) seeds from clock
		    
		    if (!bsc || seed != last_seed)
		    {
			last_seed = seed;

			// BootstrapControls are deleted by MonteCarlo
			bsc = new BootstrapControl(seed); 
			if (!bsc)
			    LogMsg(L_Fatal, "trouble allocating mem "
				   "for ev bootstrap control.\n");
			MonteCarlo->add_control(bsc);
		    }
		}
		else
		{
		    // no seed specified, use last bsc (make one if necessary)
		    if (!bsc) {
			// BootstrapControls are deleted by MonteCarlo
			bsc = new BootstrapControl(); 
			if (!bsc)
			    LogMsg(L_Fatal, "trouble allocating mem "
				   "for ev bootstrap control.\n");
			MonteCarlo->add_control(bsc);
		    }
		}
		MonteDataItem* ev_bs =
		    Stocks[s].get_monte()->make_ev_bootstrap(bsc);
		MonteCarlo->add_data(ev_bs);
	    }
	    // stochastic variables (this code should be cleaned up a bit)
	    else if (!strcasecmp(tmps, "Normal"))
	    {
		// we only handle independent vars so far
		double mu, sigma;

		// throw away the "indep" designation for now
		if (fscanf(opt_ev_fp, "%*s %lf %lf", &mu, &sigma) != 2)
		{
		    erc = 1; break;
		}
		else
		{
		    // throw away the seed for now (if specified)
		    skip_comment(opt_ev_fp);

		    MonteDataItem *ev_stoch =
			Stocks[s].get_monte()->make_stoch_norm(mu, sigma);
		    MonteCarlo->add_data(ev_stoch);
		}
	    }
	    else if (!strcasecmp(tmps, "Log"))
	    {
		// we only handle independent vars so far
		double mu, sigma;

		// throw away the "normal indep" designation for now
		if (fscanf(opt_ev_fp, "%*s %*s %lf %lf", &mu, &sigma) != 2)
		{
		    erc = 1; break;
		}
		else
		{
		    // throw away the seed for now (if specified)
		    skip_comment(opt_ev_fp);

		    MonteDataItem *ev_stoch =
			Stocks[s].get_monte()->make_stoch_log_norm(mu, sigma);
		    MonteCarlo->add_data(ev_stoch);
		}
	    }
	}
    }
    delete [] evs;
    fclose(opt_ev_fp);
    if (erc)
	LogMsg(L_Error, "trouble reading ev file %s\n", ev_fn);
	
    return erc;
}

/*
 * read all of the optional enhancement config data into the appropriate stocks.
 * first checks to see if enh data exists.  if so, the enh file is opened,
 * the header parsed, then for each stock the data is read and the
 * add_enhancement() fn method called.  stocks are identified by index.
 *
 * precondition: global stocks structure must exist, including production
 *	members for all stocks with enhancement.
 * return: 0 on success, non-zero on error
 */

int IOCrud::read_enh_data()
{
    FILE *opt_enh_fp;
    int erc = 0;
    if (num_enh_stocks == 0)
	return 0;			// no optional enh data
    
    if ( ! (opt_enh_fp = fopen(enh_fn, "r")))
    {
	::LogMsg(L_Error, "cannot open enh file %s\n", enh_fn);
	return 1;
    }
    
    int start_year, end_year;
    fscanf(opt_enh_fp, "%d%*[^\n]", &start_year);
    fscanf(opt_enh_fp, "%d%*[^\n]", &end_year);
    
    // make the array of enhancement changes, which will be copied
    double *prods = new double[Chronographer->nyears()];
    if (!prods)
	LogMsg(L_Fatal, "trouble allocating mem for enhancement.\n");
    
    for (int i=0; i < num_enh_stocks && !erc; ++i)
    {
	int s;
	double aparm, s_age1, prop;
	
	if (fscanf(opt_enh_fp, "%d %lf %lf %lf", &s, &aparm, &s_age1, &prop) !=4
	    || s < 1 || s > num_stocks)
	{
	    ::LogMsg(L_Error, "bad stock %d params in enh file %s\n",
		     s, enh_fn);
	    erc = 1; break;
	}
	strzero((char*)prods, Chronographer->nyears()*sizeof(double));
		
	for (int year = start_year; year <= end_year; ++year)
	{
	    double prod;
	    if (fscanf(opt_enh_fp, "%lf", &prod) != 1)
	    {
		erc = 1; break;
	    }
	    if (year >= Chronographer->base_year()
		&& year < Chronographer->base_year() +  Chronographer->nyears())
		prods[year - Chronographer->base_year()] = prod;
	}
	s -= 1;		// convert s to array index
	Stocks[s].add_production_enhancement(prods, aparm, s_age1, prop);
    }
    delete [] prods;
    fclose(opt_enh_fp);
    return erc;
}


/*
 * read all of the optional cnr tactics data into the appropriate fisheries.
 * first checks to see if cnr data exists.  if so, the cnr file is opened,
 * the header parsed, then methods are invoked for each applicable fishery
 * to read in the rest of the data.  fisheries are identified by index.
 *
 * precondition: global fisheries structure must exist, including tactics members
 * return: 0 on success, non-zero on error
 */

int IOCrud::read_cnr_data()
{
    if (num_cnr_fisheries == 0)
	return 0;			// no optional cnr data
    
    if ( ! (opt_cnr_fp = fopen(cnr_fn, "r")))
    {
	::LogMsg(L_Error, "cannot open cnr file %s\n", cnr_fn);
	return 1;
    }
    
    int start_year, end_year;
    fscanf(opt_cnr_fp, "%d%*[^\n]", &start_year);
    fscanf(opt_cnr_fp, "%d%*[^\n]", &end_year);
    
    for (int i=0; i < num_cnr_fisheries; ++i)
    {
	int f;
	if (fscanf(opt_cnr_fp, "%d%*[^\n]", &f) != 1
	    || f < 1 || f > num_fish)
	{
	    ::LogMsg(L_Error, "bad fishery #%d in cnr file %s\n", f, cnr_fn);
	    fclose(opt_cnr_fp);
	    return 1;
	}
	f -= 1;		// convert f to array index
	
	if (Fisheries[f].parse_cnrs(this, start_year - base_year,
				    end_year - base_year) != 0)
	{
	    fclose(opt_cnr_fp);
	    return 1;
	}
    }
    fclose(opt_cnr_fp);
    return 0;
}

/* read ceiling data from the specified file.  the format of this file is
 * pretty silly.  no file specified by user is indicated with a null string
 * for the filename.
 *
 * precondition: global fisheries structure must exist, including tactics members
 * return: 0 on success, non-zero on error
 */

int IOCrud::read_ceiling_data()
{
    int erc = 0;
    
    if (!clng_fn[0])
	return 0;
    if ( ! (opt_clng_fp = fopen(clng_fn, "r")))
    {
	::LogMsg(L_Error, "cannot open ceiling file %s\n", clng_fn);
	return 1;
    }
    
    int base_period_start, base_period_end;
    int clng_start, clng_end;
    int num_clng_fisheries;
    int num_clng_changes;
    fscanf(opt_clng_fp, "%d%*[^\n]", &base_period_start);
    fscanf(opt_clng_fp, "%d%*[^\n]", &base_period_end);
    fscanf(opt_clng_fp, "%d%*[^\n]", &clng_start);
    fscanf(opt_clng_fp, "%d%*[^\n]", &clng_end);
    fscanf(opt_clng_fp, "%d%*[^\n]", &num_clng_fisheries);
    fscanf(opt_clng_fp, "%d%*[^\n]", &num_clng_changes);
    
    // check some ranges
    if (clng_start < base_year || clng_end < clng_start
	|| base_period_end >= clng_start)
    {
	::LogMsg(L_Error, "years out of range in ceiling file %s\n", clng_fn);
	fclose(opt_clng_fp);
	return 1;
    }
    
    // construct an array of all the years for which ceiling changes will be
    // read at each fishery, not including the base period.  fill the array
    // with data from the file.
    
    int *clng_array = new int[num_clng_changes];
    for (int i = 0; i < num_clng_changes; ++i)
	fscanf(opt_clng_fp, "%d", &clng_array[i]);
    
    // skip the rest of this line
    if (skip_lines(1, opt_clng_fp, "EOF encountered reading ceiling file!\n"))
	erc = 1;
    
    // read the ceilings into the proper fisheries
    if (!erc)
    {
	for (i = 0; i < num_clng_fisheries; ++i)
	{
	    // first line is a comment
	    if (erc = skip_lines(1, opt_clng_fp,
				 "EOF while reading ceiling file!\n"))
		break;
	    
	    int f;
	    if (fscanf(opt_clng_fp, "%d", &f) != 1
		|| f < 1 || f > num_fish
		|| skip_lines(1, opt_clng_fp, "\n")) // skip end of line
	    {
		::LogMsg(L_Error, "bad fishery #%d in ceiling file %s\n",
			 f, clng_fn);
		erc = 1;
		break;
	    }
	    f -= 1;		// convert f to array index
	    
	    if (erc =
		Fisheries[f].parse_clngs(this,
					 base_period_end -base_period_start + 1,
					 clng_start, clng_end,
					 num_clng_changes,
					 clng_array))
		break;
	}
    }
    // queue the request for the ceiling policy to the FisheryManager
    FisheryManager.queue_policy_init(Policies::CEILING);
    FisheryManager.queue_policy_init(Policies::MULTI_CEILING);

    delete [] clng_array;
    fclose(opt_clng_fp);
    return erc;
}

/*
 * read the mat data from the specified file into the appropriate
 * stocks.  no file specified by user is indicated with a null string
 * for the filename.
 *
 * preconditions: global stocks structure must exist, including config members,
 *	with abbreviations set;
 *	mat filename set, if specified in opt file; num_mat_stocks set
 * return: 0 on success, non-zero on error
 */

int IOCrud::read_mat_data()
{
    int erc = 0;
    
    if (!mat_fn[0] || num_mat_stocks == 0)
		return 0;
    if ((opt_mat_fp=fopen(mat_fn, "r"))==NULL){
		::LogMsg(L_Error, "cannot open mat file %s\n", mat_fn);
		return 1;
    }
    int year;
    while (fscanf(opt_mat_fp, "%d", &year) != EOF && !erc)
    {
	// convert year to index and check range
	year -= Chronographer->base_year();
	if (year < 0 || year >= Chronographer->nyears())
	{
	    // skip to next year (to end of line, plus num mat stocks)
	    if (skip_lines(1 + num_mat_stocks, opt_mat_fp,
			   "EOF encountered in mat file\n"))
	    { erc = 1; break; }
	}
	else
	{
	    for (int i=0; i < num_mat_stocks && !erc; ++i)
	    {
		char abbrv[MAX_TOKEN_LEN];
		if (fscanf(opt_mat_fp, "%s", abbrv) != 1)  
		{
		    LogMsg(L_Error,
			   "trouble reading stock abbrv in mat file\n");
		    erc = 1;
		    break;
		}
		// dump the stupid comma
		abbrv[strlen(abbrv)-1] = 0;
		// find the stock
		int s = 0;
		while (s < Stocks.num() && strcmp(Stocks[s].get_abbrv(), abbrv))
		    ++s;
		if (s == Stocks.num())
		{
		    LogMsg(L_Error,
			   "unable to locate stock %s while in mat file\n",
			   abbrv);
		    erc = 1;
		    break;
		}
		
		if (Stocks[s].parse_maturation_rates(this, year) != 0)
		{
		    LogMsg(L_Error,
			   "trouble reading maturation data, stock %s,"
			   " year %d\n",
			   abbrv, year + Chronographer->base_year());
		    erc = 1;
		    break;
		}
		// read adult eq data
		if (Stocks[s].parse_adult_eqs(this, year) != 0)
		{
		    LogMsg(L_Error,
			   "trouble reading adlt eq in mat file, stock %s,"
			   " year %d\n",
			   abbrv, year + Chronographer->base_year());
		    erc = 1;
		    break;
		}
	    }
	}
    }
    fclose(opt_mat_fp);
    return erc;
}

/*
 * reads and sets the mat file name and number of variable mat stocks
 * from the msc file given by the passed parameter.
 *	precondition: none
 *	postcondition: mat_fn, num_mat_stocks set
 *	return: 0 on success, non-zero on failure
 */

int IOCrud::read_msc_file(const char *msc_fn)
{
    FILE *msc_fp;
    char tmps[LINE_LENGTH];
    int erc = 0;
    
    if ( ! (msc_fp = fopen(msc_fn, "r")))
    {
	::LogMsg(L_Error, "cannot open msc file %s\n", msc_fn);
	return 1;
    }
    if (fscanf(msc_fp, "%s", mat_fn) != 1)
    {
	::LogMsg(L_Error, "trouble reading msc file.\n");
	erc = 1;
    }
    // skip to the end of the line
    skip_lines(1, msc_fp, "unexpected EOF in msc file\n");
    // count stocks
    num_mat_stocks = 0;
    while (fgets(tmps, LINE_LENGTH, msc_fp))
	++num_mat_stocks;
    fclose(msc_fp);
    return erc;
}

/*
 * sets the mat file name and numbers of variable mat stocks from a mat
 * file, because they don't use the msc files for some reason when doing
 * a calibration run.
 * 	precondition: none
 *	postcondition: mat_fn, num_mat_stocks set
 *	return: 0 on success, non-zero on failure.
 */
int IOCrud::read_mat_file(const char *m_fn)
{
    FILE *mat_fp;  
    char tmps[LINE_LENGTH];
    int erc = 0;

    strcpy(mat_fn, m_fn);
    if ( ! (mat_fp = fopen(mat_fn, "r")))
    {
	::LogMsg(L_Error, "cannot open mat file %s\n", mat_fn);
	return 1;
    }
    // skip to the end of the line
    skip_lines(1, mat_fp, "unexpected EOF in mat file\n");
    // count stocks
    num_mat_stocks = 0;
    while (fscanf(mat_fp, " %[^,\n\t ]",  tmps))
    {
	skip_lines(1, mat_fp, "unexpected EOF in mat file\n");
	if (isalpha(*tmps) && (strlen(tmps) == 3))
	    ++num_mat_stocks;
	else
	    break;
    }
    fclose(mat_fp);
    return erc;
}

/*
 * reads the monte data, if it's there
 *	precondition: global MonteCarlo object exists
 *	return: 0 on success, non-zero on failure
 */

int IOCrud::read_monte_data()
{
    int erc = 0;
    
    if (!monte_fn[0])
	return 0;
    if ( ! (opt_monte_fp = fopen(monte_fn, "r")))
    {
	::LogMsg(L_Error, "cannot open monte file %s\n", monte_fn);
	return 1;
    }
    erc = opt_monte_fp >> *MonteCarlo;
    fclose(opt_monte_fp);
    return erc;
}

/*
 * reads the policy data, if it's there
 *	preconditions: global fishery and stock lists exist,
 *		       global fishery manager exists
 *	return: 0 on success, non-zero on failure
 */

int IOCrud::read_policy_data()
{
    int erc = 0;
    
    if (!policy_fn[0])
	return 0;
    if ( ! (opt_policy_fp = fopen(policy_fn, "r")))
    {
	::LogMsg(L_Error, "cannot open policy file %s\n", policy_fn);
	return 1;
    }
    erc = opt_policy_fp >> FisheryManager;
    fclose(opt_policy_fp);
    return erc;
}

/*
 * reads, closes config file; reads config data from base file
 *	precondition:  config file name set
 *	postcondition: base file open and file pointer valid
 *	return: 0 on success, non-zero on failure
 */

//GROT - hv_rate kludge
int hv_kludge_type=0;

int IOCrud::read_config()
{
    char tmps[LINE_LENGTH];
    int tmp;
    
    if ((config_fp = fopen(config_fn, "r"))==NULL)
    {
	::LogMsg(L_Error, "cannot open config file %s\n", config_fn);
	return 1;
    }
    //GROT - hv_rate kludge
    fscanf(config_fp, "%d", &hv_kludge_type); 
    if (hv_kludge_type)
	::LogMsg(L_Warning, "found kludge type %d\n", hv_kludge_type);
    
    fscanf(config_fp, " %[^\n]\n",  run_name);
    fscanf(config_fp, "%d", &base_year_opt); skip_comment(config_fp);
    
    // this field could be nyears-1 or ending calendar year
    fscanf(config_fp, "%d", &num_years); skip_comment(config_fp);
    if (num_years > base_year_opt)
	num_years -= base_year_opt;
    ++num_years;
    
    fscanf(config_fp, " %[^,\n\t ]",  base_fn); skip_comment(config_fp);
    fscanf(config_fp, " %[^,\n\t ]",  stock_fn); skip_comment(config_fp);
    
    // skip the next line.
    if (fscanf(config_fp, " %[^,\n\t ]", tmps) != 1 || skip_comment(config_fp))
    {
	::LogMsg(L_Error,
		 "trouble reading calibration flag from config file.\n");
	fclose(config_fp);
    }
    else
    {
	mat_fn[0] = 0;
        if (tmps[0] == 'y' || tmps[0] == 'Y')
        {
            if (!(Calib = new Calibrator())
                || Calib->read_opt_data(config_fp))
            {
                ::LogMsg(L_Error, "trouble with calibration data.\n");
                fclose(config_fp);
            }
        }       
        else
        {
	    // maturation rate msc file; also handles getting mat file name
	    if (fscanf(config_fp, " %[^,\n\t ]", tmps) != 1
		|| skip_comment(config_fp))
	    {
		::LogMsg(L_Error,
			 "trouble reading msc file from config file.\n");
		fclose(config_fp);
		return 1;
	    }
	    else if (strcasecmp(tmps, "NONE"))	// if there is a msc file
		if (read_msc_file(tmps))
		{
		    fclose(config_fp);
		    return 1;
		}
	}
    }

    // ev optional file
    fscanf(config_fp, "%d", &num_ev_stocks);
    skip_comment(config_fp);
    if (num_ev_stocks > 0)
    {
	fscanf(config_fp, " %[^,\n\t ]", ev_fn);
	skip_comment(config_fp);
    }
    
    // idl optional file
    if (fscanf(config_fp, " %[^,\n\t ]", tmps) != 1 || skip_comment(config_fp))
    {
	::LogMsg(L_Error, "trouble reading idl flag from config file.\n");
	fclose(config_fp);
	return 1;
    }
    else if (tmps[0] == 'y' || tmps[0] == 'Y')
    {
	fscanf(config_fp, " %[^,\n\t ]", idl_fn); skip_comment(config_fp);
    }
    else idl_fn[0] = 0;
    
    if (read_save_stats())
	return 1;
    
    // Skip "header" and stock composition (Y not handled)
    if (skip_lines(2, config_fp, "EOF encountered reading config file!\n"))
	return 1;
    if (fscanf(config_fp, " %[^,\n\t ]", tmps) != 1 || skip_comment(config_fp))
    {
	::LogMsg(L_Error, "trouble reading RT flag from config file.\n");
	fclose(config_fp);
	return 1;
    }
    else if (tmps[0] == 'y' || tmps[0] == 'Y')
	psc_out.stat_flags |= psc_out.HV_RT;
    
    if (skip_lines(8, config_fp, "EOF encountered reading config file!\n"))
	return 1;
    fscanf(config_fp, "%d", &num_enh_stocks); skip_comment(config_fp);
    if (num_enh_stocks > 0)
    {
	fscanf(config_fp, "%d%", &enh_density_dep); skip_comment(config_fp);
	fscanf(config_fp, " %[^,\n\t ]", enh_fn); skip_comment(config_fp);
    }
    fscanf(config_fp, "%d", &num_cnr_fisheries); skip_comment(config_fp);
    if (num_cnr_fisheries > 0)
    {
	fscanf(config_fp, " %[^,\n\t ]", cnr_fn); skip_comment(config_fp);
    }
    fscanf(config_fp, "%d", &num_pnv_fnames); skip_comment(config_fp);
    if (read_pnv_fnames())
    {
	::LogMsg(L_Error, "trouble reading pnv filenames from config file.\n");
	fclose(config_fp);
	return 1;
    }
    fscanf(config_fp, " %[^,\n\t ]", fp_fn); skip_comment(config_fp);
    fscanf(config_fp, "%d", &term_stats_age); skip_comment(config_fp);
    if (fscanf(config_fp, " %[^,\n\t ]", tmps) != 1 || skip_comment(config_fp))
    {
	::LogMsg(L_Error, "trouble reading ceiling flag from config file.\n");
	fclose(config_fp);
	return 1;
    }
    else if (tmps[0] == 'y' || tmps[0] == 'Y')
    {
	fscanf(config_fp, " %[^,\n\t ]", clng_fn); skip_comment(config_fp);
    }
    else clng_fn[0] = 0;

    // optional simulation start year.
    if (fscanf(config_fp, " %[^,\n\t ]",tmps) == 1 && !skip_comment(config_fp))
    {
	if (!isdigit(tmps[0]))
	{
	    ::LogMsg(L_Error,
		     "couldn't find simulation start year in config file.\n");
	    fclose(config_fp);
	    return 1;
	}
	sim_start_year = atoi(tmps) - base_year_opt;  // convert to year index.
    }
    
    // optional monte config filename may appear next in config file
    monte_fn[0] = 0;
    if (fscanf(config_fp, " %[^,\n\t ]", tmps) == 1 && !skip_comment(config_fp))
    {
	if (tmps[0] == 'y' || tmps[0] == 'Y')
	{
	    fscanf(config_fp, " %[^,\n\t ]", monte_fn);
	    skip_comment(config_fp);
	}
    }

    // optional additional save stats may appear next
    if (fscanf(config_fp, " %[^,\n\t ]", tmps) == 1 && !skip_comment(config_fp))
    {
	if (tmps[0] == 'y' || tmps[0] == 'Y')
	    if (read_additional_save_stats())
	    {
		LogMsg(L_Error, "trouble reading additional save stats\n");
		return 1;
	    }
    }

    // optional policy config filename may appear next
    policy_fn[0] = 0;
    if (fscanf(config_fp, " %[^,\n\t ]", tmps) == 1 && !skip_comment(config_fp))
    {
	if (tmps[0] == 'y' || tmps[0] == 'Y')
	{
	    fscanf(config_fp, " %[^,\n\t ]", policy_fn);
	    skip_comment(config_fp);
	}
    }

    fclose(config_fp);
    
    if ( ! (base_fp = fopen(base_fn, "r")))
    {
	::LogMsg(L_Error, "cannot open base file %s\n", base_fn);
	return 1;
    }
    fscanf(base_fp, "%d%*[^\n]", &num_stocks);
    fscanf(base_fp, "%d%*[^\n]", &tmp); // num ages
    fscanf(base_fp, "%d%*[^\n]", &num_fish);
    fscanf(base_fp, "%d%*[^\n]", &base_year);
    fscanf(base_fp, "%d%*[^\n]", &term_net_age);
    
    if (base_year != base_year_opt)
    {
	::LogMsg(L_Error, "base year mismatch\n");
	fclose(base_fp);
	return 1;
    }
    return 0;
}

/*
 * read in all the rest of the data
 *	precondition: base_fp open;
 * 		      global structures (stock, harvest, etc.) exist
 *	postcondition: files closed, data read
 *	return: 0 success, non-zero error
 */

int IOCrud::read_data()
{
    if ( ! (stock_fp = fopen(stock_fn, "r")))
    {
	::LogMsg(L_Error, "cannot open stock file %s\n", stock_fn);
	return 1;
    }
    
    // the input files are messy, so many different phases of
    // parsing are needed, in the following order.
    
    // do a couple of static members
    Fishery::parse_net_age(this);
    Stock::parse_term_stats_age(this);
    
    for (int i = 0; i < Fisheries.num(); ++i)
	if (Fisheries[i].parse_name_and_gear(this) != 0)
	{ fclose(base_fp); fclose(stock_fp); return 1; }
    
    for (i = 0; i < Fisheries.num(); ++i)
	if (Fisheries[i].parse_pnv(this) != 0)
	{ fclose(base_fp); fclose(stock_fp); return 1; }
    
    if (Stock::parse_surv_rt(this) != 0)
    { fclose(base_fp); fclose(stock_fp); return 1; }
    
    if (Fishery::parse_imrs(this) != 0)
    { fclose(base_fp); fclose(stock_fp); return 1; }
    
    for (i = 0; i < Fisheries.num(); ++i)
	if (Fisheries[i].parse_ocn_net(this) != 0)
	{ fclose(base_fp); fclose(stock_fp); return 1; }
    
    for (Harvest *hv = Harvests.head(); hv; hv = Harvests.next())
	if (hv->parse_termpt(this) != 0)
	{ fclose(base_fp); fclose(stock_fp); return 1; }
    
    for (i = 0; i < Stocks.num(); ++i)
    {
	if (Stocks[i].parse_hunk(this) != 0)
	{ fclose(base_fp); fclose(stock_fp); return 1; }
	
	// read harvest rates.  this is very implementation dependent,
	// because it depends upon the order in which the harvests appear
	// in the list.  but this whole file will be axed soon enough...
	
	// find first harvest this stock
	for (hv = Harvests.head(); !hv->stock_match(&Stocks[i]);
	     hv = Harvests.next()) ; 
	
	// all the fisheries for this stock appear next in the harvest list
	for (int j = 0; j < Fisheries.num(); ++j, hv = Harvests.next())
	    if (hv->parse_hr(this) != 0)
	    { fclose(base_fp); fclose(stock_fp); return 1; }
    }
    
    if (Calib)
    {
	Calib->read_ev_data(this);
	Calib->set_file_prefix(psc_out.file_prefix);
    }

    // read in optional data
    if (read_mat_data() != 0
	|| read_ev_data()  != 0
	|| read_idl_data() != 0
	|| read_enh_data() != 0
	|| read_cnr_data() != 0
	|| read_pnv_data() != 0
	|| read_fp_data()  != 0
	|| read_ceiling_data() != 0
	|| read_monte_data() != 0
	|| read_policy_data() != 0)
    { fclose(base_fp); fclose(stock_fp); return 1; }
    
    fclose(base_fp);
    fclose(stock_fp);
    return 0;
}


/*******************************************************************
 * this section handles the psc output files
 *******************************************************************/

// write the output files as requested by the user.  return 0 on success,
// non-zero on error.

int IOCrud::write_output_files()
{

    int erc = 0;

    if (psc_out.stat_flags & psc_out.CATCH)
	erc += psc_out.write_cat();
    
    if (psc_out.stat_flags & psc_out.TERM)
	erc += psc_out.write_trm();
    
    if (psc_out.stat_flags & psc_out.ESC)
	erc += psc_out.write_esc();

    if (psc_out.ohr_opt)
	erc += psc_out.write_ohr();
    
    if (psc_out.thr_opt)
	erc += psc_out.write_thr();
    
    if (psc_out.mrt_opt)
	erc += psc_out.write_mrt();
    
    if (psc_out.stat_flags & psc_out.I_MORT)
    {
	erc += psc_out.write_tim();
	erc += psc_out.write_lim();
	erc += psc_out.write_sim();
    }

    if (psc_out.stat_flags & psc_out.HV_RT)
    {
	erc += psc_out.write_rt();
    }
    
    if (psc_out.fishery_flags)
    {
	erc += psc_out.write_coh();
	erc += psc_out.write_abd();
    }

    if (psc_out.stock_flags && (psc_out.stat_flags & psc_output::OCN_CAT))
    {
	erc += psc_out.write_stock_ocn();
    }

    erc += MonteCarlo->write(psc_out.file_prefix);

    return erc;
}

// utility fn for opening an output file.  return 0 on success, else non-zero.

int open_outfile(FILE *&fp, const char *fn)
{
    // open file for writing; log message if overwriting
#ifndef WIN32
    /* TODO Windows should check for file existence too. */
    if (! access(fn, F_OK))
	::LogMsg(L_Warning, "file %s already exists; overwriting...\n", fn);
#endif

    if ( ! (fp = fopen(fn, "w")))
    {
	::LogMsg(L_Error, "cannot write to output file %s\n", fn);
	return 1;
    }

    else
	return 0;
}

// write the output stat files.  these all return 0 on success, non-0 on error.

int psc_output::write_cat() const // catch by fishery
{
    FILE *fp = 0;
    char fn[MAX_TOKEN_LEN];
    sprintf(fn, "%scat.prn", file_prefix);

    if (open_outfile(fp, fn))
	return 1;
    
    // write data
	for (int year = 0; year < Chronographer->nyears(); ++year)
    {
		fprintf(fp, "%d\t", Chronographer->base_year() + year);
		for (int i = 0; i < Fisheries.num(); ++i){
		    fprintf(fp, "%.0f\t", Fisheries[i].get_total_catch(year));
		}
		fprintf(fp, "\n");
    }
    fclose(fp);
    return 0;
}

int psc_output::write_trm() const // true terminal run
{ 
    FILE *fp = 0;
    char fn[MAX_TOKEN_LEN];
    sprintf(fn, "%strm.prn", file_prefix);
    
    if (open_outfile(fp, fn))
	return 1;
    
    // write data
    for (int year = 0; year < Chronographer->nyears(); ++year)
    {
	fprintf(fp, "%d\t", Chronographer->base_year() + year);
	for (int i = 0; i < Stocks.num(); ++i)
	{
	    double tot = 0;
	    for (Age age = Stocks[i].get_term_stats_age();
		 age <= age.top(); age++)
		tot += Stocks[i].get_true_term_run(age, year);
	    fprintf(fp, "%.0f\t", tot);
	}
	fprintf(fp, "\n");
    }
    fclose(fp);
    return 0;
}

int psc_output::write_esc() const // escapement
{ 
    FILE *fp = 0;
    char fn[MAX_TOKEN_LEN];
    sprintf(fn, "%sesc.prn", file_prefix);
    
    if (open_outfile(fp, fn))
	return 1;
    
    // write data
    for (int year = 0; year < ::Chronographer->nyears(); ++year)
    {
	fprintf(fp, "%d\t", ::Chronographer->base_year() + year);
	for (int i = 0; i < ::Stocks.num(); ++i)
	{
	    const MonteStockTracking *monte = ::Stocks[i].get_monte()
		->find_MonteTrackingItem(MonteStockTracking::ESCAPEMENT);
	    int games, years;
	    if (monte 
		&& monte->get_results()
		&& (games = monte->get_game_size()) > 1 
		&& (years = monte->get_year_size()))
	    {	
		const double **data = monte->get_results();
		if (!data
		    || (year < (::Chronographer->nyears() - years)))
		    fprintf(fp, "%.0f\t",
			    Stocks[i].get_adult_escapement(year));
		else
		{
		    float *values;
		    values = new float [monte->get_game_size()];
		    assert(values);
		    int yr = year - ::Chronographer->nyears() + years;
		    for (int j = 0; j < monte->get_game_size(); j++)
			values[j] = (float)(data[j][yr]);
		    qsort(values, monte->get_game_size(),
			  sizeof(float), compare);
		    fprintf(fp, "%.0f\t", get_quantile(values,
						       monte->get_game_size(),
						       .50));
		}
	    }	
	    else
		fprintf(fp, "%.0f\t", Stocks[i].get_adult_escapement(year));
	}
	fprintf(fp, "\n");
    }
    fclose(fp);
    return 0;
}

int psc_output::write_ohr() const // ocean harvest
{ 
    if (!ohr_opt) return 0;
    
    FILE *fp = 0;
    char fn[MAX_TOKEN_LEN];
    sprintf(fn, "%sohr.prn", file_prefix);
    
    if (open_outfile(fp, fn))
	return 1;
    
    // write data
    for (int year = 0; year < Chronographer->nyears(); ++year)
    {
	fprintf(fp, "%d\t", Chronographer->base_year() + year);
	for (int i = 0; i < Stocks.num(); ++i)
	{
	    if (ohr_opt == 1)
		fprintf(fp, "%6.4f\t", Stocks[i].get_ocn_adult_eq_hr1(year));
	    else
		fprintf(fp, "%6.4f\t", Stocks[i].get_ocn_adult_eq_hr2(year));
	}
	fprintf(fp, "\n");
    }
    fclose(fp);
    return 0;
}

int psc_output::write_thr() const // terminal harvest
{ 
    if (!thr_opt) return 0;
    
    FILE *fp = 0;
    char fn[MAX_TOKEN_LEN];
    sprintf(fn, "%sthr.prn", file_prefix);
    
    if (open_outfile(fp, fn))
	return 1;
    
    // write data
    for (int year = 0; year < Chronographer->nyears(); ++year)
    {
	fprintf(fp, "%d\t", Chronographer->base_year() + year);
	for (int i = 0; i < Stocks.num(); ++i)
	{
	    if (thr_opt == 1)
		fprintf(fp, "%6.4f\t", Stocks[i].get_tot_adult_eq_hr1(year));
	    else
		fprintf(fp, "%6.4f\t", Stocks[i].get_tot_adult_eq_hr2(year));
	}
	fprintf(fp, "\n");
    }
    fclose(fp);
    return 0;
}

int psc_output::write_mrt() const // mortalities
{ 
    if (!mrt_opt) return 0;
    
    char *token = strtok(mrt_stocks, " \t\n");
    if (token && *token != ',')
	do
	{
	    if (*token == ',') break;
	    for (int i = 0; i < ::Stocks.num(); i++)
	    {
		if (!strcmp(token, ::Stocks[i].get_abbrv()))
		{
		    write_stock_mrt(&::Stocks[i]);
		    break;
		}
	    }
	} while (token = strtok(NULL, " \t\n"));
    else
	for (int i = 0; i < Stocks.num(); ++i)
	    write_stock_mrt(&::Stocks[i]);
    return 0;
}

int psc_output::write_stock_mrt(Stock *s) const // mort for a specific stock.
{
    FILE *fp = 0;
    char fn[MAX_TOKEN_LEN];
    sprintf(fn, "%s%s.prn", file_prefix, s->get_abbrv());
	    
    if (open_outfile(fp, fn))
	return 1;
	    
    // Write header
    fprintf(fp, "Year\t");
    Harvest *h;
    for (HvIter hvi(s->get_harvest_list()); h = ++hvi; )
	for (int i = 0; i < Fisheries.num(); ++i)
	    if (&::Fisheries[i] == h->get_fishery())
	    {
		fprintf(fp, "%11d", i);
		break;
	    }
    fprintf(fp, "\n");
	
    // write data
    for (int year = 0; year < Chronographer->nyears(); ++year)
    {
	fprintf(fp, "%d\t", Chronographer->base_year() + year);
	Harvest *h;
	for (hvi.reset(); h = ++hvi; )
	{
	    switch (mrt_opt)
	    {
	      case 1:
		{
		    double tot = h->get_total_catch(year);
		    for (Age age = FIRST_HV_AGE; age <= age.top();
			 age++)
			tot += h->get_cnr_sublegals(age, year)
			    + h->get_cnr_legals(age, year)
			    + h->get_term_shakers(age, year)
			    + h->get_preterm_shakers(age, year);
		    fprintf(fp, "%11.0f", tot);
		}
		break;
	      case 2:
		fprintf(fp, "%.0f\t", h->get_total_catch(year));
		break;
	      case 3:
		{
		    double tot = 0;
		    for (Age age = FIRST_HV_AGE;age <= age.top(); age++)
				tot += (h->get_cnr_sublegals(age, year)
					+ h->get_cnr_legals(age, year)
					+ h->get_term_shakers(age, year)
					+ h->get_preterm_shakers(age, year));
		    fprintf(fp, "%11.0f", tot);
		}
		break;
	      case 11:
		{
		    double tot = 0;
		    for (Age age = FIRST_HV_AGE; age <= age.top();
			 age++)
			tot += (h->get_cnr_sublegals(age, year)
				+ h->get_cnr_legals(age, year)
				+ h->get_term_shakers(age, year)
				+ h->get_preterm_shakers(age, year)
				+ h->get_total_catch(age, year))
			    * s->get_adult_eq(age, year);
		    fprintf(fp, "%11.0f", tot);
		}
		break;
	      case 12:
		{
		    double tot = 0;
		    for (Age age = FIRST_HV_AGE; age <= age.top();
			 age++)
			tot += h->get_total_catch(age, year)
			    * s->get_adult_eq(age, year);
		    fprintf(fp, "%.0f\t", h->get_total_catch(year));
		}
		break;
	      case 13:
		{
		    double tot = 0;
		    for (Age age = FIRST_HV_AGE; age <= age.top();
			 age++)
			tot += (h->get_cnr_sublegals(age, year)
				+ h->get_cnr_legals(age, year)
				+ h->get_term_shakers(age, year)
				+ h->get_preterm_shakers(age, year)
				+ h->get_total_catch(age, year))
			    * s->get_adult_eq(age, year);
		    fprintf(fp, "%11.0f", tot);
		}
		break;
	      default:
		return 1;
	    }
	}
	fprintf(fp, "\n");
    }
    fclose(fp);
    return 0;
}


int psc_output::write_tim() const // incidental mort
{ 
    FILE *fp = 0;
    char fn[MAX_TOKEN_LEN];
    sprintf(fn, "%stim.prn", file_prefix);
    
    if (open_outfile(fp, fn))
	return 1;
    
    // write data
    for (int year = 0; year < Chronographer->nyears(); ++year)
    {
	fprintf(fp, "%d\t", Chronographer->base_year() + year);
	for (int i = 0; i < Fisheries.num(); ++i)
	    fprintf(fp, "%.0f\t",
		    Fisheries[i].get_cnr_total(year)
		    + Fisheries[i].get_preterm_shakers(year)
		    + Fisheries[i].get_term_shakers(year));
	fprintf(fp, "\n");
    }
    fclose(fp);
    return 0;
}

int psc_output::write_lim() const // incidental mort
{ 
    FILE *fp = 0;
    char fn[MAX_TOKEN_LEN];
    sprintf(fn, "%slim.prn", file_prefix);
    
    if (open_outfile(fp, fn))
	return 1;
    
    // write data
    for (int year = 0; year < Chronographer->nyears(); ++year)
    {
	fprintf(fp, "%d\t", Chronographer->base_year() + year);
	for (int i = 0; i < Fisheries.num(); ++i)
	    fprintf(fp, "%.0f\t", Fisheries[i].get_cnr_total_legal(year));
	fprintf(fp, "\n");
    }
    fclose(fp);
    return 0;
}

int psc_output::write_sim() const // incidental mort
{ 
    FILE *fp = 0;
    char fn[MAX_TOKEN_LEN];
    // makes TIM, LIM, and SIM	
    sprintf(fn, "%ssim.prn", file_prefix);
    
    if (open_outfile(fp, fn))
	return 1;
    
    // write data
    for (int year = 0; year < Chronographer->nyears(); ++year)
    {
	fprintf(fp, "%d\t", Chronographer->base_year() + year);
	for (int i = 0; i < Fisheries.num(); ++i)
	    fprintf(fp, "%.0f\t", Fisheries[i].get_cnr_total_sublegal(year));
	fprintf(fp, "\n");
    }
    fclose(fp);
    return 0;
}

int psc_output::write_abd() const // abundance index
{ 
    FILE *fp = 0;
    char fn[MAX_TOKEN_LEN];
    char fish_name[MAX_TOKEN_LEN];
    sprintf(fn, "%sabd.prn", file_prefix);
    
    if (open_outfile(fp, fn))
	return 1;
    
    // write data
    // print only those stocks specified by the user
    for (int f = 0; f < Fisheries.num(); ++f)
    {
	if (fishery_flags & ((unsigned long) 1 << f))
	{
	    sprintf(fish_name, "\"    \"\"%s \"", Fisheries[f].get_name());
	    unders_to_spaces(fish_name);
	    fprintf(fp, "%s\n", fish_name);
	    for (int year = 0; year < Chronographer->nyears(); ++year)
		fprintf(fp, "%d\t%0.f\n",
			year + Chronographer->base_year(),
			Fisheries[f].get_abundance_index(year));
	}
    }
    
    fclose(fp);
    return 0;
}

// catches for selected fisheries by stock
int psc_output::write_coh() const	
{
    FILE *fp = 0;
    char fn[MAX_TOKEN_LEN];
    char fish_name[MAX_TOKEN_LEN];
    sprintf(fn, "%scoh.prn", file_prefix);
    
    if (open_outfile(fp, fn))
	return 1;
    
    // print only those stocks specified by the user
    for (int f = 0; f < Fisheries.num(); ++f)
    {
	if (fishery_flags & ((unsigned long) 1 << f))
	{
	    sprintf(fish_name, "\"%s\"", Fisheries[f].get_name());
	    unders_to_spaces(fish_name);
	    fprintf(fp, "%s\n", fish_name);
	    for (int year = 0; year < Chronographer->nyears(); ++year)
	    {
		fprintf(fp, "%d\t", year + Chronographer->base_year());
		for (int s = 0; s < Stocks.num(); ++s)
		{
		    Harvest *hv = Fisheries[f].get_harvest(&Stocks[s]);
		    fprintf(fp, "%.0f\t",
			    hv ? hv->get_abundance_index(year):0);
		}
		fprintf(fp, "\n");
	    }
	}
    }
    fclose(fp);
    return 0;
}

int psc_output::write_rt() const
{
    FILE *fp = 0;
    char fn[MAX_TOKEN_LEN];
    sprintf(fn, "%srt.prn", file_prefix);
    
    if (open_outfile(fp, fn))
	return 1;
    
    fprintf(fp, "PreTerminal RT\n");
    for (int yr = 0; yr < Chronographer->nyears(); ++yr)
    {
	fprintf(fp, "%d\t", yr + Chronographer->base_year());
	for (int f = 0; f < Fisheries.num(); ++f)
	{
	    HvIter hv(Fisheries[f].get_harvest_list());
	    if (Fisheries[f].ismultiphase() || (!(++hv)->isterm()))
		fprintf(fp,"%7.5f\t", Fisheries[f].get_policy_hv_scalar(yr));
	    else
		fprintf(fp, "1.00000\t");
	    
	}
	fprintf(fp, "\n");
    }
    
    fprintf(fp, "Terminal RT\n");
    for (yr = 0; yr < Chronographer->nyears(); ++yr)
    {
	fprintf(fp, "%d\t", yr + Chronographer->base_year());
	for (int f = 0; f < Fisheries.num(); ++f)
	{
	    HvIter hv(Fisheries[f].get_harvest_list());
	    if (Fisheries[f].ismultiphase() || ((++hv)->isterm()))
		fprintf(fp, "%7.5f\t", Fisheries[f].get_policy_hv_scalar(yr));
	    else
		fprintf(fp, "1.00000\t");
	    
	}
	fprintf(fp, "\n");
    }
    
    fclose(fp);
    return 0;
}

// another style (slcm style) of ocean harvests, for a particular stock

int psc_output::write_stock_ocn() const
{
    for (int s = 0; s < Stocks.num(); ++s)
    {
	if (stock_flags & ((unsigned long) 1 << s))
	{
	    FILE *fp = 0;
	    char fn[MAX_TOKEN_LEN];
	    sprintf(fn, "%s%s.ocn", file_prefix, Stocks[s].get_abbrv());
	
	    if (open_outfile(fp, fn))
		return 1;

	    // print data for (year+age2) through (year+age5)
	    for (int yr = 0; yr < Chronographer->nyears() - 5; ++yr)
	    {
		// dumb 2 digit year format
		fprintf(fp, "%d\t", yr + Chronographer->base_year() - 1900);

		// abundance, escapements, ocean harvest, river harvest
		Age age; int offset;
		fprintf(fp, "%.0f\t", Stocks[s].get_abundance(AGE2, yr+2));
		for (age=AGE2, offset=2; age <= AGE5; ++age, ++offset)
		    fprintf(fp, "%.0f\t",
			    Stocks[s].get_escapement(age, yr+offset));
		for (age=AGE2, offset=2; age <= AGE5; ++age, ++offset)
		    fprintf(fp, "%.0f\t",
			    Stocks[s].get_ocean_catch(age, yr+offset));
		for (age=AGE2, offset=2; age <= AGE5; ++age, ++offset)
		    fprintf(fp, "%.0f\t",
			    Stocks[s].get_river_catch(age, yr+offset));
		fprintf(fp, "\n");
	    }
	    fclose(fp);
	}
    }
    return(0);
}

 
