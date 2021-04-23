// StockConfig.cc - implementations

#include "StockConfig.h"
#include "log.h"
#include "strtools.h"
// ctor
StockConfig::StockConfig() : fixed_esc(0)
{
    inter_dam_losses = (double *) new double[nyears()];
    assert(inter_dam_losses);
    ev_scalars = (double *) new double[nyears()];
    assert(ev_scalars);
    for (int i=0; i < nyears(); ++i)
    {
	inter_dam_losses[i] = 1.0;
	ev_scalars[i] = 1.0;
    }

    for (Age age=FIRST_HV_AGE; age <= age.top(); ++age)
    {
	maturation_rates[age] = (double *) new double[nyears()];
	assert(maturation_rates[age]);
	adult_eqs[age] = (double *) new double[nyears()];
	assert(adult_eqs[age]);
	strzero((char *) maturation_rates[age], sizeof(double) * nyears());
	strzero((char *) adult_eqs[age], sizeof(double) * nyears());
    }
}

// dtor
StockConfig::~StockConfig()
{
    delete [] inter_dam_losses;
    delete [] ev_scalars;
    delete fixed_esc;
    for (Age age=FIRST_HV_AGE; age <= age.top(); ++age)
    {
	delete [] maturation_rates[age];
	delete [] adult_eqs[age];
    }
}	

// add the ev scalars from initial data

void StockConfig::add_ev_scalars(const double* evs)
{
    for (int i=0; i < nyears(); ++i)
	ev_scalars[i] = evs[i];
}

// add the fixed escapement

void StockConfig::add_fixed_escapement(const FixedEscStock &fes)
{
    if (fixed_esc)
	delete fixed_esc;
    fixed_esc = new FixedEscStock(fes);
    if (!fixed_esc)
	::LogMsg(L_Fatal, "out of mem for fixed escapements.\n");
}
