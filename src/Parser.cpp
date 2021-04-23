/* Parser.cc
 *
 *	The base parser class.
 */
#include "Parser.h"
#include "State.h"
#include <rw/ctoken.h>

Parser *MainParser = new Parser;

int Parser::read()
{
    int value;
    State *s;

    if (!(s = get_state())) return -1;
    if ((value = s->read()) > 0)
	(void) pop();
    return (value < 0) ? value : 0;
}

void Parser::open(const char *file)
{
    if (data_fp) {
	fclose(data_fp);
	data_fp = 0;
    }
    delete data_stream;
    data_stream = new ifstream(file);
}

void Parser::open(ifstream *input_stream)
{
    if (data_fp) {
	fclose(data_fp);
	data_fp = 0;
    }
    delete data_stream;
    data_stream = input_stream;
}

void Parser::open(FILE *input_fp)
{
    if (data_fp) {
	fclose(data_fp);
    }
    delete data_stream;
    data_stream = 0;
    data_fp = input_fp;
}

int Parser::parse()
{
    while(get_state()) {
	if (read() < 0)
	    return -1;
    }
    return 0;
}

String Parser::get_string()
{
    String read_string;
	
    if (!last_string.isNull()) {
	read_string = last_string;
	last_string=String("");
    } else {
	while (data_line.isNull()) {
	    (void) get_line();
	    if (data_stream->eof())
		return String("");
	}
	RWCTokenizer tk(data_line);
	read_string = tk();
	if (read_string.isNull())
	    return String("");
	data_line.remove(data_line.index(read_string), read_string.length());
	data_line.strip(RWCString::leading, '\t');
	data_line.strip(RWCString::leading, ' ');
    }
    return read_string;
}

String Parser::get_line()
{
    if (data_line.isNull()) {
	if (data_stream)
	    data_line.readLine(*data_stream);
	else if (data_fp) {
	    char data[1024];
	    fgets(data, sizeof(data), data_fp);
	    data_line = String(data);
	} else
	    data_line = String("");
	data_line.strip(RWCString::both, '\t');
	data_line.strip(RWCString::both, ' ');
    }
    return last_string + data_line;
}
