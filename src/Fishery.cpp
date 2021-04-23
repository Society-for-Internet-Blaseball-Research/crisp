// Fishery class implementations

#include "Fishery.h"
#include "Harvest.h"
#include "HarvestList.h"
#include "Stock.h"

// Fishery class static members
Age Fishery::term_net_age = AGE3;

//inline
Fishery::Fishery() : name(0), abbrv(0),
    policy_type_(Policies::DEFAULT_POLICY), gear(TROLL),
    ocn_net_flg(FALSE), shaker_mort_rate(0), encntr_rt(0),
    policy_scalar(1.0)
{
	results.setFisheryPtr(this);
//  term_net_age = AGE3; don't set this here, it's static
}

void Fishery::year_init(int)
{
    policy_scalar = 1.0;
    tactics.year_init();
}

// take a general harvest list and traverse it, attaching all harvests
// which refer to this fishery to the local list.

void Fishery::make_harvest_list(HarvestList& hvl)
{
    for (Harvest* phv = hvl.head(); !hvl.at_end(); phv = hvl.next())
	if (phv->fishery_match(this))
	    if(!hv_list.append(phv))assert(0); // check for alloc failure
}

// routine to figure out if the fishery harvests in more than one
// logical phase.  used primarily in policy determination

Bool Fishery::ismultiphase() const
{
    HvIter hv_iter(hv_list);
    Bool all_term = (++hv_iter)->isterm();
    for (Harvest* phv = hv_iter.key(); phv; phv = ++hv_iter)
    {
	if (phv->isterm() != all_term || phv->ismultiphase())
	{
	    return TRUE;
	}
    }
    // if we get here then all harvs had the same type
    return FALSE;
}

// find a harvest for a given stock at this fishery.  return a pointer
// to the stock, or 0 if this stock not harvested here.

Harvest* Fishery::get_harvest(const Stock *stock) const
{
    for (Harvest *phv = hv_list.head(); phv; phv = hv_list.next())
	if (phv->stock_match(stock))
	    return phv;

    return 0;
}

// do shaker mort computations.  handles either ocean abundance or terminal
// run conditions, as selected by the phase parameter.  note that the output
// of this function is an update of the harvests associated with this fishery.
//
// preconditions:  phase catches up to date in harvests;
//		   phase==PRETERM: ocean abundances (cohort) in stocks accurate;
//		       i.e. no preterm harvests (catches) yet subtracted
//		   phase==TERM:	   terminal run in stocks accurate;
//		       i.e. no terminal harvests yet subtracted
// postconditions: shaker mort totals set for each harvest of this fishery.
//		   current encounter rate (phase dependent) set for this fishery

void Fishery::set_shakers(HarvestPhase phase)
{
    double f_catch = 0;
    double wgtd_pv = 0;
    double wgtd_pnv = 0;
    
    for (Harvest* hv = hv_list.head(); hv; hv = hv_list.next())
    	f_catch += hv->get_catch(phase);

    // set the encounter rate (and possibly pv/pnv weights)
    if (f_catch == 0)
    {
	encntr_rt = 0;
    }
    else
    {
	for (hv = hv_list.head(); hv; hv = hv_list.next())
	{
	    // set weighted catch in harvests
	    double wgtd_catch = hv->get_catch(phase) / f_catch;
	    hv->set_weighted_catch(wgtd_catch);
	
	    // set weighted pnvs
	    for (Age age = FIRST_HV_AGE; age <= age.top(); ++age)
	    {
		if (phase == hv->phase(age))
		{
		    double wgtd_cohort = wgtd_catch *
			((phase == PRETERM) ? hv->get_stock()->get_cohort(age)
			 : hv->get_stock()->get_term_run(age));
		    wgtd_pv  += wgtd_cohort * pv(age);
		    wgtd_pnv += wgtd_cohort * pnv(age);
		}
	    }
	}
    
	encntr_rt = (wgtd_pv) ? wgtd_pnv / wgtd_pv : 0;
    }

    double shakers = f_catch * encntr_rt * shaker_mort_rate;
    
    // set shaker morts in harvests
    for (hv = hv_list.head(); hv; hv = hv_list.next())
    {
	for (Age age = FIRST_HV_AGE; age <= age.top(); ++age)
	{	
	    if (phase == hv->phase(age))
	    {
		// this test catches wgtd_pnv divide by zero error 
		if (shakers)
		{
		    double wgtd_cohort = hv->get_weighted_catch() *
			((phase == PRETERM) ? hv->get_stock()->get_cohort(age)
			 : hv->get_stock()->get_term_run(age));
		    double frac_nv = wgtd_cohort * pnv(age) / wgtd_pnv;
		    hv->set_shakers(phase, age, frac_nv * shakers);
		}
		else
		    hv->set_shakers(phase, age, 0.0);
	    }
	}
    }
}

// utility function to apply the harvest scalar to all the harvests
void Fishery::apply_hv_scalar(HarvestPhase phase)
{
    for (Harvest *hv = hv_list.head(); hv; hv = hv_list.next())
	hv->adjust_harvest(phase, policy_scalar);
}


// void Fishery::enforce_ceiling(HarvestPhase phase)
//
// this routine enforces ceiling management for single phase
// fisheries.  if ceiling managment is in effect for the current year, it
// determines the proper scalar, then recomputes the harvests.
//
// NOTE: it is currently impossible to force a catch upon a fishery with no
// catch whatsoever.
//
// preconditions:	initial phase harvest catches accurate
//			other preconditions of Harvest::preterm_harvest()
//					    or Harvest::term_harvest()
// postconditions:	new harvest catches and ceiling scalar set

void Fishery::enforce_ceiling(HarvestPhase phase)
{
    // check for phase match. assumes single phase fishery.
    if (phase != hv_list.head()->phase(FIRST_HV_AGE))
	return;

    // see if we are in ceiling management. 
    if (tactics.non_ceilinged_year())
	return;
    
    double f_catch = 0;
    for (Harvest* hv = hv_list.head(); hv; hv = hv_list.next())
    	f_catch += hv->get_catch(phase);
    if (f_catch == 0)
	return;				// can`t force a non-catch!!
    
    if (tactics.forced_ceiling() || f_catch > tactics.catch_ceiling(phase))
	policy_scalar = tactics.catch_ceiling(phase) / f_catch;
    else
	return;

    apply_hv_scalar(phase);
}

// Bool Fishery::set_multi_ceiling_ratio()
//
// handles part of the iterative process for multi-phase ceilings.
// totals the phase catches, compares it to the ceiling total, determines
// a scalar, and compares it to the old ceiling ratio.  if it is above
// the cutoff, a new ceiling ratio is set.  harvests will be recomputed
// during the iteration, outside of this routine.  note that we don't
// have to compute ratios if the catch is less than the ceiling in a
// non-forced year during the first pass.  once we start iterating, however,
// we must keep at it until convergence.
//
// preconditions: all phase catches up to date in the harvests;
//		  previous ceiling_ratio accurate;
// postconditions:new ceiling_ratio accurate;
// return values: TRUE if no further iteration necessary on this fishery
//		       (either because the ratios are within tolerance,
//			or because ceiling management not currently active);
//		  FALSE if further iteration is necessary

Bool Fishery::set_multi_ceiling_ratio()
{
    // see if we are in ceiling management. 
    if (tactics.non_ceilinged_year())
	return TRUE;

    double f_catch = 0;
    for (Harvest* hv = hv_list.head(); hv; hv = hv_list.next())
    	f_catch += hv->get_catch(PRETERM) + hv->get_catch(TERM);
    if (f_catch == 0)
	return TRUE;			// can`t force a non-catch!!

    double ceiling = tactics.catch_ceiling(PRETERM) + tactics.catch_ceiling(TERM);

    // compute a ratio if the ceilings are forced, or if the catch exceeds
    // the ceiling, or if the ceiling scalar has already changed for
    // this fishery in a previous pass.
    
    if (tactics.forced_ceiling() || f_catch > ceiling
	|| policy_scalar != 1.0)
    {
	double this_ratio = f_catch / ceiling;
	if (1.0 - this_ratio > Ceiling::CEILING_TOLERANCE
	    || 1.0 - this_ratio < -Ceiling::CEILING_TOLERANCE)
	{
	    policy_scalar /= this_ratio;
	    return FALSE;
	}
    }

    return TRUE;
}

// result data access

// get the total catch over all ages for a year, also total preterminal
//  and terminal catches over all ages.

double Fishery::get_total_catch(int year) 
{
    double total = 0;
    
    for (Age age=FIRST_HV_AGE; age <= age.top(); ++age)
	total += get_total_catch(age, year);

    return total;
}

double Fishery::get_term_catch(int year) 
{
    double total = 0;
    
    for (Age age=FIRST_HV_AGE; age <= age.top(); ++age)
	total += get_term_catch(age, year);

    return total;
}

double Fishery::get_preterm_catch(int year) 
{
    double total = 0;
    
    for (Age age=FIRST_HV_AGE; age <= age.top(); ++age)
	total += get_preterm_catch(age, year);

    return total;
}

// &&&&&
double Fishery::get_abundance_index(int year) 
{
    double tot = 0;
    for (Harvest* hv = hv_list.head(); hv; hv = hv_list.next())
	tot += hv->get_abundance_index(year);
    return tot;
}
    
