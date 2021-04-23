// MonteTrackingItem.h

#ifndef MONTE_TRACKING_ITEM_H
#define MONTE_TRACKING_ITEM_H

#include <rw/tooldefs.h>
#include "Bool.h"
#include "MonteDataItem.h"

// abstract base class to track a single tracking variable over all the games of
// a monte carlo run.  the virtual identify() fn is not to id the subclass,
// but to id the specific variable referred to within a given subclass (i.e.
// one subclass handles several distinct variables).  it provides a results
// array of doubles, which is of size [ngames][nyears-monte_start_year].  the
// subclass is expected to do some sort of conversion of the item[][] into the
// results[][] for the current game by using the virtual game_action()
// routine.  since the number of games and monte_start_year can be changed
// externally by the user, this class guarantees that the results[][] array
// is of correct size as long as the following rules are observed:
//	set_ngames() is called to set the correct # of monte games before
//		any game_action() is ever called.
//	MonteTrackingItem::game_action() must be called first in every derived
//		subclass game_action() fn.
//	results[][] should only accessed be by the virtual game_action()
//		fn, unless the get_game_size() and get_year_size() fns
//		are used to discover the actual sizes currently in effect.

class MonteTrackingItem : public MonteDataItem {
  public:
    MonteTrackingItem() : results(0), game_size(0), year_size(0)
	, data_extant(FALSE)
	{ realloc_results(); }

    ~MonteTrackingItem() { delete_results(); }
    
    // this must be called prior to any use
    static void set_ngames(int games) { ngames = games; }
    
    virtual void game_action(int game);
    virtual int identify() const = 0;		// identify type within subclass

    int get_game_size() const { return game_size; }
    int get_year_size() const { return year_size; }

    // read-only access to results.  WARNING: this ptr could change, so
    // values should be copied immediately
    const double** get_results() const
    { return (data_extant ? (const double**)results : NULL); }

  protected:
    double **results;			// size[ngames][nyears-monte_start_year]
    static int ngames;			// games in simulation

  private:
    void realloc_results();
    void delete_results();
    int game_size, year_size;		// actual sizes of results arrray
    Bool data_extant;
};

// extern for global find fn
extern RWBoolean FindMonteTracking(MonteTrackingItem* item, void* user_data);

#endif
