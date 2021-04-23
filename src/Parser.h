#ifndef C2_PARSER_H
#define C2_PARSER_H

#include <fstream.h>
#include <rw/tvdlist.h>
#include <rw/tstack.h>
#include <rw/ctoken.h>

#include "Strings.h"

extern "C" {
    #include <stdio.h>
};

#include "State.h"
class Parser;

extern Parser *MainParser;

typedef RWTValDlist<State *> StateDlist;

class Parser {
  public:
    Parser() :data_stream(0), data_fp(0)	{}
    ~Parser()		{ delete data_stream; }
    void open(const char *);
    void open(ifstream *);
    void open(FILE *);
    const State *get_state() const {return state_stack.top();}
    int read();
    int parse();
    void push(State *s) { state_stack.push(s); }
  private:
    void return_string(const String &s) { last_string = s; }
    String get_string();
    String get_line();
    State *pop() { return state_stack.pop(); }
    State *get_state() { return state_stack.top(); }

    FILE *data_fp;
    ifstream *data_stream;
    String last_string;
    String data_line;
    RWTStack<State *, StateDlist> state_stack;

friend class State;
friend class Token;
};

#endif
