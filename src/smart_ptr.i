/* -*-c++-*- */

#ifndef ut_smart_ptr_i
#define ut_smart_ptr_i

/**    utSmartCPtr<T>    **/

template<class T>
inline utSmartCPtr<T>::utSmartCPtr(const T* p)
: cptr_(p)
{
  if (cptr_) ptr_->ref();
}

template<class T>
inline utSmartCPtr<T>::utSmartCPtr(const utSmartCPtr<T>& sp)
: cptr_(sp.cptr_)
{
  if (cptr_) ptr_->ref();
}

template<class T>
inline utSmartCPtr<T>::~utSmartCPtr()
{
  if (ptr_ && ptr_->unref() == 0) {
    delete ptr_;
    ptr_ = 0;
  }
}

template<class T>
inline utSmartCPtr<T>&  utSmartCPtr<T>::operator=(const utSmartCPtr<T>& sp)
{
  if (sp.ptr_) sp.ptr_->ref();
  if (ptr_ && ptr_->unref() == 0)
    delete ptr_;
  cptr_ = sp.cptr_;
  return *this;
}

template<class T>
inline utSmartCPtr<T>&  utSmartCPtr<T>::operator=(const T* p)
{
  if (p) ((T*)p)->ref();
  if (ptr_ && ptr_->unref() == 0)
    delete ptr_;
  cptr_ = p;
  return *this;
}

template<class T>
inline int utSmartCPtr<T>::operator==(const utSmartCPtr<T>& sp) const
{
  return cptr_ == sp.cptr_;
}

template<class T>
inline int utSmartCPtr<T>::operator==(const T* p) const
{
 return cptr_ == p;
}

template<class T>
inline int utSmartCPtr<T>::operator!=(const utSmartCPtr<T>& sp) const
{
  return cptr_ != sp.cptr_;
}

template<class T>
inline int utSmartCPtr<T>::operator!=(const T* p) const
{
  return cptr_ != p;
}

template<class T>
inline  const T* utSmartCPtr<T>::operator->() const
{
  return cptr_;
}

template<class T>
inline const T& utSmartCPtr<T>::operator*() const
{
  return *cptr_;
}


template<class T>
inline const T* utSmartCPtr<T>::raw_ptr() const
{
  return cptr_ ;
}

/**    utSmartPtr<T>    **/

template<class T>
inline utSmartPtr<T>::utSmartPtr(T* p)
: utSmartCPtr<T>(p)
{}

template<class T>
inline utSmartPtr<T>::utSmartPtr(const utSmartPtr<T>& sp)
: utSmartCPtr<T>(sp.ptr_)
{}

template<class T>
inline utSmartPtr<T>::~utSmartPtr()
{}

template<class T>
inline utSmartPtr<T>& utSmartPtr<T>::operator=(const utSmartPtr<T>& sp)
{
  (void) utSmartCPtr<T>::operator=(sp);
  return *this;
}

template<class T>
inline utSmartPtr<T>& utSmartPtr<T>::operator=(T* p)
{
  (void) utSmartCPtr<T>::operator=(p);
  return *this;
}

template<class T>
inline  T* utSmartPtr<T>::operator->() const
{
  return ptr_;
}

template<class T>
inline T& utSmartPtr<T>::operator*() const
{
  return *ptr_;
}

template<class T>
inline T* utSmartPtr<T>::raw_ptr() const
{
  return ptr_ ;
}

template<class T>
inline unsigned hash_func(const utSmartCPtr<T>& sp, unsigned sz)
{
  return ((unsigned) sp.raw_ptr())%sz;
}

template<class T>
inline unsigned hash_func(const utSmartPtr<T>& sp, unsigned sz)
{
  return ((unsigned) sp.raw_ptr())%sz;
}

#endif /* ut_smart_ptr_i */
