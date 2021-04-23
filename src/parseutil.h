#ifndef CRISP_PARSEUTIL
#define CRISP_PARSEUTIL

#include "command.h"
#include "log.h"
#include "include.h"
#include "dir.h"
#include "stdlib.h"

/* P_ERROR and P_WARNING print the requested error message to the message
 * window along with information about the location of the error */

#define P_ERROR(format, string) p_error (buffer, format, string)

#define P_WARNING(format, string) p_warning (buffer, format, string)

/* UNKNOWN_COMMAND_ERROR prints an appropriat message using P_ERROR.  It also
 * checks to see if the token is a number, and skips any following numbers if
 * it is. */
#define UNKNOWN_COMMAND_ERROR(buffer, token)\
{\
    if (is_float(token))\
    {\
	p_error(buffer, "unknown command {%s}, which is a number.\n\tSkipping all numbers until a non-numeric tolkien is reached.\n", token);\
	(void)skip_all_numbers(buffer);\
    }\
    else\
    {\
	p_error (buffer, "unknown command {%s}: line discarded\n", token);\
	reset_input(buffer);\
    }\
}

#define FALSE 0
#define TRUE 1

extern char * lowercase(char *s, char *scratch );

extern char * unders_to_spaces (char *string );

extern unsigned char is_float ( char *string );

extern unsigned char is_int ( char *string );

extern void p_error ( FILE *buffer, char *format, ... );

extern void p_warning ( FILE *buffer, char *format, ... );

extern unsigned char read_int ( FILE *buffer, int & number,
			       char *prompt = (char *)0);

extern unsigned char read_float ( FILE *buffer, float  & number,
				 char *prompt = (char *)0 );

extern unsigned char read_float_array (FILE *buffer, float array[],
				       int max_elem,
				       char *prompt = (char *)0 );

extern unsigned char skip_all_numbers ( FILE *buffer );

extern unsigned char skip_numbers ( FILE *buffer, int max );

extern unsigned char skip_num_array ( FILE *buffer, int max );

extern struct period_list_struct *parse_periods ( FILE *buffer );

extern FILE * open_to_parse( char * filename );

extern void close_after_parse( FILE *buffer );

extern FILE * include( FILE *buffer );

#define can_return_from(buffer) can_pop_buf()

extern FILE * return_from( FILE * buffer );

#endif /* CRISP_PARSEUTIL */
