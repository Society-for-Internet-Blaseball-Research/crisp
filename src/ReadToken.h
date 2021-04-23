#ifndef C2_READTOKENS_H
#define C2_READTOKENS_H

#include "Token.h"

class IntReadBase : virtual public ReadToken {
  protected:
    IntReadBase()		{}
    virtual ~IntReadBase()	{}
    virtual int read() = 0;

    static int read_int(int &);
};

class IntReadToken : public IntReadBase {
  public:
    IntReadToken(int &var)	:address(var)	{}
    virtual ~IntReadToken()	{}
    virtual int read();
  private:
    int &address;
};

class LongReadBase : public virtual ReadToken {
  protected:
    LongReadBase()		{}
    virtual ~LongReadBase()	{}
    virtual int read() = 0;

    static int read_long(long &);
};

class LongReadToken : public LongReadBase {
  public:
    LongReadToken(long &var)	:address(var) {}
    virtual ~LongReadToken()	{}
    virtual int read();

  private:
    long &address;
};

class FloatReadBase : virtual public ReadToken {
  protected:
    FloatReadBase()		{}
    virtual ~FloatReadBase()	{}
    virtual int read() = 0;

    static int read_float(double &);
};

class FloatReadToken : public FloatReadBase {
  public:
    FloatReadToken(double &var)	:address(var)	{}
    virtual ~FloatReadToken()	{}
    virtual int read();
  protected:
    double &address;
};

class StringValueReadBase : virtual public ReadToken {
  protected:
    StringValueReadBase()		{}
    virtual ~StringValueReadBase()	{}
    static int read_string(String &);
};

class StringValueReadToken : public StringValueReadBase {
  public:
    StringValueReadToken(String &s) :address(&s) {}
    virtual ~StringValueReadToken()		{}
    virtual int read();
  protected:
    StringValueReadToken() :address(0)	{}
  private:
    String *address;
};

#endif
