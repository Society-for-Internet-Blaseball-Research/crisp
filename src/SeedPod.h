// SeedPod.h

#ifndef SEEDPOD_H
#define SEEDPOD_H

//#include <sys/time.h>
#include <time.h>
// SeedPod for use with multiple random number streams.  this class
// is used primarily by RandGen (see further comments there).  a SeedPod
// will be seeded with the ctor passed parameter, or from the clock if
// 0.  this class works by maintaing the array of unsigned shorts as
// required by the erand48() routines for multiple random number streams.
// conversion "operator unsigned short *" makes for easy use (just pass
// the SeedPod directly to erand48() ).

class SeedPod {
  public:
    SeedPod(long seed=0)
    { if (seed) init_fn(seed); else init_fn((long) time(0)); }

    operator unsigned short * () { return(pod); }
    SeedPod& operator= (long seed) { init_fn(seed); return *this; }
    double& val() { return def_seed;}
  private:
    enum SeedConsts { PODSIZE = 3, LOWBITS = 0x330e };
    void init_fn(long seed)
    {
	def_seed = seed;
	pod[0] = (unsigned short) (seed & 0xffff0000 >> 16);
	pod[1] = (unsigned short) (seed & 0x0000ffff);
	pod[2] = LOWBITS;
    }
    double def_seed;
    unsigned short pod[PODSIZE];
};

#endif
