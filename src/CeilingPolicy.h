// CeilingPolicy.h

#ifndef CEILING_POLICY_H
#define CEILING_POLICY_H

// the CeilingPolicy class handles harvesting using simple ceiling
// management for a group of fisheries.  fisheries which harvest only
// during one logical phase have "simple" ceiling management.  those
// fisheries which harvest in more than one phase are considerably
// more difficult to handle, and are referred to as "multiceiling" or
// "multiphase" fisheries.  the MultiCeilingPolicy class handles the
// harvesting for those fisheries.


#include "Policy.h"

class CeilingPolicy : public Policy {
  public:
    CeilingPolicy(const FisheryList &flist) : Policy(flist) {}
    virtual ~CeilingPolicy() {}

    // the harvest logical phases, in chronological order
    virtual void take_preterm_harvests();
    virtual void take_terminal_harvests();
    virtual void take_river_harvests() 	    {} // unused
};


#endif
