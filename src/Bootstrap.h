// Bootstrap.h

// two classes, Bootstrap and BootstrapControl, which work together to
// implement a monte carlo input variable using a bootstrap technique.
// typical use is for one BootstrapControl to be created first, then
// passed in the ctor to a number of Bootstraps, in order to share the
// sample years selection and possibly the seedpod.  both classes are
// derived from MonteDataItem in order to provide monte carlo year
// information.

#ifndef BOOTSTRAP_H
#define BOOTSTRAP_H

#include <assert.h>
#include "MonteDataItem.h"
#include "SeedPod.h"
#include "Bool.h"

// BootstrapControl handles the management of the sample_years[] array for
// any Bootstrap objects created from it (see Bootstrap ctor).
// ctor options are:
//	no argument - global (single stream) random numbers; will seed
//		from clock if not already seeded elsewhere
//	int seed - create independent random number stream, using seed
//		provided; if seed == 0, seed from clock; allocate and
//		destroy seed pod internally
//	SeedPod *pod - use independent stream specified by this already
//		seeded pod; do not destroy pod in dtor
//
// note: there are a few shadows lurking here.  the "int seed" ctor is used
// instead of a long, so that it will always be called if 0 is passed as
// the parameter.  this prevents a null pod from ever being used
// inadvertently.  the int seed is passed to the ctor of SeedPod, which really
// takes a long.  oh well.  luckily, they're the same on our machine!  even
// if they weren't, it would still work; the seed would just be a few bits
// less "random".

class BootstrapControl : public MonteDataItem {
  public:
    BootstrapControl() : seedpod(0), internal_pod(FALSE) { ctor_fn(); }

    BootstrapControl(int seed) : internal_pod(TRUE)
    { seedpod = new SeedPod(seed); assert(seedpod); ctor_fn(); }

    BootstrapControl(SeedPod *pod) : internal_pod(FALSE), seedpod(pod)
    { ctor_fn(); }

    virtual ~BootstrapControl()
    { delete [] sample_years; if (seedpod && internal_pod) delete seedpod; }

    virtual void game_action(int game);		// resamples years

    const int * get_samples() const { return sample_years; }
    
  private:
    void ctor_fn();			// common ctor functionality
	
    int *sample_years;			// sample storage, size nyears
    SeedPod *seedpod;			// for multi-stream randomness option
    Bool internal_pod;			// internal seed pod?
};


// Bootstrap implements a data item which is a vector of doubles.  the
// game_action() fn resets the data vector values by bootstrapping from values
// in previous years.  the specific selection of previous years comes from
// the sample_years[] array, provided by the BootstrapControl in the ctor.
// it is the job of the BootstrapControl to resample as necessary.

class Bootstrap : public MonteDataItem {
  public:
    Bootstrap(const BootstrapControl *control, double * d)
	: data(d), sample_years(control->get_samples()) {}
    virtual ~Bootstrap() {}

    virtual void game_action(int game);		// reset this data for new game
    
  private:
    double * const data;		// pointer to data array, size nyears
    const int * sample_years;		// sample storage, size nyears
};


#endif
