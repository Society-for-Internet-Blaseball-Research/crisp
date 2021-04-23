// ceiling management

#ifndef CEILING_H
#define CEILING_H

#include "Bool.h"
#include "Calendar.h"
#include "Phase.h"

class IOCrud;
class Fishery;

/*
 * Ceiling class to handle the ceiling management for one fishery.  the
 * FisheryTactics class contains a pointer to one of these.  this is a
 * Calendar subclass, since it contains data for each year of the
 * simulation.  it also contains a few statics to handle 'global' data.
 */

class Ceiling : public Calendar {
  public:
    // the first ctor takes calendar year initializers.  the second assumes
    // that the first has been called at least once, and uses existing values.
    Ceiling(unsigned int f, unsigned int l); 
    Ceiling() { alloc_ceilings(); }
    ~Ceiling();

    // methods
    void year_wrapup(const Fishery& f);
    
    // data access
    Bool non_ceilinged_year() const
    { return (year() < first || year() > last) ? TRUE : FALSE; }

    // these two routines assume that the current year is in range!
    Bool forced_ceiling() const { return (forced[index()]) ? TRUE : FALSE; }
    double catch_ceiling(HarvestPhase phase) const
    	{ return catches[phase][index()]; }

    // parsing functions, psc style
    int read_ceilings(IOCrud *, int, int, int*);
    
    // intrfc functions.
    const int get_first()		{ return first; }
    const int get_last()		{ return last; }
    const double  get_initial_base_catch() 	{ return initial_base_catch; }
    double get_initial_ratio(int year){ return initial_ratios[year - first];}
    unsigned int get_forced(int year)	{ return forced[year - first]; }
	int set_initial_ratio(int year, double val){ initial_ratios[year - first] = val; return 1;}
	int set_forced(int year, unsigned int val){ forced[year-first] = val; return 1;}

    // public const
    static const double CEILING_TOLERANCE;
    
  private:
    void alloc_ceilings();		// used by ctors
    
    static unsigned int first;		// year indices, not calendar year
    static unsigned int last;

    // dynamic arrays, size last - first + 1
    unsigned int* forced;		// forced flag
    double* catches[NUM_PHASES];	// catch ceilings, by phase and year

    double initial_base_catch;		// base period average from initial data
    double* initial_ratios; 		// ratios from initial data or user
    double base_catch[NUM_PHASES];	// computed average base period catch
    
    // fns
    int index() const { return year() - first; } // convenience fn
};

#endif
