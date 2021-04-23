// MonteControl.h

// class to handle a monte carlo run of the model;  typically only one
// object of this class will be created.

#ifndef MONTE_CONTROL_H
#define MONTE_CONTROL_H

#include <rw/tpslist.h>
#include "MonteDataItem.h"
#include "MonteOutputItem.h"
#include "MonteTrackingItem.h"
#include "RandGen.h"
#include "implicit.h"

/*
 * one MonteControl class object runs the system.  the controls, data, and
 * tracks lists should consist of items allocated on the heap, which are
 * deleted when this object goes out of scope.  the total number of simulation
 * years must be specified up front, but the first monte year and number of
 * games may be specified later, as long as they occur before run() is called.
 * the seed is only used for single stream random numbers.  multi-streams are
 * handled in the MonteDataItems by passing seedpods around.
 *
 * this class provides a monte carlo shell for an existing simulation engine.
 * it is intended to be as non-intrusive as possible.  it contains
 * three lists of MonteDataItem.  In each game, the control list is walked
 * and the game_action() called for each member.  Items in this list should
 * handle control tasks for groups of monte input data items.  Then the data
 * list is walked, to prepare for this simulation game.  There should be one
 * member in this list for every monte data variable instance in the system.
 * then an external simulation fn is called through the pointer passed in the
 * ctor, which should perform the simulation game.  finally, the outputs list
 * is walked.  there should be one member of this list for each instance of an
 * output data variable which is to be summarized.
 *
 * the actual simulation classes (e.g. Stock) will have to create the instances
 * of MonteDataItem for insertion into these lists, usually by creating
 * instances of subclass objects which reference the particular data desired.
 * the simulation classes may also wish to keep their own lists of some of
 * these (e.g. the output items) to make it easier for the user interface to
 * access the result data.
 */

typedef void (*PFV)();	// ptr to fn returning void

	//Implicit function invocator.. used to notify other objects that a new game
	//has been started.
typedef utImplicit1<const int> signal_int; 
    
class MonteControl {
  public:
    MonteControl(PFV sim_fn, int years, int first_year=0,
		 int ngames=1, long seed=0);
    ~MonteControl();

    // if not specified in ctor
    void set_start_year(int yr)		
    { monte_start_year = yr; MonteDataItem::set_start_year(yr); }
    void set_ngames(int ng) { games = ng; MonteTrackingItem::set_ngames(ng); }
    void reseed(long seed) { RandGen r(seed); }  // see comment in ctor
    
    void run();

    int get_ngames() const { return games; }
    void add_control(MonteDataItem *mdi) { controls.insert(mdi); }
    void add_data(MonteDataItem *mdi) { data.insert(mdi); }
    void add_track(MonteDataItem *mdi) { tracks.insert(mdi); }
    
    int parse_output_config_file(char *fn);
    int write(char *prefix);
	signal_int *evNewGame(){ return &evNewGame_; }

  private:
	signal_int evNewGame_;      // new game started event, used to show progress meters, etc.
    PFV simulation_engine;		// ptr to simulation engine fn
    const int nyears;			// # of simulation years
    int monte_start_year;		// year to start monte variance
    int games;				// monte games
    RWTPtrSlist<MonteDataItem> controls; // control groups of monte data
    RWTPtrSlist<MonteDataItem> data;	// all monte carlo data items
    RWTPtrSlist<MonteDataItem> tracks;	// all monte carlo output items
    RWTPtrSlist<MonteOutputItem> outputs; // all monte file outputs.
};

// first crack at proper input fns.  it's still a bit odd, of course.
// eventually it will change to iostream based stuff.
// returns 0 on success, non-zero on error.

#include <stdio.h>

int operator>>(FILE* fp, MonteControl& monte);

#endif

