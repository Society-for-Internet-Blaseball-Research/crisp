// MonteStockIntrfc.h

#ifndef MONTE_STOCK_INTRFC_H
#define MONTE_STOCK_INTRFC_H

#include <rw/tpslist.h>
#include "MonteStockTracking.h"

/*
 * this class manages the interface between a simulation Stock class
 * and the monte carlo module.  it is an insulating layer between the two,
 * for the purpose of maximizing modularity.  each Stock class owns one
 * MonteStockIntrfc object.  Stocks typically do not manipulate the
 * MonteStockIntrfc themselves, but maintain and return a pointer to it
 * upon request.
 *
 * this class knows how to create all MonteDataItems (or subclasses
 * thereof) for Stocks.  it handles both input and output subclasses.
 *
 * this class also provides basic search capability of the monte output
 * objects, for use by the GUI.  it basically just packages a list of
 * MonteTrackingItems corresponding to the particular Summary object.
 */

class StockConfig;
class StockSummary;
class MonteDataItem;
class BootstrapControl;

class MonteStockIntrfc {
  public:
    MonteStockIntrfc(StockConfig *sp, const StockSummary *ss)
	: config(sp), summary(ss) {}

    // dtor doesn't delete outputs members.  they are handled in MonteControl
    ~MonteStockIntrfc() {}		

    // allocate monte input data items
    MonteDataItem* make_ev_bootstrap(const BootstrapControl *bc) const;
    MonteDataItem* make_stoch_norm(double mu, double sigma) const;
    MonteDataItem* make_stoch_log_norm(double mu, double sigma) const;

    // allocate monte output data items and keep a list of them
    MonteStockTracking*
	make_MonteTrackingItem(MonteStockTracking::MSOItemType tp);

    // other access fns
    const MonteStockTracking*
	find_MonteTrackingItem(MonteStockTracking::MSOItemType tp) const;
    
  private:
    StockConfig* const config;
    const StockSummary* const summary;
    
    RWTPtrSlist<MonteTrackingItem> tracks; // only for MonteStockTracking items
};

#endif
