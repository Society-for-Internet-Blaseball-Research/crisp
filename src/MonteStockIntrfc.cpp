// MonteStockIntrfc.cc

#include "log.h"
#include "MonteStockIntrfc.h"
#include "Bootstrap.h"
#include "Stochastic.h"
#include "StockConfig.h"


// make a bootsrap ev

MonteDataItem*
MonteStockIntrfc::make_ev_bootstrap(const BootstrapControl *bc) const
{
    Bootstrap* bs = new Bootstrap(bc, config->get_ev_ptr());
    if (!bs)
	LogMsg(L_Fatal, "unable to alloc mem for Bootstrap EV");
    return bs;
}

// make a stochastic normal ev

MonteDataItem* MonteStockIntrfc::make_stoch_norm(double mu, double sigma) const
{
    StochasticNorm* stoch = new StochasticNorm(config->get_ev_ptr(), mu, sigma);
    if (!stoch)
	LogMsg(L_Fatal, "unable to alloc mem for Stoch Norm EV");
    return stoch;
}

// make a stochastic log normal ev

MonteDataItem*
MonteStockIntrfc::make_stoch_log_norm(double mu, double sigma) const
{
    StochasticNorm* stoch =
	new StochasticLogNorm(config->get_ev_ptr(), mu, sigma);
    if (!stoch)
	LogMsg(L_Fatal, "unable to alloc mem for Stoch Log Norm EV");
    return stoch;
}

// create a MonteTrackingItem of the requested type.  add it to the internal
// list.  it is not deleted by this class, so it better happen elsewhere!

MonteStockTracking*
MonteStockIntrfc::
make_MonteTrackingItem(MonteStockTracking::MSOItemType tp) 
{
    MonteStockTracking* mso = new MonteStockTracking(summary, tp);
    if (!mso)
	LogMsg(L_Fatal, "unable to alloc mem for MonteStockTracking");
	
    tracks.insert(mso);
    return mso;
}

// find and return a requested MonteStockTracking

const MonteStockTracking*
    MonteStockIntrfc::
        find_MonteTrackingItem(MonteStockTracking::MSOItemType tp) const
{
    int type=tp;

    // this cast is ok, because only MonteStockOuputs on this list
    return (const MonteStockTracking *) tracks.find(::FindMonteTracking, &type);
}
