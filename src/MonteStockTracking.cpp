// MonteStockTracking.cc

#include "StockSummary.h"
#include "MonteStockTracking.h"

// ctor sets id and pointer to appropriate access fn

MonteStockTracking::MonteStockTracking(const StockSummary *ss, MSOItemType tp)
    : stock_summary(ss), id(tp)
{
    switch(id)
    {  
      case ESCAPEMENT:
	access_fn = &StockSummary::get_adult_escapement;
	break;
      default:
	// programmer error
	assert(0);
    }
}

// game action, to actually save away the data.  only saves from
// monte_start_year to the end of the simulation.

void MonteStockTracking::game_action(int game)
{
    // don't forget to call parent fn to perform checks 
    MonteTrackingItem::game_action(game);

    for (int year=0; year < nyears - monte_start_year; ++year)
	results[game][year] =
	    (stock_summary->*access_fn)(year + monte_start_year);
}
