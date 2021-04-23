// Policy.h - Fisheries Policy Management Class

#ifndef POLICY_H
#define POLICY_H

/* the Policy class is an abstract base class for various fisheries policy
 * management classes.  there is a derived class for each type of actual
 * policy (such as ceilings, fixed harvest rates, and fixed escapements).
 * typically, one object of each of these classes will be created.
 * a Policy subclass object handles all of the harvesting for all fisheries
 * which are configured to operate under that policy.
 *
 * the fundamental interface for this class is the provision of a harvesting
 * function for each logical phase of simulation.  The logical phases
 * represent the chronological ordering of the harvests (as grouped by
 * the fisheries in each Policy) in coarse steps.  each Policy must provide
 * an interface for every logical phase, although some  might
 * implement null functions for one or more phases.
 *
 * as a matter of implementation, each Policy object maintains a list of
 * fisheries which operate under that management policy.  also, the current
 * implementation is to provide explicitly named functions for each
 * phase of harvesting, although this could be changed in the future to
 * a function table indexed by the phase.
 *
 * some derived class policies carry the prerequisite that their
 * operations in a phase be carried out before other policies
 * operating in the same phase.  these order dependencies are enforced
 * outside of this class.  however, related to this task is the
 * identification of policies as "phase_specific" (or not).  A phase
 * specific policy is one in which harvest computations occuring
 * during a given phase will not result in the recomputation of
 * harvests from an earlier chronological phase.  all policies are
 * phase specific by default.
 *
 * the operative preconditions of this design are:
 *	- each fishery must operate under exactly one policy
 *	- within each logical phase, the harvesting for the group of
 *	  fisheries under a single policy must be independent from
 *        all other policies and fisheries.  */

#include "FisheryList.h"

class Policy {
  public:
    virtual ~Policy() {}

    // the harvest logical phases, in chronological order
    virtual void take_preterm_harvests() = 0;
    virtual void take_terminal_harvests() = 0;
    virtual void take_river_harvests() = 0;

    Bool phase_specific() { return phase_specific_; }

    int num_fisheries() const { return fishlist.num(); }

    // unused, but necessary for rogue compilation
    int operator==(const Policy &rhs)
	{ return (&rhs==this); }

  protected:
    Policy(Bool phase_spec = TRUE) : phase_specific_(phase_spec) {}
    Policy(const FisheryList &flist, Bool phase_spec = TRUE)
	: fishlist(flist), phase_specific_(phase_spec) {}

    FisheryList fishlist;
    Bool phase_specific_;
};

#endif
