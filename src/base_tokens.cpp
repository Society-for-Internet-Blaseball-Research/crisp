#include "base_tokens.h"

class DiscardToken : public ReadToken {
  public:
    DiscardToken()		{}
    virtual ~DiscardToken()	{}
    virtual int read()		{ String t = get_string();
				  return (t.isNull()) ? -1 : 0; }
};

class DiscardLine : public ReadToken {
  public:
    DiscardLine()		{}
    virtual ~DiscardLine()	{}
    virtual int read()		{ String t = get_line();
				  return (t.isNull()) ? -1 : 0; }
};

class NullRead : public ReadToken {
  public:
    NullRead(int retnum = 0)	:return_number(retnum) {}
    virtual ~NullRead()		{}
    virtual int read()		{ return return_number; }
  private:
    const int return_number;
};

// Globals, initialized once and never deleted.
ReadToken *ReadDiscardToken = new DiscardToken;
ReadToken *ReadDiscardLine  = new DiscardLine;
ReadToken *ReadNothing      = new NullRead;
ReadToken *ReadEnd          = new NullRead(1);
