// RandNorm.cc

// implementation of a random number from a normal distribution

#include <math.h>
#include "RandNorm.h"


// return sample with mean 0 dev 1.  from "Numerical Recipes in C".
// conceptually const.

double RandNorm::normal() const
{
    register double r, v1, v2, fac;
    RandNorm * const mythis = (RandNorm * const) this;
    
    if (iset == 0) {
	do {
	    v1 = 2.0 * get_sample() - 1.0;
	    v2 = 2.0 * get_sample() - 1.0;
	    r = v1*v1 + v2*v2;
	} while (r >= 1.0);
	fac = sqrt(-2.0 * log(r)/r);
	mythis->gset = v1 * fac;
	mythis->iset = 1;
	return v2*fac;
    } else {
	mythis->iset = 0;
	return gset;
    }
}
