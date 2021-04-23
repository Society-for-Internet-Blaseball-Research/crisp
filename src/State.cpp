#include "State.h"
#include "Parser.h"

extern Parser *base_parser;

Parser *State::base_parser = ::base_parser;

State::State(Token **token_list)
:list_iter(read_list)
{
    while (*token_list)
	read_list.append(*token_list);
    cur_token = list_iter();
}

// Create an empty stack.
State::State()
:cur_token(0), read_list(), list_iter(read_list)
{
}

State::State(const State &cp)
:cur_token(0), read_list(cp.read_list), list_iter(read_list)
{
    while (list_iter()) {
	if (list_iter.key() == cp.list_iter.key())
	    break;
    }
    cur_token = list_iter.key();
}

State::~State()
{
}

int State::read()
{
    int return_check;

    if (!current_token())
	return 0;

#ifdef DEBUG
    return_check = current_token()->read();
    cerr << "return value = " << return_check << '\n';
    if (return_check == 0) next_token();
#else
    if ((return_check = current_token()->read()) == 0)
	next_token();
#endif
    if (return_check < 0) return -1;

    return 1;
}

const State &State::operator=(const State &rhs)
{
    if (this != &rhs) {
	read_list.clear();
	read_list = rhs.read_list;
	first_token();
    }
    return *this;
}
