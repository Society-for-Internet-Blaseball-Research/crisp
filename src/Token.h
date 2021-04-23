/* Token.h
 *
 * Token base classes.  The primary Token function is read(), which handles
 * all of the details for reading each particular class of Token.  The read()
 * function returns 0 on successful completion, -1 on error, and 1 if its
 * read did not complete upon returning.
 */
#ifndef C2_TOKEN_H
#define C2_TOKEN_H

#include "Strings.h"
#include <rw/tpslist.h>

class Parser;

class Token {
  public:
    Token()			{}
    virtual int read() = 0;
    virtual ~Token()		{}

    //	Allow Tokens to be in RWTSlists
    int operator==(const Token &rhs) const { return this == &rhs; }
    int operator<(const Token &rhs)  const { return this < &rhs; }

  protected:
    static String get_string();
    static String get_line();
    static void return_string(String &);

  private:
    static Parser *main_parser;
};

// Illustrative class only.
class ReadToken : public Token {
  public:
    ReadToken()			{}
    virtual ~ReadToken()	{}
    virtual int read() = 0;	// The main routine, which turns the string
    // returned by get() into the appropriate variable type, stuffing
    // into the memory we have provided...
};

class KeywordContainer {
  public:
    KeywordContainer(String s, ReadToken *rt = 0)
	:read_token(rt), keyword(s)		{}
    int read()					{ return read_token->read(); }
    const String &operatorString() const	{ return keyword; }
    int operator==(const KeywordContainer &c) const
	{ return keyword == c.keyword; }
    int operator==(const String &s) const	{ return keyword == s; }
    int isNull() const				{ return keyword.isNull(); }
  private:
    ReadToken *read_token;
    const String &keyword;
};

class KeywordMapping : public Token {
  public:
    KeywordMapping()			{}
    KeywordMapping(KeywordContainer *);
    virtual ~KeywordMapping()		{}

    int read();
    void append(KeywordContainer *a)	{ token_list.append(a); }
  private:
    RWTPtrSlist<KeywordContainer> token_list;
//    RWTPtrSlistIterator<KeywordContainer> list_iter;
};

#endif
