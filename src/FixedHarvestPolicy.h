// FixedHarvestPolicy.h  -  subclass of Policy

#ifndef FIXED_HARVEST_POLICY_H
#define FIXED_HARVEST_POLICY_H

// the FixedHarvestPolicy class implements the default type of policy
// management for the system.  it picks up the required functions
// from the Policy class.

#include "Policy.h"

class FixedHarvestPolicy : public Policy {
  public:
    FixedHarvestPolicy(const FisheryList &fl) : Policy(fl) {}
    virtual ~FixedHarvestPolicy() {}

    // the harvest logical phases, in chronological order
    virtual void take_preterm_harvests() { Policy::take_preterm_harvests(); }
    virtual void take_terminal_harvests() { Policy::take_terminal_harvests(); }
    virtual void take_river_harvests() 	    {} // or this one
};

#endif
