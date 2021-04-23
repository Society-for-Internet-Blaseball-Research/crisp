/* State.h
 *
 *	Test version of the State class.
 */
#ifndef C2_STATE_H
#define C2_STATE_H

#include "Token.h"
#include <rw/tpslist.h>

class State {
  public:
    State();
    State(const State &);
    State(Token **);
    virtual ~State();
    virtual int read();
    virtual const State &operator=(const State &);
    virtual int operator==(const State &rhs) const { return this == &rhs; }
    virtual int operator<(const State &rhs)  const { return this < &rhs; }
    virtual void append(Token *t) { read_list.append(t); first_token(); }
  protected:
    virtual void first_token() { list_iter.reset(); next_token(); }
    virtual void next_token() { cur_token = list_iter(); }
    virtual Token *current_token() const { return cur_token; }
    Token *cur_token;
    RWTPtrSlist<Token> read_list;
    RWTPtrSlistIterator<Token> list_iter;
    static Parser *base_parser;
};

#endif
