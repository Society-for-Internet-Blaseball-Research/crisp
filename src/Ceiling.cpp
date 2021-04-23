// Ceiling definitions

#include <assert.h>
#include <iostream.h>
#include "strtools.h"
#include "Ceiling.h"
#include "Fishery.h"
#include "Harvest.h"

unsigned int Ceiling::first = 0;	// year indices, not calendar years
unsigned int Ceiling::last = 0;
const double Ceiling::CEILING_TOLERANCE = 0.00001;

// this ctor takes calendar year initializers and converts
Ceiling::Ceiling(unsigned int f, unsigned int l)
{
    f -= base_year();
    l -= base_year();

    // check for bounds.  also, don`t allow statics to change once set
    // (this could change in the future)
    if (f < 0 || l < 0 || f > l 
	|| ((first || last) && (f != first || l != last)))
    {
	cerr << "Bad ceiling specifiers.  Exiting." << endl;
	assert(0);
    }
    first = f;
    last = l;

    alloc_ceilings();
}    

// initializer used by ctors
void Ceiling::alloc_ceilings()
{
    int sz = last - first +1;
	forced = new unsigned int[sz];
    assert(forced);
    // unforced all years by default
    for (int i=0; i < sz; ++i)
	forced[i] = 0;

    for (HarvestPhase phase; phase <= phase.top(); ++phase)
    {
		catches[phase] = new double[sz];
    	assert(catches[phase]);
		strzero((char *) catches[phase], sz * sizeof(double));
    }
    initial_ratios = new double[sz];
    assert(initial_ratios);
	
	strzero((char *) initial_ratios, sz * sizeof(double));
	strzero((char *) base_catch, sizeof(base_catch));
}

Ceiling::~Ceiling()
{
    delete [] forced;
    delete [] initial_ratios;
    for (HarvestPhase phase; phase <= phase.top(); ++phase)
	delete [] catches[phase];
}

// end of year wrapup.
// tests to see if in ceiling management phase.  if not, other
// actions are performed to store necessary information.
//
// note: the base period is defined as all years prior to the beginning
// of ceiling management.

void Ceiling::year_wrapup(const Fishery& f)
{
    if (year() >= first && year() <= last)
	return;
    else
    {
	if (year() < first)
	{
	    // clear data in the first year
	    if (year() == 0){
			    
			strzero((char *) base_catch, sizeof(base_catch));
			for (HarvestPhase phase; phase <= phase.top(); ++phase){
				strzero((char *) catches[phase],(last - first + 1) * sizeof(double));
			}
    	}

	    // total phase catches are tracked during the base period
    	Harvest *hv;
    	HvIter hv_iter(f.get_harvest_list());
    	while (hv = ++hv_iter)
	    {
		base_catch[PRETERM] += hv->get_catch(PRETERM);
		base_catch[TERM] += hv->get_catch(TERM);
	    }

	    // if last year of base period, compute average catch for the
	    // base period.  then, set the catches from the
	    // initial ratios and the computed average.

	    if (year() == first-1)
	    {
		base_catch[PRETERM] /= first; // average over base period
		base_catch[TERM]    /= first; // average over base period
		for (unsigned int i=0; i < last-first+1; ++i)
		{
		    catches[PRETERM][i] =
			base_catch[PRETERM] * initial_ratios[i];
		    catches[TERM][i] =
			base_catch[TERM] * initial_ratios[i];
		}
	    }
	}
	return;
    }
}
