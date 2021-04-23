/* Token.cc
 */

#include "Token.h"
#include "Parser.h"

Parser *base_parser = new Parser;

Parser *Token::main_parser = base_parser;

String Token::get_string()
{
    return main_parser->get_string();
}

String Token::get_line()
{
    return main_parser->get_line();
}

void Token::return_string(String &val)
{
    main_parser->return_string(val);
}

KeywordMapping::KeywordMapping(KeywordContainer *array)
{
    while (!array->isNull())
	token_list.append(array++);
}

int KeywordMapping::read()
{
    String s;
    KeywordContainer *ptr;

    s = get_string();
    KeywordContainer a(s);
    ptr = token_list.find(&a);
    if (!ptr) {
	return_string(s);
	return -1;
    }
    return ptr->read();
}
