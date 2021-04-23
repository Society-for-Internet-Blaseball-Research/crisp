#include <math.h>
#include <stdio.h>
#include <string.h>

#include "parseutil.h"

#include <stdarg.h>

static void swapint (int &i1, int &i2)
{
    int temp;

    temp = i1;
    i1 = i2;
    i2 = temp;
}

char * lowercase(char * s, char * scratch)
{
    *scratch = (*s >= 'A' && *s <= 'Z') ? *s + ('a' - 'A') : *s;
    if (*s != '\0')
	(void) lowercase (s+1, scratch+1);

    return (scratch);
}

char * unders_to_spaces (char * string)
{
    *string = (*string == '_') ? ' ' : *string ;
    if (*string != '\0')
	(void) unders_to_spaces (string+1);
    return (string);
}

unsigned char is_float (char *string)
{
    /* this first silly if statement is for a leading + or - */
    if ((*string == '-') ||
	(*string == '+') )
    {
	string++;
	if (*string == '\0')
	    return (0);
    }

    /* this doesn't check to see if there is more than one "." in the number ^..^*/
    while (*string != '\0')
    {
	if ( !( (*string >= '0' && *string <= '9') ||
	        (*string == '.') ) )
	    return (0);
	string++;
    }
    return (1);
}

unsigned char is_int (char * string)
{
    /* this first silly if statement is for a leading + or - */
    if ((*string == '-') ||
	(*string == '+') )
    {
	string++;
	if (*string == '\0')
	    return (0);
    }

    while (*string != '\0')
    {
	if ( !( *string >= '0' && *string <= '9' ) )
	    return (0);
	string++;
    }
    return (1);
}

/* p_error prints the requested error message to the message window along with information
 * about the location of the error */

void p_error (FILE *buffer, char *format, ...)
{
    va_list args;
    char message[256];
    va_start(args, format);

    (void) vsprintf(message, format, args);
/*
    ::LogMsg(L_Error, message);
    ::LogMsg(L_Error,
	    "\tLine: %d, File: {%s}\n",
	    buf_line(buffer),
	    (char *)buf_path(buffer));
		*/
}


/* p_warning prints a warning level error message to the message window
 * along with information about the location of the error */

void p_warning (FILE *buffer, char *format, ...)
{
    va_list args;
    char message[256];
    va_start(args, format);

    (void) vsprintf(message, format, args);
/*
    ::LogMsg(L_Warning, message);
    ::LogMsg(L_Warning,
	    "\tLine: %d, File: {%s}\n",
	    buf_line(buffer),
	    (char *)buf_path(buffer));
		*/
}


/*======================================================================*/
/*======================================================================*/
/*

#define POP_TOKEN_NO_EOF(buffer, token, prompt)  if (pop_token(buffer, token, prompt) == EOF) { p_warning(buffer, "unexpected end of file\n", ""); return (0); }
#define ERROR_INV_INPUT_DISCARD(string) {p_error(buffer, string, token); reset_input(buffer); return (0);}

unsigned char read_int ( FILE * buffer, int & number,
			char *prompt )
{
    char token[MAX_COMMAND_LEN+1];

    POP_TOKEN_NO_EOF(buffer, token, prompt);

    if (is_int(token))
    {
	number = atoi(token);
	return (1);
    }
    else
    {
	p_error (buffer,
		 "looking for an integer number, found {%s}: line discarded\n",
		 token);
	reset_input(buffer);
    }

    return(0);
}

unsigned char read_float ( FILE * buffer, float & number,
			  char *prompt )
{
    char token[MAX_COMMAND_LEN+1];

    POP_TOKEN_NO_EOF(buffer, token, prompt);

    if (is_float(token))
    {
	number = atof(token);
	return (1);
    }
    else
    {
	p_error (buffer,
		 "looking for a floating point number, found {%s}: line discarded\n",
		 token);
	reset_input(buffer);
    }

    return(0);
}

unsigned char read_float_array (FILE *buffer, float array[],
				int max_elem,
				char *prompt )
//    FILE *buffer;   //a pointer to the file to read from 
//    float array[]; // a pointer to the array to put data in 
//    int max_elem;  // the number of elems in the array 
//    char *prompt; // the prompt to use to get more elements 
{
    char token[MAX_COMMAND_LEN+1];
    int cur_elem=0;
    int count=0;
    float number=0;
    

    while (pop_token(buffer, token, prompt) != EOF)
    {
	if (strcmp(token, "[") == 0)
	{
	    POP_TOKEN_NO_EOF(buffer, token, prompt);	    

	    // array_name [*] 
	    if (strcmp(token, "*") == 0)
	    {
		POP_TOKEN_NO_EOF(buffer, token, prompt);
		if (strcmp (token, "]") != 0)
		{
		    ERROR_INV_INPUT_DISCARD("expected a ], got a {%s}: line discarded\n");
		}
		
		POP_TOKEN_NO_EOF(buffer, token, prompt);

		if ( !is_float (token) )
		{
		    ERROR_INV_INPUT_DISCARD(
					    "expected a floating point number, got a {%s}: line discarded\n");
		}
		else
		    number = (float)atof(token);
	    
		for (cur_elem=0; cur_elem < max_elem; cur_elem++)
		    array[cur_elem] = number;
	    }

	    // array_name [#:#] or array_name [#] 
	    else if (is_int(token))
	    {
		cur_elem = atoi(token);
		POP_TOKEN_NO_EOF(buffer, token, prompt);

		// array_name[#] 
		if (strcmp(token, "]") == 0)
		{
		    POP_TOKEN_NO_EOF(buffer, token, prompt);
		    if (is_float(token))
			array[cur_elem++] = (float)atof(token);
		    else
		    {
			p_warning(buffer, "non numeric token after an array index.\n");
			push_last_token (buffer);
			return (1);
		    }
		}
		// array_name[#:#] 
		else if (strcmp(token, ":") == 0)
		{
		    POP_TOKEN_NO_EOF(buffer, token, prompt);
		    if (!is_int(token))
		    {
			ERROR_INV_INPUT_DISCARD("expected an int, got {%s}: line discarded\n");
		    }
		    count = atoi(token);

		    if (count < cur_elem)
			swapint( cur_elem, count );
		
		    POP_TOKEN_NO_EOF(buffer, token, prompt);
		    if (strcmp(token, "]"))
		    {
			ERROR_INV_INPUT_DISCARD("expected a {]}, got {%s}: line discarded\n");
		    }

		    POP_TOKEN_NO_EOF(buffer, token, prompt);
		    if (!is_float(token))
		    {
			ERROR_INV_INPUT_DISCARD("expected a float, got {%s}: line discarded\n");
		    }
		    else
			number = (float) atof (token);
		
		    for (; cur_elem <= count && cur_elem < max_elem; cur_elem++)
			array[cur_elem] = number;
		}
		else
		{
		    ERROR_INV_INPUT_DISCARD("expected a : or ], got {%s}: line discarded\n");
		}
	    }
	    else
	    {
		ERROR_INV_INPUT_DISCARD("expected a * or integer, got {%s}: line discarded\n");
	    }
	}
	else if (is_float(token))
	    if (cur_elem < max_elem)
		array[cur_elem++] = (float)atof(token);
	    else
	    {
		push_last_token(buffer);
		p_warning(buffer,
			"exceeded the maximum number of elements of an array\n");
		return(0);
	    }
	else
	{
	    push_last_token(buffer);
	    return(1);
	}
    }
	return(0);
}



unsigned char skip_all_numbers (FILE * buffer)
{
    char token[MAX_COMMAND_LEN+1];

    while (pop_token(buffer, token, "bogus prompt -> ") != EOF)
	if (!is_float(token))
	{	
	    push_last_token(buffer);
	    return(1);
	}
    return(1);
}

unsigned char skip_numbers (FILE *buffer, int max)
{
    char token[MAX_COMMAND_LEN+1];
    int count = 0;

    while (count <= max &&
	   pop_token(buffer, token, "bogus prompt -> ") != EOF)
	if (!is_float(token))
	{	
	    push_last_token(buffer);
	    return(1);
	}
    
    return(1);
}
    
unsigned char skip_num_array (FILE *buffer, int max)
{
    char token[MAX_COMMAND_LEN+1];

    POP_TOKEN_NO_EOF(buffer, token, "bogus prompt ->");
    
    if (strcmp(token, "[") == 0)
    {
	while ((pop_token(buffer, token, "bogus prompt -> ") != EOF) &&
	       (strcmp(token, "]") != 0))
	    if ((strcmp(token, "*") != 0) &&
		(strcmp(token, ":") != 0) &&
		(!is_float(token))          )
		ERROR_INV_INPUT_DISCARD("invalid array format.  token = {%s}: line discarded\n");
    }    
    else if (!is_float(token))
    {
	ERROR_INV_INPUT_DISCARD("invalid array format.  token = {%s}: line discarded\n");
    }

    return (skip_num_array(buffer, max-1)) ;
    
}


/*======================================================================*/

/*======================================================================*/
/*
FILE * include (FILE * buffer)
{
    FILE * newbuffer;
    char token[MAX_COMMAND_LEN+1];
    char newdir[MAXPATHLEN], pathname[MAXPATHLEN];
    
    //parse the file name 
    if (pop_token(buffer, token, "Include file -> ") == EOF)
    {
	p_error(buffer,
		"encountered EOF after include statement.\n");
	return(buffer);
    }
    
    // push the current buffer 
    push_buf(buffer);
    
    // get the path and dir of the new file 
    (void) real_filename(token, pathname);
    (void) dirname(pathname, newdir);
    
    // pushd to the new dir 
    if (pushd(newdir))
    {
	::PerrorMsg("Include:");
	return(buffer);
    }
    
    // open the file 
    if ( (newbuffer = buf_open(pathname, "r")) )
	// return the new buffer
	return(newbuffer);
    else
    {
	p_error(buffer, "could not open include file {%s}\n",
		pathname);
	(void)pop_buf();
	if (popd())
	{
	    ::PerrorMsg("Include:");
	}
	return(buffer);
    }
}

FILE * return_from(FILE * buffer)
{
    if (popd ())
	::PerrorMsg("Return_from:");

    if (can_pop_buf())
    {
	buf_close(buffer);
	return(pop_buf());
    }
    else
    {
	p_error(buffer,
		"return_from(buffer) called w/ no buffers on the stack.\n");
	return(buffer);
    }
}

FILE * open_to_parse (char * filename)
{
    FILE * buffer;
    char newdir[MAXPATHLEN], pathname[MAXPATHLEN];

    if (!(filename && *filename))
    {
	::LogMsg(L_Error, "null filename!\n");
	return ((FILE *) 0);
    }
    
    // get the path and dir of the new file 
    (void) real_filename(filename, pathname);
    (void) dirname(pathname, newdir);
    
    // pushd to the new dir 
    if (*newdir != '\0' &&
	pushd(newdir))
    {
	::PerrorMsg ("Include:");
	return((FILE *) 0);
    }

    // open the file
    if ( (buffer = buf_open(pathname, "r")) )
	// return the new buffer 
	return(buffer);
    else
    {
	p_error(buffer, "could not open file {%s}\n",
		pathname);

	if (popd())
	{
	    ::PerrorMsg("Include:");
	}

	return((FILE *) 0);
    }
}

void close_after_parse (FILE * buffer)
{
    while(can_popd())
	if (popd())
	    ::PerrorMsg("Cleanup after parse:");
    buf_close(buffer);
    return;
}

*/
