/* String.cc
 */

#include "Strings.h"
#include "Bool.h"
#include <rw/ctoken.h>

extern "C" {
    #include <ctype.h>
}

RWBoolean String::isNumber() const
{
    if (isNull()) return False;
    int i = length();
    while (i--)
	if (!isdigit(operator[](i))) return FALSE;
    return TRUE;
}

RWBoolean String::isFloat() const
{
    if (isNull()) return FALSE;
    for (int i = 0 ; length() ; ++i) {
	char c = operator[](i);
	if (!(isdigit(c) || c == '.' || c == 'e' || c == 'E' || c == '+'
	      || c == '-'))
	    return FALSE;
    }
    return TRUE;
}

String String::remove_first_token()
{
    String first_token;
    RWTokenizer tk(*this);

    first_token = tk();
    remove(index(first_token), first_token.length());
    if (!isNull()) {
	strip(RWCString::leading, '\t');
	strip(RWCString::leading, ' ');
    }
    return first_token;
}
