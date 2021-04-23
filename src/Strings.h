#ifndef C2_STRING_H
#define C2_STRING_H

#include <rw/cstring.h>

class String : public RWCString {
  public:
    String() {}
    String(const RWCString &s) :RWCString(s) {}
    String(const char *s) :RWCString(s) {}
    ~String() {}
    String &operator=(const String &s) { RWCString::operator=(s);
						  return *this; }
    String &operator=(const RWCString &s) { RWCString::operator=(s);
						  return *this; }

    String remove_first_token();
    RWBoolean isNumber() const;
    RWBoolean isFloat() const;
};

#endif
