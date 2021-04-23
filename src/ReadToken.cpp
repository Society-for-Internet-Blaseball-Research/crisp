/* ReadToken.cc
 *
 *
 */

#include "ReadToken.h"

extern "C" {
#include <ctype.h>
    int atoi(const char *);
    long atol(const char *);
    double atof(const char *);
}

int IntReadToken::read()
{
    return read_int(address);
}

int IntReadBase::read_int(int &out_var)
{
    String str;

    str = get_string();
    for (size_t i = 0 ; i < str.length() ; ++i) {
	if (!isdigit(str.data()[i])) {
	    return_string(str);
	    return -1;
	}
    }
    out_var = ::atoi(str);
    return 0;
}

int LongReadBase::read_long(long &out_var)
{
    String str;
	
    str = get_string();
    for (size_t i = 0 ; i < str.length() ; ++i) {
	if (!isdigit(str.data()[i])) {
	    return_string(str);
	    return -1;
	}
    }
    out_var = ::atol(str);
    return 0;
}

int LongReadToken::read()
{
    return read_long(address);
}

int FloatReadToken::read()
{
    return read_float(address);
}

int FloatReadBase::read_float(double &out_var)
{
    String str;

    str = get_string();
    for (int i = 0 ; str.length() ; ++i) {
	if (!(isdigit(str.data()[i]) || str.data()[i] == '.' || str.data()[i] == 'e'
	      || str.data()[i] == 'E' || str.data()[i] == '+' || str.data()[i] == '-')) {
	    return_string(str);
	    return -1;
	}
    }
    out_var = ::atof(str);
    return 0;
}

int StringValueReadBase::read_string(String &s)
{
    s = get_string();
    return 0;
}

int StringValueReadToken::read()
{
    return read_string(*address);
}
