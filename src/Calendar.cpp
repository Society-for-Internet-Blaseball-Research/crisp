// Calendar implementations

#include <assert.h>
#include <iostream.h>
#include "Calendar.h"


// static vars

unsigned int Calendar::num_years = 0;
unsigned int Calendar::base_cal_year = 0;
unsigned int Calendar::base_sim_year = 0;
unsigned int Calendar::cur_year = 0;

// public ctor.  allows only one public calendar to ever be made.

Calendar::Calendar(const int nyrs, const int base, const int sim) 
{
    if (num_years)
    {
	cerr << "Programmer Error: only 1 Calendar base class "
	    "object allowed." << endl;
	assert(0);
    }
    num_years = nyrs;
    base_cal_year = base;
    base_sim_year = sim;
    cur_year = 0;
}

// protected ctor for subclasses

Calendar::Calendar()
{
    if (!num_years)
    {
	cerr << "Programmer Error: base Calendar must be instantiated "
	    "before subclasses." << endl;
	assert(0);
    }
}
