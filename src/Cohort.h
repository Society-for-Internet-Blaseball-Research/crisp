// cohort global declarations

#ifndef COHORT_H
#define COHORT_H

#include "IEnum.h"

// class Age, providing type safety for actual age values using
// incremental enumerated type.  age values returned from objects of
// this class are equivalent to actual fish ages in years.

enum AgeEnum { AGE1=1, MIN_AGE=AGE1, AGE2, AGE3, AGE4, AGE5, MAX_AGE=AGE5 };
typedef IEnum<AgeEnum, int(MIN_AGE), int(MAX_AGE)> IEAge; 

#define FIRST_HV_AGE  AGE2		// first age harvested
#define ADULT_AGE  AGE3			// adult age

class Age : public IEAge {
public:
    Age() : IEAge() {}
    Age(AgeEnum age) : IEAge(age) {}

    // this routine is explicit instead of a ctor, so as to provide no
    // default conversion from int to Age.  this is used for initializaton
    // purposes.
    void assign_from_int(const int v) 
	{ val = v; check(); }

    // converts age enum to corresponding string
    char* string() { return age_strings[val-bottom()]; }

private:
    static char* age_strings[MAX_AGE - MIN_AGE + 1];
};

#endif
