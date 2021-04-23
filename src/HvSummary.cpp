// HvSummary.cc - implementations
#include "strtools.h"
#include "Harvest.h"
#include "HvSummary.h"

HvSummary::HvSummary(Harvest *hv) : harvest(hv)
{
    for (HarvestPhase phase; phase <= phase.top(); ++phase)
	for (Age age=FIRST_HV_AGE; age <= age.top(); ++age)
	{
	    catches[phase][age] = new double[nyears()];
	    assert(catches[phase][age]);
	    strzero((char *) catches[phase][age], sizeof(double) * nyears());
	    
	    shakers[phase][age] = new double[nyears()];
	    assert(shakers[phase][age]);
	    
	    strzero((char *) shakers[phase][age], sizeof(double) * nyears());
	    cnr_sublegals[phase][age] = new double[nyears()];
	    assert(cnr_sublegals[phase][age]);
	    strzero((char *) cnr_sublegals[phase][age],sizeof(double) * nyears());
	    cnr_legals[phase][age] = new double[nyears()];
	    assert(cnr_legals[phase][age]);
	    strzero((char *) cnr_legals[phase][age], sizeof(double) * nyears());
	}
}

HvSummary::~HvSummary()
{
    for (HarvestPhase phase; phase <= phase.top(); ++phase)
	for (Age age=FIRST_HV_AGE; age <= age.top(); ++age)
	{
	    delete [] catches[phase][age];
	    delete [] shakers[phase][age];
	    delete [] cnr_sublegals[phase][age];
	    delete [] cnr_legals[phase][age];
	}
}

// stash the data for the current year from the harvest

void HvSummary::end_year()
{
    for (HarvestPhase phase; phase <= phase.top(); ++phase)
	for (Age age=FIRST_HV_AGE; age <= age.top(); ++age)
	{
	    catches[phase][age][year()] = harvest->mdl_catch[phase][age];
	    shakers[phase][age][year()] = harvest->shakers[phase][age];
	    cnr_sublegals[phase][age][year()] =
		harvest->cnr_sublegal_catch[phase][age];
	    cnr_legals[phase][age][year()] =
		harvest->cnr_legal_catch[phase][age];
	}
}


