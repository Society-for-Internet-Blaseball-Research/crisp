// inline def to keep an expression non-negative

#ifdef NOTDEF
#include <iostream.h>
#endif

inline double NonNeg(double exp)
{
    if (exp < 0)
    {
#ifdef NOTDEF
	cout << "zeroing something; was " << exp << endl;
#endif	
	return 0;
    }
    else return exp;
}
    
