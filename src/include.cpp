#include <malloc.h>
#include <stdio.h>

#include "log.h"
#include "include.h"

/* define the stack type */
struct buf_stack
{
    FILE * buffer;
    struct buf_stack *next;
};

static struct buf_stack *stack = 0;

unsigned char can_pop_buf()
{
    return (stack ? 1 : 0);
}

FILE * pop_buf()
{
    struct buf_stack *old;
    FILE *buffer;
    
    if (!stack)
    {
	::LogMsg(L_IOMsg, "I can't pop the buffer off the stack because %s\n%s\n",
		"there's no buffers there.", "Bozo alert!");
	return((FILE *) 0);
    }
    
    old=stack;
    stack=stack->next;
    
    buffer = old->buffer;
    free ((char *)old);

    return(buffer);
}

void push_buf(FILE * buffer)
{
    struct buf_stack *mynew =
	(struct buf_stack *)malloc(sizeof(struct buf_stack));

    if (!mynew) /* malloc error */
    {
	::LogMsg(L_Error, "Error allocating memory for buffer on stack.\n");
	return;
    }
    
    mynew->next = stack;
    mynew->buffer = buffer;
    stack = mynew;
    return;
    
}

