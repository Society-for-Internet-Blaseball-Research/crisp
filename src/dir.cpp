#include <stdio.h>
#include <string.h>
#include <sys/param.h>
#include <unistd.h>
#include <malloc.h>
#include <stdlib.h>

#include "dir.h"

/* define the stack type */
struct dir_stack
{
    char path[MAXPATHLEN];
    struct dir_stack *next;
};

static struct dir_stack *stack = 0;

static void push ( char * dirname )
{
    struct dir_stack *mynew =
	(struct dir_stack *)malloc(sizeof(struct dir_stack));

    mynew->next = stack;
    (void) strncpy ( mynew->path, dirname, MAXPATHLEN );
    stack = mynew;
}

static void pop ( )
{
    struct dir_stack *old = stack;

    if (stack != 0)
    {
	stack = stack->next;
	free ((char *)old);
    }
}


int pushd ( char * newdir )
{
    int ret=0;
    char *cwd;
    
    /* put the old dir on top of the stack */
    if ( (cwd = getcwd((char *)NULL, MAXPATHLEN)) == NULL)
    {
	perror ("pushd");
	exit (1);
    }
    push(cwd);
    free(cwd);
    
    /* chdir there */
    /* if an error during the chdir, pop the top of the stack */
    if ( (ret = chdir(newdir)) ) pop();
    
    /* return the chdir code */
    return (ret);
}

unsigned char can_popd()
{
    return (stack?1:0);
}

int popd ()
{
    int ret=0;

    /* if stack null, get out */
    if (!stack)
    {
	fprintf (stderr, "WARNING: popd called with directory stack empty.\n");
	return (ret);
    }
	    
    /* chdir to top of stack */
    ret = chdir(stack->path);
    
    /* pop it baby, pop it good */
    pop();

    return (ret);
}


char * basename (char * path, char * name )
{
    char *temp;

    if ( (temp=strrchr(path, '/')) )
	(void) strcpy(name, ++temp);
    else
	(void) strcpy(name,path);

    return(name);
}

char * dirname ( char *path, char *dir )
{
    char *temp;

    (void) strcpy(dir,path);
    
    if ( (temp = strrchr(dir, '/')) )
	*temp='\0';
    else
	*dir = '\0';

    return (dir);
}


    
#ifndef VMS
#include <pwd.h>
#endif VMS

/* tilde.c
 *
 * Evaluate ~ filename expressions, including ~ and ~username
 * It returns 0 if the original expression does not begin with ~.
 * (Is there any use for having ~'s other than as the first character?)
 *
 * Jon "~root/setuid" Sari, 1990
 *
 * Ken Case, 1991	modified to return original string on failure,
 *			rather than NULL, and to get the passwd entry
 *			itself.
 * Pete Pulliam, 1991   small modification to use old style c instead
 * 			of the totally cool ansi c that Jon uses. Also,
 *			made it take two parameters so the path doesn't
 *			get smashed, and to return a pointer to the secon
 * 			parameter.  Also, to evaluate ~ as if it was ~/ and
 *			~name as if it was ~name/.  Also to use strcpy instead
 *			of strncpy in case the user passes a short second var.
 *			whee.
 */

char *tilde(char *file, char *scratch )
{
  static struct passwd *user = (struct passwd *) 0;
  char *ptr, *indx = file;
  static char buf[MAXPATHLEN];

  if (*indx != '~') return(strcpy(scratch, file));

  /* Evaluate ~ expressions. */
  if (*++indx == '/' || *indx == '\0')		/* Increment past '~' */
    (void)strcpy(scratch, (char *) getenv("HOME"));
  else {
    int i;

    ptr = indx;
    if (!(indx = (char *) strchr(file, '/'))) indx = (char *) strchr(file, '\0');
#ifdef VMS
    for(buf[0]='[', i=1; ptr < indx; buf[i++] = *ptr++);
    buf[i++] = ']';
    buf[i] = '\0';
    indx++;
#else 
    for(i=0; ptr < indx; buf[i++] = *ptr++);
    buf[i] = '\0';
    if(user && strcmp(buf, user->pw_name)==0)
      strcpy(scratch, user->pw_dir);
    else {
      /* Find out who it might be */
      if (!(user = getpwnam(buf))) {
	return (strcpy(scratch, file));
      } else {
	strcpy(scratch, user->pw_dir);
      }
    }
#endif VMS
  }
  strcat(scratch, indx);
  return (scratch);
}


char * real_filename(char * path, char * newpath )
{
    char scratch[MAXPATHLEN];

    tilde(path, scratch);

    realpath(scratch, newpath);

    return(newpath);
}

