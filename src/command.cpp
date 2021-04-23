#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <stdlib.h>
#include "command.h"
#include "log.h"
    
struct command_list
{
    int index;			/* number returned to calling fcn */
    unsigned int unique_char;   /* the first unique character in the command */
    char command[MAX_COMMAND_LEN]; /* the actual command 		  */
    struct command_list *next;     /* next in the linked list */
};

static unsigned int find_unique_char (char *s1, char * s2)
{
    if ( (*s1 != *s2) || (*s1 == '\0') )
	return (1);
    else
	return (1 + find_unique_char ( (s1+1), (s2+1) ));
}

static void set_unique_char_list (struct command_list *list,
				  struct command_list *MyNew)
{
    unsigned int uc;
    
    if (list)
    {
	if ( (uc = find_unique_char (list->command,
				     MyNew->command)) > list->unique_char)
	    list->unique_char = uc;
	if ( uc > MyNew->unique_char )
	    MyNew->unique_char = uc;
	set_unique_char_list (list->next, MyNew);
    }
    return ;
}

static struct command_list *MyNew_command(int index,
					  char *command)
{
    struct command_list *MyNew;
    if ((MyNew=(struct command_list *)malloc(sizeof(struct command_list))))
    {
	MyNew->index = index;
	(void) strncpy(MyNew->command, command, MAX_COMMAND_LEN);
	MyNew->unique_char = 0;
	MyNew->next = 0;
    }
    return(MyNew);
}

static void com_add_to_list_r (struct command_list *clist,
			       struct command_list *MyNew)
{
    if (!clist->next)
	clist->next = MyNew;
    
    else if (strcmp(MyNew->command, clist->next->command) > 0)
	com_add_to_list_r (clist->next, MyNew);
    
    else if (strcmp(MyNew->command, clist->next->command) < 0)
    {
	MyNew->next = clist->next;
	clist->next = MyNew;
    }
    
    else if (strcmp(MyNew->command, clist->next->command) == 0)
    {
	::LogMsg(L_Warning,
		"Command %s with index %d duplicated.  Index is now %d.\n",
			MyNew->command, clist->next->index, MyNew->index);
	clist->next->index = MyNew->index;
	(void) free ((char *) MyNew);
    }
    
    else
	::LogMsg(L_Msg,
		"Pure CHAOS in com_add_to_list_r. MyNew command was (%s).\n",
			MyNew->command);
    return;
}

COMMAND_LIST com_add_to_list (COMMAND_LIST clist,
			      int index,
			      char *command)
{
    struct command_list *MyNew;
    if (!(MyNew=MyNew_command(index,command)))
    {
	perror ("com_add_to_list: error allocating memory:");
	return((COMMAND_LIST) clist);
    }
    set_unique_char_list ((struct command_list *)clist, MyNew);
    
    if (!clist)
	clist = (COMMAND_LIST)MyNew;
    else if (strcmp(MyNew->command,
		    ((struct command_list *)clist)->command) < 0)
    {
	MyNew->next = (struct command_list *)clist;
	clist = (COMMAND_LIST)MyNew;
    }	
    else if (strcmp(MyNew->command,
		    ((struct command_list *)clist)->command) == 0)
    { /* if the commands are identical,
	 have the MyNew one replace the old one */
	::LogMsg(L_Warning,
		"Command %s with index %d duplicated.  Index is now %d.\n",
		((struct command_list *)clist)->command,
		((struct command_list *)clist)->index, MyNew->index);
	((struct command_list *)clist)->index = MyNew->index;
	(void) free ((char *)MyNew);
    }
    else
	com_add_to_list_r ((struct command_list *)clist, MyNew);
    
    return((COMMAND_LIST) clist);
}

COMMAND_LIST com_add_array_to_list (COMMAND_LIST clist,
				    struct command_struct *com_array)
{
    if (com_array && com_array->index)
    {
	clist=com_add_to_list((struct command_list *)clist,
			      com_array->index, com_array->command);
	clist=com_add_array_to_list((struct command_list *)clist,
				    (com_array+1));
    }
    return (clist);
}


COMMAND_LIST com_create_list (COMMAND_LIST clist,
			      struct command_struct *com_array)
{
    clist=(COMMAND_LIST)0; /* list might already exists, but we don't care */
    if (com_array && com_array->index)
	clist=com_add_array_to_list(clist, com_array);
    return(clist);
}

void com_print_list(FILE *buffer,
		    COMMAND_LIST clist)
{
    if (clist)
    {
	(void) fprintf (buffer, "command (%s) is index %d, unique char %d\n",
			((struct command_list *)clist)->command,
			((struct command_list *)clist)->index,
			((struct command_list *)clist)->unique_char);
	com_print_list(buffer, ((struct command_list *)clist)->next);
    }
}
    
void com_destroy_list (COMMAND_LIST clist)
{
    if (clist)
    {
	com_destroy_list (((struct command_list *)clist)->next);
	(void) free ( (char *) clist);
    }
}

/* NOTE that c1 must be the command entered and c2 must be the
 * command from the list 
 *      Change this so I can delete the bloody note
 */

static unsigned char command_matches (char *c1, char *c2,
				      unsigned int minlen)
{
    unsigned int cur=0;
    while ( (*(c1+cur) == *(c2+cur)) && (*(c1+cur) != '\0') )
	cur++;

    if (( *(c1+cur) ==  *(c2+cur) || *(c1+cur) == '\0' ) &&
	(cur+1) >= minlen)
	return (1);
    else
	return (0);
}

/*
 * int com_ref (clist, command, abbrev_ok)
 *	locate a command in a list.  abbreviation may or may not be allowed,
 *	as specified by the third param.
 *
 * 	Return: 0 if not found, or index of matching command
 */

static int com_ref (struct command_list *clist,	/* list of commands */
		    char *command,		/* command string to compare */
		    int abbrev_ok)		/* bool: abbreviation ok? */
{
    if (clist==0)
	return (0);
    else if (command_matches (command, clist->command,
			      abbrev_ok ? clist->unique_char
			      		: strlen(clist->command)))
	return (clist->index);
    else
	return (com_ref(clist->next, command, abbrev_ok));
}

/*
 * two routines to interface to com_ref(), one with abbreviations
 * allowed, the other without.
 */

int com_reference (COMMAND_LIST clist,
		   char *command)
{
    return (com_ref((struct command_list *)clist, command, 1));	/* abbreviations ok */ 
}

int com_reference_full (COMMAND_LIST clist,
			char *command)
{
    return (com_ref((struct command_list *)clist, command, 0));	/* no abbreviations */ 
}
