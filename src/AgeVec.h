#ifndef AGEVEC_H
#define AGEVEC_H

/* TAgeVec: template to create vectors indexed by a range of fish ages.
 * The idea is to allow vectors which begin at a non-zero index, but
 * not create unused storage.  Since this class provides an optimization for
 * both speed and size, array index bounds checking is left entirely up to
 * the user.  To make this a bit safer, only indices of class Age are allowed.
 * Template parameters are the class and the minimum and maximum age indices.
 */

#ifdef DEBUG
#include <assert.h>
#endif

#include <rw/tvvector.h>
#include "Cohort.h"

// template params are class, minimum index value, and max index value

template <class T, const enum AgeEnum min, const enum AgeEnum max>
class TAgeVec
    : private RWTValVector<T>
{
  public:
    // the ctors offset the data ptr by the min index
    TAgeVec() : RWTValVector<T>(max-min+1), ptr_(array_ - min)
        {}
    TAgeVec(const T& ival) : RWTValVector<T>(max-min+1, ival),
	ptr_(array_ - min)
	{}
    TAgeVec(const TAgeVec<T, min, max> &v)
	: RWTValVector<T>(v), ptr_(array_ - min)
	{}

    TAgeVec<T, min, max> & operator=(const TAgeVec<T, min, max> &v)
	{ RWTValVector<T>::operator=(v); ptr_ = array_ - min; return *this; }
    TAgeVec<T, min, max> & operator=(const T& ival)
	{ RWTValVector<T>::operator=(ival); return *this; }

    T& operator[](Age i)
	{
#ifdef DEBUG
	    check(i);
#endif	    
	    return ptr_[i];
	}

    T  operator[](Age i) const
	{
#ifdef DEBUG
	    check(i);
#endif	    
	    return ptr_[i];
	}

    Age mindex() const { return min; }
    Age maxdex() const { return max; }
        
  protected:
    T* ptr_;

#ifdef DEBUG
    void check(int i) const { assert(i >= min && i <= max); }
#endif    
};


// some classes of useful vectors

template <class T>
class HvAgeVec : public TAgeVec<T, FIRST_HV_AGE, AGE5> {
  public:
    HvAgeVec() : TAgeVec<T, FIRST_HV_AGE, AGE5>()
        {}
    HvAgeVec(const T& ival) : TAgeVec<T, FIRST_HV_AGE, AGE5>(ival)
	{}
    HvAgeVec(const HvAgeVec<T> &v) : TAgeVec<T, FIRST_HV_AGE, AGE5>(v)
	{}

    HvAgeVec<T> & operator=(const T& ival)
	{ TAgeVec<T, FIRST_HV_AGE, AGE5>::operator=(ival); return *this; }
    HvAgeVec<T> & operator=(const HvAgeVec<T> &v)
	{ TAgeVec<T, FIRST_HV_AGE, AGE5>::operator=(v); return *this; }
};    


template <class T>
class AgeVec : public TAgeVec<T, AGE1, AGE5> {
  public:
    AgeVec() : TAgeVec<T, AGE1, AGE5>()
        {}
    AgeVec(const T& ival) : TAgeVec<T, AGE1, AGE5>(ival)
	{}
    AgeVec(const AgeVec<T> &v) : TAgeVec<T, AGE1, AGE5>(v)
	{}

    AgeVec<T> & operator=(const T& ival)
	{ TAgeVec<T, AGE1, AGE5>::operator=(ival); return *this; }
    AgeVec<T> & operator=(const AgeVec<T> &v)
	{ TAgeVec<T, AGE1, AGE5>::operator=(v); return *this; }
};    


#endif
