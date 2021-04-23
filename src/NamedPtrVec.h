// NamedPtrVec - template pointer based vector for named items, with find fn

#ifndef NAMEDPTRVEC_H
#define NAMEDPTRVEC_H

#include <rw/tpordvec.h>
#include "Bool.h"

/*
 * The NamedPtrVec class derives from Rogue's RWTPtrOrderedVector to
 * provide a pointer based ordered vector.  Thus, it can size itself
 * dynamically based upon insert requests.  
 *
 * Although a pointer vec by implementation, access is performed using
 * a standard array idiom.  This may change in the future.
 *
 * Each item inserted in the vector is expected to be a pointer to
 * a class containing a "name" field.  A "find" fn is provided to
 * search based on the name field and return the desired element.
 *
 * Note that one of the ctors sets up the vector from an existing
 * array.  This is done by stashing the pointers, so the data had
 * better stay in scope for the lifetime of this object.
 */

template <class T>
class NamedPtrVec : public RWTPtrOrderedVector<T> {
  public:
    NamedPtrVec() : RWTPtrOrderedVector<T>() {}
    NamedPtrVec(const int n) : RWTPtrOrderedVector<T>(n) {}
    NamedPtrVec(const NamedPtrVec<T>& v) : RWTPtrOrderedVector<T>(v) {}
    NamedPtrVec(T* data, const int n);
    ~NamedPtrVec() {}
    
    NamedPtrVec<T> & operator=(const NamedPtrVec<T>& v);

    // these operators make the vector appear to be a val vec, for
    // backwards compatibility with existing code.  possibly to be
    // removed later.
    T& operator[](int i) { return *RWTPtrOrderedVector<T>::operator[](i); }
    const T& operator[](int i) const
	{ return *RWTPtrOrderedVector<T>::operator[](i); }

    // this is also for backwards compatibility and may be removed
    int num() const { return entries(); }
    
    T* find(const char *nm) const;
};

#include <rw/compiler.h>
#ifdef RW_COMPILE_INSTANTIATE
#include "NamedPtrVec.cpp"
#endif /* compile time instantiation */

#endif
