// RandGen.h

// base class to handle the global random number generator.  

#ifndef RAND_GEN_H
#define RAND_GEN_H

#include <iostream.h>
#include <assert.h>
#include <math.h>
#include "SeedPod.h"
#include "sample.h"

extern double get_rand(double dseed);

class RandGen {
  public:
    // for a single global stream
    RandGen() : pod(&global_pod) {}
    RandGen(long seedval) : pod(&global_pod) { reseed(seedval); }

    // for multiple user-controlled streams; revert to single stream if sp==0
    RandGen(SeedPod *sp) : pod(sp ? sp : &global_pod) {}

    // default copy ctor and op= are correct
    
    double get_sample() const		// non-virtual for speed
    {  return drand(pod->val()); } //{ return erand48(*pod); }
	
  protected:
    SeedPod *pod;

  private:
    void reseed(long seedval) { if (seedval) global_pod = seedval; }
    static SeedPod global_pod;		// automatically seeded from the clock
	
};

#endif
