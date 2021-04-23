// harvest tactics class

#ifndef HARVEST_TACTICS_H
#define HARVEST_TACTICS_H

#include <assert.h>
#include "Calendar.h"

class FloatSliderDisplay;
class Harvest;
class IOCrud;

// tactics manager for a harvest object

class HarvestTactics : public Calendar {
  friend class Harvest_UI;
public:
    HarvestTactics();
    ~HarvestTactics() { delete [] fps; }
    void set_harvest_tactics(Harvest& hv);  // currently no-op

    // return the fp for the current year
    double fp() const { return fps[year()]; }
	double gui_get_fps(int year) { return fps[year]; }
	void gui_set_fps(int year, double val){ fps[year] = val; }
    // parsing funuctions.  psc style.
    int parse_fp(IOCrud *, int);

private:
    // yearly fps
    double *fps;
};


#endif
