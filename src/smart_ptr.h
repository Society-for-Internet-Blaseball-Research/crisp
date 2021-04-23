/* -*-c++-*- */

#ifndef ut_smart_ptr_h
#define ut_smart_ptr_h


template<class T>
class utSmartCPtr {		// const smart pointer
public:
  utSmartCPtr(const T* p = 0);
  utSmartCPtr(const utSmartCPtr<T>& sp);
  ~utSmartCPtr();
  utSmartCPtr<T>& operator=(const utSmartCPtr<T>& sp);
  utSmartCPtr<T>& operator=(const T* p);
  int operator==(const utSmartCPtr<T>& sp) const;
  int operator==(const T* p) const;
  int operator!=(const utSmartCPtr<T>& sp) const;
  int operator!=(const T* p) const;
  const T* operator->() const;
  const T& operator*() const;
  const T* raw_ptr() const;

protected:
  union {
    const T* cptr_;		// const pointer
    T* ptr_;			// mutable pointer
  };
};

template<class T>
class utSmartPtr : public utSmartCPtr<T> { // mutable smart pointer
public:
  utSmartPtr(T* p = 0);
  utSmartPtr(const utSmartPtr<T>& sp);
  ~utSmartPtr();
  utSmartPtr<T>& operator=(const utSmartPtr<T>& sp);
  utSmartPtr<T>& operator=(T* p);
  T* operator->() const;
  T& operator*() const;
  T* raw_ptr() const;
};

template<class T>
unsigned hash_func(const utSmartCPtr<T>& sp, unsigned sz);

template<class T>
unsigned hash_func(const utSmartPtr<T>& sp, unsigned sz);

#ifndef HIDE_INLINES
#include "smart_ptr.i"
#endif /* HIDE_INLINES */

#endif /* ut_smart_ptr_h */
