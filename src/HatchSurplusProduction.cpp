// Hatchery Surplus Production implementations

#include "NonNeg.h"
#include "HatchSurplusProduction.h"

const double HatchSurplusProduction::MAX_NATURAL_SPAWN = 5000;

// spawn is where it's at.  this little fn uses HatcheryProduction::spawn()
// to do most of the work, then uses some NaturalProduction code (fricker)
// to do any surplus which may be required.  just like a nice multiply
// inherited class should.

double HatchSurplusProduction::spawn(double escp) const
{
    double age1fish = HatcheryProduction::spawn(escp);
    
    if (smolt_prod[year()] == 0) 	// enhancement off
    {
	if (escp >= s_opt)
	{
	    double nat_spawn = escp - s_opt;
	    if (nat_spawn > MAX_NATURAL_SPAWN)
		nat_spawn = MAX_NATURAL_SPAWN;
	    age1fish += get_other_prod(natural_prod, nat_spawn);
	}
    }
    else
    {
	// ok, so we call fbrood again, even though it was already called
	// in the HatcheryProduction spawn.  too bad.
	
	double enh_spawn = fbrood();	
	if (enh_spawn > 0 && escp >= s_opt + enh_spawn)
	{
	    double nat_spawn = NonNeg(escp - s_opt - enh_spawn);
	    if (nat_spawn > 0)
	    {
		if (nat_spawn > MAX_NATURAL_SPAWN)
		    nat_spawn = MAX_NATURAL_SPAWN;
	    
		age1fish += get_other_prod(natural_prod, nat_spawn);
	    }			
	}
    }

    return age1fish;
}
