// Stock class implementations

#include <math.h>
#include "log.h"
#include "NonNeg.h"
#include "Stock.h"
#include "Fishery.h"
#include "Harvest.h"
#include "MonteStockIntrfc.h"

// static class member definitions
AgeVec<double> Stock::surv_rt;
Age Stock::term_stats_age;

// ctor
Stock::Stock() : name(0), abbrv(0), results(NULL), production(0)
{
    // dont set the static surv_rt

    scale2to1 = 0;
    for (HarvestPhase phase; phase <= phase.top(); ++phase)
	catches[phase] = 0;

	results.setStockPtr( this );

    initial_cohort = 0;
    cohort = 0;
    terminal_run = 0;
    regular_mort = 0;
    special_mort = 0;
    escapement = 0;
    monte_carlo = new MonteStockIntrfc(&config, &results);
    assert(monte_carlo);
}

// dtor

Stock::~Stock()
{
    delete name;
    delete abbrv;
    delete production;
    delete monte_carlo;
}

// take a general harvest list and traverse it, attaching all harvests
// which refer to this stock to the local list.

void Stock::make_harvest_list(HarvestList& hvl)
{
    for (Harvest* phv = hvl.head(); !hvl.at_end(); phv = hvl.next())
	if (phv->stock_match(this))
	    if(!(hv_list.append(phv)))
		assert(0); // check for alloc failure
}

/*
 * compute age 1 recruitment scalars
 */

void Stock::final_inits()
{
    // age1 abundance calculation
    initial_cohort[AGE1] = initial_cohort[AGE2] * scale2to1;

    //check to see that the production item was created.
    if (!production)
	LogMsg(L_Fatal, "missing production object for %s\n", name);
}

/*
 * initialize some data for the start of a new year, and save some
 * config data.
 */

void Stock::year_init(int year)
{
    if (year == 0)
    {
	for (Age age=cohort.mindex(); age <= cohort.maxdex(); ++age)
	    cohort[age] = initial_cohort[age];
    }
    terminal_run = 0;
    escapement = 0;
    regular_mort = 0;
    special_mort = 0;
    
    // age1 recruit calculation
    double x9 = surv_rt[AGE1];
    double recrt_age1 = 0;
    for (Age age = FIRST_HV_AGE; age <= age.top(); ++age)
    {
	x9 *= surv_rt[age];
	recrt_age1 += x9 * maturation_rate(age);
	x9 *= 1.0 - maturation_rate(age);
    }
    production->set_recrt_age1(recrt_age1);

    // save some info
    results.start_year();
}

/*
 * apply ocean mortality for all cohorts this stock
 * 	precondition:  ocean abundances in cohort[]
 *	postcondition: cohort[] contains new abundances, post-mort
 */

void Stock::ocean_mortality()
{
    for (Age age=cohort.mindex(); age <= cohort.maxdex(); ++age)
	cohort[age] *= surv_rt[age];
}

/*
 * cause maturation for harvestable cohorts.  
 * 	precondition:  cohort[] and reg/special morts accurate
 *	postcondition: terminal_run[] set post-maturation
 */

void Stock::maturate()
{
    for (Age age = FIRST_HV_AGE; age <= age.top(); ++age)
    {
	terminal_run[age] =
	    NonNeg((cohort[age] - (regular_mort[age] + special_mort[age])))
	    * maturation_rate(age);
    }
}

/*
 * updates stock cohort for preterm and terminal run
 * sets stock preterm catches for easy display
 * 	precondition:  terminal_run[], regular_mort[] and special_mort[]
 *		up to date in this stock;
 *	postcondition: cohort[] updated through terminal run, 
 *		catches[PRETERM] in stock set
 */

void Stock::update_cohort_from_harvests()
{
    catches[PRETERM] = 0;

    for (Harvest* hv = hv_list.head(); hv; hv = hv_list.next())
	for (Age age = FIRST_HV_AGE; age <= age.top(); ++age)
	    catches[PRETERM][age] += hv->get_catch(PRETERM, age);

    for (Age age = FIRST_HV_AGE; age <= age.top(); ++age)
    {
	cohort[age] = NonNeg(cohort[age]
			     - (regular_mort[age] + special_mort[age])
			     - terminal_run[age]); 
    }
}

/*
 * compute escapements for all harvestable cohorts by taking all terminal
 * mortalities, including catches, shakers, etc.
 * also sets stock term catches for easy display
 * 	precondition:  terminal_run[] up to date in this stock;
 *		catches, shakers, cnrs up to date in harvests.
 *	postcondition: escapement[] set, catches[TERM] in stock set
 */

void Stock::set_escapement()
{
    HvAgeVec<double> term_incidentals = 0;
    catches[TERM] = 0;

    for (Harvest* hv = hv_list.head(); hv; hv = hv_list.next())
	for (Age age = FIRST_HV_AGE; age <= age.top(); ++age)
	{
	    catches[TERM][age] += hv->get_catch(TERM, age);
	    term_incidentals[age] +=
		hv->get_shakers(TERM, age) + hv->get_cnrs(TERM, age);
	}
    for (Age age = FIRST_HV_AGE; age <= age.top(); ++age)
	escapement[age] = NonNeg(terminal_run[age] - catches[TERM][age]
				 - term_incidentals[age]);
}

/*
 * precondition: pre-idl escapement up to date
 * postcondition: post-idl escapement set
 */

void Stock::apply_idls()
{
    for (Age age = FIRST_HV_AGE; age <= age.top(); ++age)
	escapement[age] = NonNeg(inter_dam_loss() * escapement[age]);
}

/*
 * compute total adult escapement from individual escapements
 *	precondition:  escapement[] set
 */

double Stock::adult_escp()
{
    double escp = 0;

    for (Age age = ADULT_AGE; age <= age.top(); ++age)
	escp += escapement[age];

    return escp;
}

/*
 * age cohorts 2 - max; set new age1 cohort abundance
 *	postcondition: cohort[] aged
 */

void Stock::age_cohorts(double age1_abundance)
{
    // psc model checks for negative values here, but we did that earlier
    for (Age nage=AGE5, oage=AGE4; nage >= AGE2; --nage, --oage)
	cohort[nage] = cohort[oage];

    // better check this one 
    cohort[AGE1] = NonNeg(age1_abundance);
}

// intermediate data access

double Stock::get_adult_term_run() const
{
    double total = 0;
    for (Age age=ADULT_AGE; age <= age.top(); ++age)
	total += get_term_run(age);
    return total;
}


/*
 * access the summary data to get total escapements for a given year
 */

double Stock::get_adult_escapement(int year) const
{
    double esc = 0;
    
    for (Age age = ADULT_AGE; age <= age.top(); ++age)
	esc += get_escapement(age, year);

    return esc;
}

double Stock::get_total_pre_idl_esc(int year) const
{
    double tot = 0;

    for (Age age = FIRST_HV_AGE; age <= age.top(); age++)
	tot += get_escapement(age, year);

    tot /= inter_dam_loss(year);

    return tot;
}

double Stock::get_term_ocn_cat(Age age, int year) 
{
    double tot = 0;
    for (Harvest* hv = hv_list.head(); hv; hv = hv_list.next())
	if (!hv->isterm() && hv->get_fishery()->ocean_net()
	    && age >= hv->get_fishery()->get_term_net_age())
	    tot += (hv->get_term_catch(age, year)
		    + hv->get_term_shakers(age, year)
		    + hv->get_cnr_term_legals(age, year)
		    + hv->get_cnr_term_sublegals(age, year));
    return tot;
}

// Return true term run for an age.
// Should be used for term_stats_age <= age <= age.top()
double Stock::get_true_term_run(Age age, int year) 
{
    return get_term_run(age, year) - get_term_ocn_cat(age, year);
}

double Stock::get_ocn_adult_eq_catch(int year) 
{
    double tot = 0;
    for (Harvest* hv = hv_list.head(); hv; hv = hv_list.next())
    {
	for (Age age = FIRST_HV_AGE; age <= age.top(); ++age)
	{
	    tot += (hv->get_preterm_catch(age, year)
		    + hv->get_preterm_shakers(age, year)
		    + hv->get_cnr_preterm_legals(age, year)
		    + hv->get_cnr_preterm_sublegals(age, year))
		* get_adult_eq(age, year);
	}
    }
    return tot;
}

double Stock::get_term_adult_eq_catch(int year) 
{
    double tot = 0;
    for (Harvest* hv = hv_list.head(); hv; hv = hv_list.next())
    {
	for (Age age = FIRST_HV_AGE; age <= age.top(); ++age)
	    tot += hv->get_term_catch(age, year)
		+ hv->get_term_shakers(age, year)
		+ hv->get_cnr_term_legals(age, year)
		+ hv->get_cnr_term_sublegals(age, year);
    }
    return tot;
}

double Stock::get_exp_denom1(int year) 
{
    return get_total_pre_idl_esc(year)
	+ get_ocn_adult_eq_catch(year)
	+ get_term_adult_eq_catch(year);
}

double Stock::get_exp_denom2(int year) 
{
    double tot = 0;
    for (Age age = FIRST_HV_AGE; age <= age.top(); age++)
	tot += get_abundance(age, year) * get_surv_rt(age)
	    * get_adult_eq(age, year);
    return tot;
}

double Stock::get_ocn_adult_eq_hr1(int year) 
{
    return get_ocn_adult_eq_catch(year) / get_exp_denom1(year);
}

double Stock::get_ocn_adult_eq_hr2(int year) 
{
    return get_ocn_adult_eq_catch(year) / get_exp_denom2(year);
}

double Stock::get_tot_adult_eq_hr1(int year) 
{
    return (get_ocn_adult_eq_catch(year) + get_term_adult_eq_catch(year))
	/ get_exp_denom1(year);
}

double Stock::get_tot_adult_eq_hr2(int year) 
{
    return (get_ocn_adult_eq_catch(year) + get_term_adult_eq_catch(year))
	/ get_exp_denom2(year);
}

// calculate in-river harvest of this stock 

double Stock::get_river_catch(Age age, int year) const
{
    double river_catch = 0;
    
    Harvest *hv;
    HvIter hv_iter(hv_list);
    while (hv = ++hv_iter)
    {
	// find harvests which are strictly terminal (all ages)
	if (hv->isterm())
	    river_catch += hv->get_term_catch(age, year);
    }
    return river_catch;
}

// another method of ocean harvest, for slcm

double Stock::get_ocean_catch(Age age, int year) const
{
    return get_total_catch(age, year) - get_river_catch(age, year);
}
