// Harvest class implementations

#include <math.h>
#include <stdlib.h>
#include "log.h"
#include "Harvest.h"
#include "Fishery.h"
#include "Stock.h"

const double Harvest::MAX_CATCHABILITY = 5.0;	// maximum poisson catchability

//ctor
Harvest::Harvest(Stock *s, Fishery *f) : stock(s), fish(f), results(NULL)
{
    terminal = FALSE;
    term_type = ALL_PRETERM;

	results.setHarvestPtr( this );

    harvest_rate = 0;
    catchability = 0;
    for (HarvestPhase phase; phase <= phase.top(); ++phase)
    {
	mdl_catch[phase] = 0;
	shakers[phase] = 0;
	cnr_sublegal_catch[phase] = 0;
	cnr_legal_catch[phase] = 0;
    }
}

// data dependent inits
 
void Harvest::final_inits()
{
    // set the term_type
    if (terminal)
	term_type = ALL_TERM;
    else if (!fish->ocean_net())
	term_type = ALL_PRETERM;
    else
    {
	term_type = ALL_PRETERM;
	for (Age age = FIRST_HV_AGE; age <= age.top(); ++age)
		if (age >= fish->get_term_net_age())
		    term_type = MIXED;
    }
}

// yearly initialization

void Harvest::year_init(int)
{
    for (HarvestPhase phase; phase <= phase.top(); ++phase)
    {
	mdl_catch[phase] = 0;
	shakers[phase] = 0;
	cnr_sublegal_catch[phase] = 0;
	cnr_legal_catch[phase] = 0;
    }
}

// is this an active harvest, or may it be pruned away?

Bool Harvest::inactive() const
{
    for (Age age = FIRST_HV_AGE; age <= age.top(); ++age)
	if (harvest_rate[age])
	    return FALSE;
    return TRUE;
}


Bool Harvest::isterm(Age age) const
{
    return (term_type == ALL_TERM ||
	    (term_type == MIXED && age >= fish->get_term_net_age()))
	? TRUE : FALSE;
}

// calculate preterminal harvest for all cohorts in this harvest.
// note that all policy scalars start at 1.0 for the first pass in
// a new year, and are adjusted on subsequent passes.
//
//	precondition:  Stock.cohort[] contains post-ocean mort abundances
// 	postcondition: mdl_catch[PRETERM][] set

void Harvest::preterm_harvest()
{
    if (term_type == ALL_TERM) return;	// optimization
    
    for (Age age = FIRST_HV_AGE; age <= age.top(); ++age)
    {
	if ( ! isterm(age))
	{
	    double adj_hr = hv_rate(age) * fish->policy_hv_scalar();
	    mdl_catch[PRETERM][age] = stock->get_cohort(age) * adj_hr;
#ifdef DEBUG
	    if (adj_hr > 1.0)
	    {
		::LogMsg(L_Warning, "harvest rate %.2lf for preterm %s, \n"
			 "\tage %s, in %s\n",
			 adj_hr, stock->get_name(), age.string(),
			 fish->get_name());
	    }
#endif    
	}
    }
}


// calculate terminal harvest for all cohorts in this harvest
// note that all ceiling scalars start at 1.0 for the first pass in
// a new year, and are adjusted on subsequent passes.
//
// 	precondition:  terminal_run[]
//	postcondition: mdl_catch[TERM][] set

void Harvest::terminal_harvest()
{
    if (term_type == ALL_PRETERM) return;	// optimization

    for (Age age = FIRST_HV_AGE; age <= age.top(); ++age)
    {
	if (isterm(age))
	{
	    double adj_hr = hv_rate(age) * fish->policy_hv_scalar();
	    mdl_catch[TERM][age] = stock->get_term_run(age) * adj_hr;
#ifdef DEBUG
	    if (adj_hr > 1.0)
	    {
		::LogMsg(L_Warning, "harvest rate %.2lf for terminal %s, \n"
			 "\tage %s, in %s\n",
			 adj_hr, stock->get_name(), age.string(),
			 fish->get_name());
	    }
#endif	    
	}
    }
}

// bounded_terminal_harvest.  new style of harvest computation, currently
// used on a limited basis.  almost identical to terminal_harvest() above.
// eventually may become the standard harvest fn.
//
// precondition: catchability already set
// other preconditions and postconditions:  see terminal_harvest()

void Harvest::bounded_terminal_harvest()
{
    if (term_type == ALL_PRETERM) return;	// optimization

    for (Age age = FIRST_HV_AGE; age <= age.top(); ++age)
    {
	if (isterm(age))
	{
	    mdl_catch[TERM][age] = stock->get_term_run(age) *
		(1.0 - exp(-catchability[age] * fish->policy_hv_scalar()));
	}
    }
}

// adjust the harvest for a given phase by multiplying in a scalar.  this
// may be used to enforce ceilings after the first pass of harvest
// calculations.

void Harvest::adjust_harvest(HarvestPhase ph, double scalar)
{
    for (Age age = FIRST_HV_AGE; age <= age.top(); ++age)
	if (phase(age) == ph)
	{
	    mdl_catch[ph][age] *= scalar;
#ifdef DEBUG
	    double adj_hr = hv_rate(age) * scalar;
	    if (adj_hr > 1.0)
	    {
		char *phstr = (ph == PRETERM) ? "preterm" : "terminal";
		::LogMsg(L_Warning, "harvest rate %.2lf for %s %s, \n"
			 "\tage %s, in %s\n",
			 adj_hr, phstr, stock->get_name(), age.string(),
			 fish->get_name());
	    }
#endif	    
	}
}
    
// sum the morts into the stock tallys, preterm PRETERM phase only
// sum into the regular or special morts as specified
//	precondition:  mdl_catch[PRETERM] already set
//		       cnr*[PRETERM] and shakers[PRETERM] set
//
// 	postcondition: stock regular morts updated

void Harvest::sum_mort_in_stock(MortType mt)
{
    for (Age age = FIRST_HV_AGE; age <= age.top(); ++age)
    {
	double mort = mdl_catch[PRETERM][age] + shakers[PRETERM][age]
	    + cnr_sublegal_catch[PRETERM][age] + cnr_legal_catch[PRETERM][age];
	if (mt == REGULAR)
	    stock->incr_reg_mort(age, mort);
	else
	    stock->incr_special_mort(age, mort);
    }
}

// calulate cnr morts (incidental mortality) for this phase, all cohorts
// 	precondition:  shaker calculation and harvest catches must already
//		have occured for this phase.  cnr_legals and sublegals must
//		be zeroed for this phase prior to this routine.
//	postcondition: cnr_legal and cnr_sublegal catches set for this harvest.

void Harvest::set_cnrs(HarvestPhase ph)
{
    if (term_type == ALL_TERM && ph == PRETERM)	// optimization
	return;
    
    for (Age age = FIRST_HV_AGE; age <= age.top(); ++age)
    {
	if (ph == phase(age))
	{
	    cnr_sublegal_catch[ph][age] =
		fish->sublegal_ratio() * shakers[ph][age];
	    cnr_legal_catch[ph][age] =
		fish->legal_ratio() * fish->shak_mort_rt() * mdl_catch[ph][age];
	}
    }
}

/*
 * access functions for in-simulation data
 */

// total phase catch over age

double Harvest::get_catch(HarvestPhase phase) const
{
    // optimization
    if (phase == PRETERM && term_type == ALL_TERM
	|| phase == TERM && term_type == ALL_PRETERM)
	return 0;			
    
    double c = 0;
    for (Age age = FIRST_HV_AGE; age <= age.top(); ++age)
	c += mdl_catch[phase][age];
    return c;
}

// get adult phase mortality for an age

double Harvest::get_phase_mort(HarvestPhase phase, Age age)
{
    return (get_catch(phase, age) + get_shakers(phase, age)
	    + get_cnrs(phase, age));
}


/*
 * Get total harvest rate for E-Z-vue.
 */

double Harvest::get_total_harvest_rate() const
{
    double tot = 0;
    for (Age age=FIRST_HV_AGE; age <= age.top(); ++age)
	tot += hv_rate(age);

    return tot;
}

/*
 * Non-member interface to above.
 */

double get_total_harvest_rate(Harvest *hv)
{
    return hv->get_total_harvest_rate();
}

/*
 * get output results
 */

double Harvest::get_total_catch(int year) const
{
    double tot = 0;
    for (Age age = FIRST_HV_AGE; age <= age.top(); ++age)
	tot += get_total_catch(age, year);

    return tot;
}

double Harvest::get_preterm_abundance(int year) const
{
    double tot = 0;
    if (!isterm())
	for (Age age = FIRST_HV_AGE; age <= age.top(); age++)
	    tot += stock->get_abundance(age, year)
		* stock->get_surv_rt(age)
		* get_base_harvest_rate(age)
		* fish->pv(age, year);
    return tot;
}

double Harvest::get_term_abundance(int year) const
{
    double tot = 0;
    if (isterm())
	for (Age age = FIRST_HV_AGE; age <= age.top(); age++)
	    tot += stock->get_term_run(age, year)
		* get_base_harvest_rate(age)
		* fish->pv(age, year);
    return tot;
}

double Harvest::get_abundance_index(int year) const
{
    if (!isterm())
	return get_preterm_abundance(year);
    else
	return get_term_abundance(year);
}
    
//GROT
// hv_rate kludge
#include <string.h>
#include <iostream.h>

void Harvest::funky_hv_reset(int year)
{
    extern int hv_kludge_type;

    if (!hv_kludge_type)
	return;
    
    if ((!strcmp(stock->get_abbrv(), "URB")
	 || !strcmp(stock->get_abbrv(), "LYF"))
	&& !strcmp(fish->get_name(), "Col R N"))
    {
	::LogMsg(L_Warning,"kludging new harvest rates in year %d\n", year);
	
	// reset to original vals in first year
	if (year == 0)			
	{
	    if (!strcmp(stock->get_abbrv(), "URB"))
	    {
		harvest_rate[AGE3] = 0.33663067;
		harvest_rate[AGE4] = 0.26002204;
		harvest_rate[AGE5] = 0.073872201;
	    }
	    else // LYF
	    {
		harvest_rate[AGE3] = 0.13648419;
		harvest_rate[AGE4] = 0.35312366;
		harvest_rate[AGE5] = 0.26998916;
	    }
	}
	// set new values in later years
	else				
	{
	    switch(hv_kludge_type)
	    {
	      case 1:
		harvest_rate[AGE3] = 0.2106;
		harvest_rate[AGE4] = 0.3509;
		harvest_rate[AGE5] = 0.3259;
		break;
	      case 2:
		harvest_rate[AGE3] = 0.1493;
		harvest_rate[AGE4] = 0.1614;
		harvest_rate[AGE5] = 0.1499;
		break;
	      case 3:
		harvest_rate[AGE3] = 0.4028;
		harvest_rate[AGE4] = 0.1277;
		harvest_rate[AGE5] = 0.1388;
		break;
	      case 4:
		harvest_rate[AGE3] = 0.3795;
		harvest_rate[AGE4] = -0.0276;
		harvest_rate[AGE5] = 0.005;
		break;
	      default:
		cout << "error, invalid hv kludge type " << hv_kludge_type << endl;
		exit(1);
	    }
	}
    }
}

double Harvest::hv_rate(Age age) const { 
	return harvest_rate[age] * tactics.fp() * fish->pv(age); 
} 
