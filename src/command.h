#ifndef CRISP_COMMAND_H
#define CRISP_COMMAND_H

#include "tokens.h"
#define MAX_COMMAND_LEN MAX_TOKEN_LEN
#define COMMAND_LIST void *
    
typedef struct command_struct
{
    int index;
    char command[MAX_COMMAND_LEN+1];
} command_struct;

extern COMMAND_LIST com_create_list( COMMAND_LIST clist,
				       struct command_struct *com_array );
extern COMMAND_LIST com_add_array_to_list( COMMAND_LIST clist,
				       struct command_struct *com_array );
extern COMMAND_LIST com_add_to_list( COMMAND_LIST clist, int index,
				       char *command  );

extern int com_reference( COMMAND_LIST clist, char * command );
extern int com_reference_full( COMMAND_LIST clist, char * command );

extern void com_print_list( FILE * buffer, COMMAND_LIST clist  );
extern void com_destroy_list(  COMMAND_LIST clist );

#endif /* CRISP_COMMAND_H */
