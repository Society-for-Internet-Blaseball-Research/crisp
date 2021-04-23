// UniformInt.h

// class to generate integer random samples from a uniform distribution.
// can handle either single stream or multi stream generators.

#ifndef UNIFORM_INT_H
#define UNIFORM_INT_H

#include "RandGen.h"

class UniformInt : public RandGen {
  public:
    UniformInt(int lb=0, int ub=1) : min(lb), max(ub), range(max-min+1) {}
    UniformInt(int lb, int ub, SeedPod *spod)
	: RandGen(spod), min(lb), max(ub), range(max-min+1) {}
    // default copy ctor and op= are correct
    
    int sample() const
    { return (int(get_sample() * range) + min); } // relies on truncation

  private:
    int min;			// inclusive min
    int max;			// inclusive max
    int range;			// for speed
};

#endif
