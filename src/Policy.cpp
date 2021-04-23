// Policy.cc
// a few default function definitions.  these are all pure virtual in the
// Policy class, so to be used by a derived class they must be called
// explictly with the scope operator.

#include "Policy.h"
#include "Fishery.h"
#include "Harvest.h"

// take preterm harvests.  the output of this routine is 
// current information in the harvest catches, and updated 
// reg morts arrays in the stocks (which should have been
// cleared at the start of this year)

void Policy::take_preterm_harvests()
{
    for (int i=0; i < fishlist.num(); ++i) {
	const HarvestList &hvl = fishlist[i].get_harvest_list();
	hvl.traverse(&Harvest::preterm_harvest);
	fishlist[i].set_shakers(PRETERM);
	hvl.traverse(&Harvest::preterm_cnrs);
	hvl.traverse(&Harvest::sum_reg_mort_in_stock);
    }
}

// take terminal harvests
// preconditions:
//	terminal_run up to date in stocks
// postconditions:
//	all terminal morts up to date in these harvests

void Policy::take_terminal_harvests()
{
    for (int i=0; i < fishlist.num(); ++i) {
	const HarvestList &hvl = fishlist[i].get_harvest_list();
	hvl.traverse(&Harvest::terminal_harvest);
	fishlist[i].set_shakers(TERM);	// sets shakers in harvests
	hvl.traverse(&Harvest::terminal_cnrs);
    }
}

