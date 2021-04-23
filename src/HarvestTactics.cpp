// HarvestTactics.cc - implementations

#include "HarvestTactics.h"

// ctor
HarvestTactics::HarvestTactics()
{
    fps = (double *) new double[nyears()];
    assert(fps);
    for (int i=0; i < nyears(); ++i)
	fps[i] = 1.0;
}
