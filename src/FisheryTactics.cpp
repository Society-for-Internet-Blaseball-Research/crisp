// FisheryTactics implementations

#include <iostream.h>
#include "strtools.h"
#include "FisheryTactics.h"

// ctor initializes the pnv pointer to null.  this should always be
// tested for when accessing.  if specific pnv tactics exists for a given
// fishery, pnv storage is allocated when the data is read in.
// cnr pointer array is allocated.

FisheryTactics::FisheryTactics()
{
    for (Age age=pnvs.mindex(); age <= pnvs.maxdex(); ++age)
    {
	pnvs[age] = new double[nyears()];
	assert(pnvs[age]);
	strzero((char *) pnvs[age], sizeof(double) * nyears());
    }
    if (! (cnrs = new(CNR* [nyears()] )))
    {
	cerr << "Error: trouble allocating cnr pointer storage." << endl;
	assert(0);
    }
    strzero((char *)cnrs, nyears() * sizeof(CNR*));

    ceiling = 0;
}

// dtor; remove pnv and other storage; delete of NULL is allowed

FisheryTactics::~FisheryTactics()
{
    for (Age age=pnvs.mindex(); age <= pnvs.maxdex(); ++age)
	delete [] pnvs[age];
    for (int year = 0; year < nyears(); ++year)
	delete cnrs[year];
	    
    delete [] cnrs;
    delete ceiling;
}

