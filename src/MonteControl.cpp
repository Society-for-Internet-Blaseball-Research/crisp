// MonteControl.cc

#include <iostream.h>
#include <assert.h>
#include <string.h>
#include "log.h"
#include "globals.h"
#include "MonteControl.h"
#include "MonteStockIntrfc.h" 
#include "Bootstrap.h"
#include "RandGen.h"

//ctor
MonteControl::MonteControl(PFV sim_fn, int years, int first_year,
			   int ngames, long seed)
    : simulation_engine(sim_fn), nyears(years), monte_start_year(first_year),
      games(ngames)
{
    // making a local RandGen seeds the global random number generator.
    // seed == 0 seeds from the clock.  other modules can still use
    // multi-streams and explicit seeds if desired, and it won't interfere
    // with this, or vice versa.
    
    RandGen r(seed);
    
    if (nyears == 0)
    {
	cerr << "Error: illegal MonteControl init: nyears==0" << endl;
	assert(0);
    }
    MonteDataItem::init(nyears, monte_start_year);
    MonteTrackingItem::set_ngames(games);
}
    
// dtor
MonteControl::~MonteControl()
{
    controls.clearAndDestroy();
    data.clearAndDestroy();
    tracks.clearAndDestroy();
} 

// run a monte carlo simulation

void MonteControl::run()
{
    // re-init for possibly new start year and #games
    MonteDataItem::set_start_year(monte_start_year);
    MonteTrackingItem::set_ngames(games);

    RWTPtrSlistIterator<MonteDataItem> iter(controls);
    for (int game=0; game < games; ++game)
    {
//#ifdef DEBUG
	cout << "game " << game << endl;
//#endif	
	evNewGame_.notify(game);
	MonteDataItem *mdi;

	// perform group control ops, such as resampling bootstrap years
	iter.reset(controls);
	while (mdi = iter())
	    mdi->game_action(game);
	
	// reset all monte data items to new values for upcoming game
	iter.reset(data);
	while (mdi = iter())
	    mdi->game_action(game);

	(*simulation_engine)();

	// process monte output items

	iter.reset(tracks);
	while(mdi = iter())
	    mdi->game_action(game);
    }
}

int MonteControl::parse_output_config_file(char *fn)
{
    extern int SkipComment(FILE *);  // In IOCrud.cc
    char inp_str[256];
    FILE *fp;
    int erc = 0;

    if (!(fp = fopen(fn, "r")))
    {
        ::LogMsg(L_Error, "cannot open configuration file %s\n", fn);
        return 1;
    }

    if ((fscanf(fp, " %[^,\n\t ] ", inp_str) != 1)
	|| strcmp(inp_str, "config"))
	erc++;
    else
    {
	int ret = 0;
	while (!erc && (ret = fscanf(fp, " %[^,\t\n ] ", inp_str) == 1))
	{
	    if (!strcmp(inp_str, "end"))
		return erc;
	    else if (!strcmp(inp_str, "output"))
	    {
		MonteOutputItem *output = 0;
		if (fscanf(fp, " %[^,\n\t ] ", inp_str) == 1)
		{
		    if (!strcmp(inp_str, "escapement"))
			output = new MonteEscapementOutput;
		    else if (!strcmp(inp_str, "escapement_quantiles"))
			output = new MonteEscQuantileOutput;
		    else
		    {
			::LogMsg(L_Error,
				 "unknown variable specification.\n");
			erc++;
		    }
		}
		if (output && output->read(fp))
		    delete output;
		else if (output)
		    outputs.append(output);
	    }
	}
	if (ret == EOF)
	    erc = 1;
    }
    return erc;
}

int MonteControl::write(char *prefix)
{
    MonteOutputItem * moi;
    RWTPtrSlistIterator<MonteOutputItem> iter(outputs);
    int erc = 0;

    iter.reset(outputs);
    while(moi = iter())
	erc += moi->write(prefix);

    return erc;
}

// set up a MonteControl from open file.
// switch this to iostream stuff someday.
//   precondition: open file (fp)
//   return 0 on success, 1 on error
//
// note: this routine is not part of the portable MonteControl module, and
// would need to be discarded or replaced in other implementations

int operator>>(FILE *fp, MonteControl& monte)
{
    extern int SkipComment(FILE *fp);	// in IOCrud.cc
    
    char inp_str[256];
    int erc=0;
    if ((fscanf(fp, " %[^,\n\t ] ", inp_str) != 1)
	|| SkipComment(fp)
	|| strcmp(inp_str, "monte"))
	erc = 1;
    else {
	int ret = 0;
	while (!erc && (ret = fscanf(fp, " %[^,\t\n ] ", inp_str) == 1)) {

	    // number of games
	    if (!strcmp(inp_str, "games")) {
		int games = 0;
		if (fscanf(fp, "%d", &games) != 1)
		    erc = 1;
		else monte.set_ngames(games);
	    }

	    // monte start year
	    else if (!strcmp(inp_str, "start_year")) {
		int start_year = 0;
		if (fscanf(fp, "%d", &start_year) != 1)
		    erc = 1;
		else {
		    // convert to index
		    start_year -= Chronographer->base_year();
		    monte.set_start_year(start_year);
		}
	    }

	    // seed for global random number generator
	    else if (!strcmp(inp_str, "seed")) {
		long seed = 0;
		if (fscanf(fp, "%ld", &seed) != 1)
		    erc = 1;
		else
		    monte.reseed(seed);
	    }
	    
	    // monte ouputs
	    else if (!strcmp(inp_str, "track")) {
		if (fscanf(fp, "%s", inp_str) != 1)
		    erc = 1;
		else {
		    if (!strcmp(inp_str, "escapement")) {
			for (int i=0; i < Stocks.num(); ++i) {
			    MonteDataItem* monte_esc =
				Stocks[i].get_monte()->make_MonteTrackingItem(
				    MonteStockTracking::ESCAPEMENT);
			    monte.add_track(monte_esc);
			}
		    }
		    else {
			LogMsg(L_Warning, "unrecognized monte tracking request: "
			       "%s\n", inp_str);
		    }
		}
	    }
	    else if (!strcmp(inp_str, "output_config_file"))
		if (fscanf(fp, "%s", inp_str) != 1)
		    erc = 1;
		else
		    erc += monte.parse_output_config_file(inp_str);
	    else if (!strcmp(inp_str, "end")) {
		break;
	    }
	    else {
		LogMsg(L_Error, "unrecognized token %s in monte config\n",
		       inp_str);
		erc = 1;
		break;
	    }
	}
	if (ret == EOF)
	    erc = 1;
    }
    if (erc)
	LogMsg(L_Error, "trouble reading monte config.\n");

    return erc;
}
