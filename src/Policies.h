#ifndef POLICIES_H
#define POLICIES_H

// possible Policy types
class Policies {
  public:
    enum PolicyType
    { DEFAULT_POLICY=0,
      FIXED_HARVEST=0,
      CEILING,
      MULTI_CEILING,
      FIXED_ESCAPEMENT, 
      FIXED_COMBINED_HARVEST,
      NUM_POLICIES };
};

#endif
