// incremental enumerative type template

#ifndef IENUM_H
#define IENUM_H

#include <assert.h>

// T should be an enumerated type; min and max are the bounds
// IEnum will allow increment/decrement of T objects, without bounds checking

template <class T, const int min, const int max> 
class IEnum {
public:
    IEnum() : val(min) {}
    IEnum(T v): val(v)
	{
#ifdef DEBUG
	    check();
#endif
	}
    IEnum(const int v): val(v) { check(); }

    const IEnum& operator++()    { val++; return *this; }
    IEnum operator++(int) { IEnum<T,min,max> tmp=*this; val++; return tmp; }
    const IEnum& operator--()    { val--; return *this; }
    IEnum operator--(int) { IEnum<T,min,max> tmp=*this; val--; return tmp; }
    operator int() const { return val; }

    int bottom() const { return min; }
    int top() const { return max; }
    
protected:
    int val;
    void check() const { assert(val >= min && val <= max); }
};

#endif
