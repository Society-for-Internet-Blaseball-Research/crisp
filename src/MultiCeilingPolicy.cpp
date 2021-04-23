// MultiCeilingPolicy.cc

#include "MultiCeilingPolicy.h"
#include "globals.h"
#include "Fishery.h"
#include "Harvest.h"

#ifdef DEBUG
#include <iostream.h>
#endif

class HarvestList;

// take preterm harvests.
// the output of this routine is current information in the harvest
// catches, and updated special morts arrays in the stocks (which should have
// been cleared at the start of this year).  see more detailed comment
// for take_terminal_harvests() below.

void
MultiCeilingPolicy::take_preterm_harvests()
{
    for (int i=0; i < fishlist.num(); ++i) {
	const HarvestList &hvl = fishlist[i].get_harvest_list();
	hvl.traverse(&Harvest::preterm_harvest);
	fishlist[i].set_shakers(PRETERM);
	hvl.traverse(&Harvest::preterm_cnrs);
	hvl.traverse(&Harvest::sum_special_mort_in_stock);
    }
}

// take multiphase harvests.  in the terminal phase, this policy must
// be processed before any others.  fisheries under the multiphase
// policy take harvests in both the preterm and terminal tracking
// phases, and are ceilinged.  to manage this, harvesting is done
// here, after one pass through the preterm phase has been completed.
// iteration over both preterminal and terminal harvesting may be
// required for all the fisheries under this policy to converge on the
// correct ceilings.
//
// Note: the terminal_run may be updated as this routine executes,
// since new preterminal harvests are calculated.
//
// preconditions:
//	all preterm catches up to date in harvests 
//	regular and special morts up to date in stocks (first pass)
//	terminal_run in stocks up to date
// postconditions:
//	terminal catches up to date in these harvests, and special morts 
//	up to date in stocks
//	terminal_run in stocks corrected and up to date


void
MultiCeilingPolicy::take_terminal_harvests()
{
#ifdef DEBUG
    int count = 0;
#endif

    // always make one pass through terminal phase
    Bool ceilings_done = FALSE;		
    while (!ceilings_done)
    {
	ceilings_done = TRUE;

	for (int i=0; i < fishlist.num(); ++i) {
	    fishlist[i].get_harvest_list().
		traverse(&Harvest::terminal_harvest);

	    // set the new ceiling ratio.  returns TRUE if within the
	    // cutoff range of the old ratio, or if no ceiling management
	    // is currently active.  any one out of range means
	    // we keep looping.

	    if ( ! fishlist[i].set_multi_ceiling_ratio())
		ceilings_done = FALSE;
	}

	if (!ceilings_done) {
#ifdef DEBUG
	    ++count;
#endif
	    for (int i = 0; i < Stocks.num(); ++i)
	    	Stocks[i].clear_special_morts();
	    
	    // recalculate all the preterm stuff 
	    take_preterm_harvests();

	    // recalculate the terminal_run
	    for (i = 0; i < Stocks.num(); ++i)
		Stocks[i].maturate();

	}
    } // ceilings_done

    // finish up incidental morts
    for (int i=0; i < fishlist.num(); ++i) {
	fishlist[i].set_shakers(TERM);	
	fishlist[i].get_harvest_list().traverse(&Harvest::terminal_cnrs);
    }

#ifdef DEBUG
    cout << count << " additional pass(es) to converge multi ceilings" << endl;
#endif    
}

