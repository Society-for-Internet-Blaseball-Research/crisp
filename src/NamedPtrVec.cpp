// NamedPtrVec.cc

#include <string.h>

// construct from a val vector

template <class T>
NamedPtrVec<T>::NamedPtrVec(T* data, const int n)
    : RWTPtrOrderedVector<T>(n)
{
    for (int i=0; i < n; ++i)
	insert(data + i);
}

// op=

template <class T>
NamedPtrVec<T>& NamedPtrVec<T>::operator=(const NamedPtrVec<T>& v)
{
    if (&v != this) 
	return (NamedPtrVec<T> &) RWTPtrOrderedVector<T>::operator=(v);
    else return *this;
}


// find fn, assuming presence of "get_name()" fn in template class

template <class T>
T* NamedPtrVec<T>::find(const char *nm) const
{
    NamedPtrVec<T>* mythis = (NamedPtrVec<T>*) this;
    for (size_t i = 0; i < entries(); ++i)
    {
	if (strcmp(nm, (*mythis)[i].get_name()) == 0)
	    return &(*mythis)[i];
    }
    return 0;
}


