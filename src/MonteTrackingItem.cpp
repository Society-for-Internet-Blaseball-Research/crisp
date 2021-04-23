// MonteTrackingItem.cc

#include <iostream.h>
#include <assert.h>
#include <rw/tpslist.h>
#include "strtools.h"
#include "MonteTrackingItem.h"

int MonteTrackingItem::ngames = 0;

// allocate or reallocate the results array.  it needs to be of size
// [ngames][nyears - monte_start_year].  accounts for user changes in
// size limits.

void MonteTrackingItem::realloc_results()
{
    // check to see if reallocation is necessary
    if (game_size != ngames || year_size != nyears - monte_start_year)
    {
	delete_results();

	// reallocate
	game_size = ngames;
	year_size = nyears - monte_start_year;
	if (game_size && year_size)
	{
	    results = (double **) new double* [game_size];
	    assert(results);
	    for (int i=0; i < game_size; ++i){
		results[i] = new double[year_size];
		assert(results[i]);
	    }
	}
    }
    // zero contents
    for (int i=0; i < game_size; ++i)
    {
	strzero((char *)results[i], sizeof(double)*year_size);
    }
}

// delete the results array

void MonteTrackingItem::delete_results()
{
    if (results)
    {
	for (int i=0; i < game_size; ++i)
	    delete [] results[i];
	delete [] results;
    }
    results = 0;
}

// default virtual per-game action routine.  just reallocates result array
// if necessary.  subclasses almost certainly need to call this at the
// start of their own game_action() routinte, in order to have the
// sanity check performed and to account for possible user changes to
// the number of games or monte start year.

void MonteTrackingItem::game_action(int game)
{
    // sanity checks
    if (game >= ngames)
    {
	cerr << "programmer error: max games exceeded in Monte Tracking"
	    << endl;
	assert(0);
    }
    if (ngames == 0)
    {
	cerr << "programmer error: MonteTracking game_action() called"
	    " with 0 games configured"
	    << endl;
	assert(0);
    }
    if (game == 0)
    {
	realloc_results();		// zeroes data; reallocates if needed
	data_extant = TRUE;		// assumes data is about to be generated
    }
}

// global tester fn for use by Rogue lists.  the data should be a pointer
// to an integer containing the desired id to match on using the virtual
// identify() fn.

RWBoolean FindMonteTracking(MonteTrackingItem* item, void* user_data)
{
    if (item->identify() == * (int *) user_data)
	return TRUE;
    else
	return FALSE;
}
