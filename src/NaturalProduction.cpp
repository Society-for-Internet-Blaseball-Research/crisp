// Natural Production implementations

#include <math.h>
#include "Stock.h"
#include "NaturalProduction.h"

// fricker fn used in spawn() calculations
double NaturalProduction::fricker(double escp) const
{
    double maxesc = s_max / stock->inter_dam_loss();
    if (escp > maxesc)
	escp = s_max;
    return (escp * exp(rickera * (1.0 - escp / rickerb)));
}

// the spawning function, to do it all!  escapement must be passed in,
// new age1 fish are returned.

double NaturalProduction::spawn(double escp) const
{
    double enh_spawn = 0;
    double age1fish = 0;

    if (smolt_prod[year()] > 0)		// indicates enhancement is on
    {
	double max_brood = enh_prop * escp;
	enh_spawn = fbrood();
	if (enh_spawn > max_brood)
	    enh_spawn = max_brood;
	escp -= enh_spawn;
    }
    if (escp >= s_opt && !skip_msh)
	escp = s_opt;
    
    if (enh_spawn > 0 && enh_sup_flg)
	escp += enh_spawn * recrt_age1 * enh_prod / latent_prod;
    
    age1fish = fricker(escp) / recrt_age1;
    
    if (enh_spawn > 0 && !enh_sup_flg)
	age1fish += smolt_prod[year()] * smolt_age1;
    
    return age1fish;
}



