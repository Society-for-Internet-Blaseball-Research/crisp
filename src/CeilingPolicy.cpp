// CeilingPolicy.cc

#include "CeilingPolicy.h"
#include "Fishery.h"
#include "Harvest.h"

class HarvestList;

// take preterm harvests.  
// preconditions:
//	each fishery with harvests in this phase must not harvest in
//	any other phase.
//	reg morts in stocks cleared
// postconditions:
//	preterm catches up to date for these harvests
//	regular morts up to date in stocks

void CeilingPolicy::take_preterm_harvests()
{
    for (int i=0; i < fishlist.num(); ++i) {
	const HarvestList &hvl = fishlist[i].get_harvest_list();
	hvl.traverse(&Harvest::preterm_harvest);
	fishlist[i].enforce_ceiling(PRETERM);
	fishlist[i].set_shakers(PRETERM);
	hvl.traverse(&Harvest::preterm_cnrs);
	hvl.traverse(&Harvest::sum_reg_mort_in_stock);
    }
}

// take terminal harvests
// preconditions:
//	terminal_run up to date in stocks
//	each fishery with harvests in this phase must not harvest in
//	any other phase.
// postconditions:
//	all terminal morts up to date in these harvests

void CeilingPolicy::take_terminal_harvests()
{
    for (int i=0; i < fishlist.num(); ++i) {
	const HarvestList &hvl = fishlist[i].get_harvest_list();
	hvl.traverse(&Harvest::terminal_harvest);
	fishlist[i].enforce_ceiling(TERM);
	fishlist[i].set_shakers(TERM);	// sets shakers in harvests
	hvl.traverse(&Harvest::terminal_cnrs);
    }
}
