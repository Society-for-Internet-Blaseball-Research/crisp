// MultiCeilingPolicy.h

#ifndef MULTICEILING_POLICY_H
#define MULTICEILING_POLICY_H

// the MultiCeilingPolicy class handles harvesting using "multi"
// ceiling management for a group of fisheries.  "multiceiling" or
// "multiphase" refers to the fact that each fishery under this policy
// harvests in both the preterminal and terminal phases.  this class
// handles the special needs of ceiling management for these
// fisheries.
//
// multi-ceilinged policies are specified as not "phase_specific" by
// passing the appropriate flag to the Policy ctor (see Policy.h).
// this means that terminal phase computations could cause a
// subsequent recomputation of the preterminal phase.  conflicts with
// other policies are avoided by depending on the ordering of
// processing of the configured policies.  the requirement is that
// objects of this Policy class must be processed before all others in
// the terminal phase.  this requirement is not enforced by the Policy
// class hierarchy, but the phase_specific property (Policy base
// class) is provided for use by external classes in creating and
// enforcing the necessary ordering of policies.

#include "Policy.h"

class MultiCeilingPolicy : public Policy {
  public:
    MultiCeilingPolicy(const FisheryList &flist) : Policy(flist, FALSE) {}
    virtual ~MultiCeilingPolicy() {}

    // the harvest logical phases, in chronological order
    virtual void take_preterm_harvests();
    virtual void take_terminal_harvests();
    virtual void take_river_harvests() 	    {} // no harvests this phase
};


#endif
