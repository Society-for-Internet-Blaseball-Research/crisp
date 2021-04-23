// model initializations

#include <iostream.h>
#include "NamedPtrVec.h" 
#include <assert.h>
#include <string.h>
#include "globals.h"
#include "Stock.h"
#include "Fishery.h"
#include "Harvest.h"
#include "Calendar.h"
#include "Calibrator.h"
#include "IOCrud.h"
#include "FisheryManagement.h"
#include "MonteControl.h"
#include "UI.h"
#include "Args.h"
// the underlying memory for the Stocks and Fisheries vectors are
// statically defined here.

static RWTValVector<Stock> stocklist_mem(0);
static RWTValVector<Fishery> fishlist_mem(0);

/*
 * initialize global structures.
 *	precondition:  harvests exists
 *	postcondition: stocks, fisheries, harvests, policy allocated
 *	return:        0 on success, non-zero on failure
 */

static int init_globals(const IOCrud &psc_config)
{
    // calendar must be allocated first 
    Chronographer = new Calendar(psc_config.get_num_years(),
				 psc_config.get_base_year(),
				 psc_config.get_sim_start_year()
				 );
    assert(Chronographer != 0);		// alloc error?

    // initialize the global stock and fishery pointer vecs
    stocklist_mem.reshape(psc_config.get_num_stocks());
    Stocks = NamedPtrVec<Stock>((Stock *)stocklist_mem.data(),int(stocklist_mem.length()));

    fishlist_mem.reshape(psc_config.get_num_fisheries());
    Fisheries = NamedPtrVec<Fishery>((Fishery *)fishlist_mem.data(),int(fishlist_mem.length()));

    // for now, allocate possible harvests.  prune some away later.
    for (int i=0; i < Stocks.num(); ++i)
	for (int j=0; j < Fisheries.num(); ++j)
	{
	    Harvest *h = new Harvest(&Stocks[i], &Fisheries[j]);
	    if (!(h && Harvests.append(h)))
            return -1;  // alloc error?
	}

    // create the MonteCarlo controller

    extern void RunTheModel();	// simulation engine
    MonteCarlo = new MonteControl(RunTheModel, Chronographer->nyears());
    assert(MonteCarlo != 0);		// alloc error?
    
    return 0;
}

/*
 * main initialization routine; subroutines typically handle the err messeges
 *	return: 0  - success
 *		-1 - error
 */

int ModelInit(Args *args){

    IOCrud psc_config(args->get_datafile());

    /* the following operations are order dependent:
     * read the setup data; allocate global structures; read remaining data
     */
    if (psc_config.read_config() != 0)
	return -1;
    if (init_globals(psc_config) != 0)
	return -1;
    if (psc_config.read_data() != 0)
	return -1;
    // user args override number of monte games, if present
    int ngames = args->get_monte_games();
    if (ngames)
	MonteCarlo->set_ngames(ngames);

    // remove unused harvests from the main list, then create the harvest
    // lists for the individual objects
    Harvests.prune(&Harvest::inactive);
    for (int i=0; i < Fisheries.num(); ++i)
	Fisheries[i].make_harvest_list(Harvests);
    for (i=0; i < Stocks.num(); ++i)
	Stocks[i].make_harvest_list(Harvests);

    // remaining data dependent inits, order dependent
    // (so far, harvests must come before the fishery manager)
    Harvests.traverse(&Harvest::final_inits);
    for (i = 0; i < Stocks.num(); ++i)
	Stocks[i].final_inits();
    FisheryManager.init_policies();
    if (Calib) Calib->read_ev_data(&psc_config);
    return 0;
}

// delete global objects

void ModelCleanup()
{
    delete Chronographer;
    delete MonteCarlo;
}

// perform year initializations

void YearInit(int year)
{
#ifdef DEBUG
    cout << "year " << year+Chronographer->base_year() << endl;
#endif    
    Chronographer->set_year(year);	       // set new year for all calendars
    for (int i = 0; i < Stocks.num(); ++i)
	Stocks[i].year_init(year);

    Harvests.traverse(&Harvest::year_init, year);

    for (i=0; i < Fisheries.num(); ++i)
	 Fisheries[i].year_init(year);

    //GROT - kludge to reset certain harvest rates
    extern int hv_kludge_type;
    if (hv_kludge_type)
	if (year == 0 || year+Chronographer->base_year() == 1994)
	    Harvests.traverse(&Harvest::funky_hv_reset, year);
}
