// engine module for crisp2
#include <iostream.h>
#include "globals.h"
#include "Stock.h"
#include "StockList.h"
#include "Harvest.h"
#include "Fishery.h"
#include "FisheryManagement.h"
#include "init.h"

/* this is the main engine for the crisp2 simulation.  it runs through each
 * of the model years, performing all of the necessary computations.  at the
 * lowest level data is stored in the harvests, but this data is collated
 * in the stocks incrementally.  catches, for instance, are calculated at
 * the harvest level, then later used to update the ocean abundances (or
 * terminal run, or escapements) in the stocks.  likewise for shakers and
 * other incidental mortalities.  final recruitment is done only in the stocks.
 * at the end of a year, wrapup routines are called to store desired results
 * in summary data areas.
 */

void RunTheModel()
{
    for (int year = 0; year < Chronographer->nyears(); ++year) {
	
	YearInit(year);
	
	for (int i = 0; i < Stocks.num(); ++i) {
	    Stocks[i].ocean_mortality();
	}
	
	FisheryManager.take_preterm_harvests();

	for (i = 0; i < Stocks.num(); ++i) 
	    Stocks[i].maturate();
	
	FisheryManager.take_terminal_harvests();
	FisheryManager.take_river_harvests();
	
	for (i = 0; i < Stocks.num(); ++i) {
	    Stocks[i].update_cohort_from_harvests();
	    Stocks[i].set_escapement();
	    Stocks[i].apply_idls(); // apply idls to escapements
	    double age1 = Stocks[i].spawn();
	    Stocks[i].age_cohorts(age1);
	    Stocks[i].year_wrapup();
	}
	
	Harvests.traverse(&Harvest::year_wrapup);
	
	for (i=0; i < Fisheries.num(); ++i)
	    Fisheries[i].year_wrapup();
    }
}
	
