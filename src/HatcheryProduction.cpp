// Hatchery Production implementations

#include "HatcheryProduction.h"

// the spawn fn is the only thing we need to implement

double HatcheryProduction::spawn(double escp) const
{
    double age1fish = 0;
    if (smolt_prod[year()] == 0) 	// no enhancement 
    {
	if (escp < s_opt)
	    age1fish = latent_prod * escp;
	else
	    age1fish = latent_prod * s_opt;
    }
    else				// enhancement on
    {
	double enh_spawn = fbrood();
	if (enh_spawn > 0)
	{
	    if (escp < s_opt)
		age1fish = latent_prod * escp;
	    else
	    {
		age1fish = latent_prod * s_opt;
		if (escp < s_opt + enh_spawn)
		    age1fish += enh_prod * (escp - s_opt);
		else
		    age1fish += enh_prod * enh_spawn;
	    }
	}
	else
	{
	    if (escp < s_opt + enh_spawn)
		age1fish = latent_prod * escp;
	    else
		age1fish = latent_prod * (s_opt + enh_spawn);
	}
    } 
    return age1fish;
}
