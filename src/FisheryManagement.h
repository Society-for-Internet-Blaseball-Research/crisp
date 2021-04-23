// FisheryManagement.h
//	This class handles all of the harvesting for all fisheries.
// This class works very closely with the Policy class and its subclasses
// in order to do its work.  The list of all possible management Policies
// is maintained here (as an enum).

// The system configuration (I/O) modules are responsible for queuing
// requests for existing PSC policies which are to be added (although
// the default policy is handled here in the ctor), and for calling
// the overloaded >> operator to read in any additional custom policy
// data, if supplied by the user.  policies for which requests have
// been queued are initialized (usually created and added) in a late phase.

// For proper policy initialization, appropriate fisheries must have
// the policy type field set prior to adding that policy.

// A list of all active Policies is maintained, and each is called
// upon to handle each logical phase of harvesting.

// This class handles the deletion of all policies upon exit.

#ifndef FISHERYMANAGEMENT_H
#define FISHERYMANAGEMENT_H

#include <rw/tpslist.h>
#include <rw/tbitvec.h>
#include "Bool.h"
#include "Policies.h"
#include "Policy.h"

// There is only supposed to be one FisheryManagement object in the system.

class FisheryManagement {
  public:
    FisheryManagement() : requests(FALSE)
	{ queue_policy_init(Policies::DEFAULT_POLICY); }
    ~FisheryManagement() { policies.clearAndDestroy(); }

    // primary functionality of this class
    void take_preterm_harvests();
    void take_terminal_harvests();
    void take_river_harvests();

    // other fns

    // queue requests to add policies
    void queue_policy_init(Policies::PolicyType);

    // set up policies with queued requests
    void init_policies();

    // I/O fn to read in policy data from file and construct Policy objects,
    // which are added to the list.
    friend int operator>>(FILE*, FisheryManagement&);
    
  private:
    RWTPtrSlist<Policy> policies; // active policies
    RWTBitVec<(const int) Policies::NUM_POLICIES> requests; 

    //fns
    void add_policy(Policy *);	// add a policy
    void add_new_policy(Policies::PolicyType ptype); // create and add policy
    
    // privatized for non-use
    FisheryManagement(const FisheryManagement&);
    operator=(const FisheryManagement&);
};


#endif
