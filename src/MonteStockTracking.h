// MonteStockTracking.h

#ifndef MONTE_STOCK_TRACKING_H
#define MONTE_STOCK_TRACKING_H

#include "MonteTrackingItem.h"

// class to do the monte carlo tracking for a single stock variable.  this
// class inherits from MonteTrackingItem to handle the data storage.  it can
// handle different variables within a stock, identifying each with an
// enumerated type.  this identification is necessary so that the user
// interface can later display the correct information.  eventually this could
// be changed to a set of derived classes instead, if desired.  also, this
// class could be redone as a template to provide generic functionality
// for most (all?) monte Tracking objects.

//class StockSummary;
#include "StockSummary.h"

typedef double (StockSummary::*PCSSFD)(int) const;

class MonteStockTracking : public MonteTrackingItem {
  public:
    enum MSOItemType
    {
	ESCAPEMENT,	// This one's used.
			// The rest are merely hooks, and may never be used.
	ABUNDANCE, SUBLEGAL_CNR, LEGAL_CNR,
	TOT_CATCH, PRETERM_CATCH, TERM_CATCH,
	OCN_EXPLOIT, TOT_EXPLOIT, TRUE_TERM_RUN
    };	// type identifiers
    
    MonteStockTracking(const StockSummary* ss, MSOItemType tp);
    ~MonteStockTracking() {}
    
    virtual void game_action(int game);
    virtual int identify() const { return id; }

  private:
    const StockSummary* stock_summary;	// where the data lives
    const MSOItemType id;
    PCSSFD access_fn;		// Pointer to Const StockSummary Fn returning
    				// Double, takes int year argument
};

#endif


