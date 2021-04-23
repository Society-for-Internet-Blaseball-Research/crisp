// Production.cc - implementations for the Production class

#include <math.h>
#include <assert.h>
#include "strtools.h"
#include "Production.h"

Production::Production(const Stock * const stk, const double ricker_a,
		       const double sopt)
: stock(stk), rickera(ricker_a), s_opt(sopt), recrt_age1(0),
  enh_parm(0), smolt_age1(0), enh_prop(0)
{
    smolt_prod = new double[nyears()];
    assert(smolt_prod);
    strzero((char *) smolt_prod, sizeof(double) * nyears());
    latent_prod = exp(rickera);
}

Production::~Production()
{
    delete [] smolt_prod;
}

// add enhancement to a production object.  derived classes need to
// call this in addition to (and probably before) any other actions they
// may take.

void Production::add_enhancement(double *s_prod, double e_parm,
				 double s_age1, double e_prop)
{
    enh_parm = e_parm;
    smolt_age1 = s_age1;
    enh_prop = e_prop;
    
    for (int i=0; i < nyears(); ++i)
	smolt_prod[i] = s_prod[i];

    enh_prod = exp(enh_parm);
}
