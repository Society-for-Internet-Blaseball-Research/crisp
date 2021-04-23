// MonteDataItem.h

// abstract base class for monte carlo data items.  

#ifndef MONTE_DATA_ITEM_H
#define MONTE_DATA_ITEM_H


// this class can be used for monte input or output data.  primary
// duty is to provide a fn, game_action(), which is should be called once
// per game, usually either to reset input data or store results.
//
// the static init() fn must be called before any child objects are made.
// the proper monte_start_year must be set (either via init() or
// set_start_year() before any game_action() occurs.
//
// MonteDataItem objects typically appear in lists.  they inherit from
// the Rogue link class for this purpose.

class MonteDataItem {
  public:
    virtual ~MonteDataItem() {}

    virtual void game_action(int game) = 0;	// perform per-game action

    // static init fn must be called once before children are made
    static void init(int nyrs, int start_year)
    { nyears = nyrs; monte_start_year = start_year; }

    // start year may be changed later
    static void set_start_year(int start_year) 
    { monte_start_year = start_year; }

    // unused, but necessary for rogue compilation
    int operator==(const MonteDataItem &i) { return (&i==this); }
    int operator<(const MonteDataItem &);
    
  protected:
    // ctor only used to build children
    MonteDataItem() {}

    static int nyears;			// number of simulation years
    static int monte_start_year;	// index of first year of randomization;
					//   (0 <= n < nyears)
};

#endif
