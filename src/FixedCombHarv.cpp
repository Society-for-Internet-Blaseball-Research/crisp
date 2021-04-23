#include "FixedCombHarv.h"

// the fixed combined harvest policy is very similar to the
// FixedEscapementCombined class, which it inherits from.  the only
// difference in fact, is that the escapement goal is computed based
// on the desired harvest rate, instead of specified as data.

double FixedCombHarv::
escapement_goal () const
{
    double fish = 0;
    for (int i=0; i < slist.num(); ++i) 
	fish += adult_fish_avail(i);
    return (fish * slist[0].management_idl() * (1.0 - hr_goals[year()]));
}
