// Bootstrap.cc - contains definitions for Bootstrap and BootstrapControl, since
// 	they work closely together.
   
#include <assert.h>
#include <iostream.h>
#include "Bootstrap.h"
#include "UniformInt.h"

// BootstrapControl ctor_fn used by all ctors.  
// precondition: nyears set (non-zero) in parent

void BootstrapControl::ctor_fn()
{
    if (!nyears)			// years not yet set in parent
    {
	cerr << "Error: attempting BootstrapControl setup"
	    "with number of years == 0" << endl;
	assert(0);
    }
    sample_years = new int[nyears];
    assert(sample_years);
}

// generate new BootstrapControl sample years.  many Bootstraps will often share
// a common set of sample years, reset at the start of each game by this
// BootstrapControl game_action() call.
//
// this fn must be called once before any game_action() calls to Bootstrap
// objects constructed from this BootstrapControl.
//
// precondition: nyears and monte_start_year properly set in parent before
//		first call to this fn

void BootstrapControl::game_action(int)
{
    // if seedpod == 0, single stream random #s are automatically used
    UniformInt x(0, monte_start_year - 1, seedpod);

    for (int i=0; i < nyears - monte_start_year; ++i)
	sample_years[i] = x.sample();

}


// bootstrap the data for a new game.  copy all the data from the current
// sample years into the monte simulation years.
//
// precondition: BootstrapControl::game_action() for this Bootstrap already
// 	called for this game to generate new sample_years[] entries

void Bootstrap::game_action(int)
{
    for (int i=0; i < nyears - monte_start_year; ++i)
	data[i + monte_start_year] = data[sample_years[i]];
}

