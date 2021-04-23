#include <errno.h>
#include <fcntl.h>
#include <malloc.h>
#include <stdio.h>
#include <strings.h>
#include <unistd.h>
#include <sys/mman.h>
#include <sys/time.h>
#include <sys/wait.h>
#include <sys/resource.h>
#include <sys/stat.h>
#include <sys/types.h>

#include "clog.h"
#include "dir.h"

#ifndef MAP_FILE
#define MAP_FILE 0
#endif

#define u_mode_bits(x) ((unsigned)((x) & 0000700) >> 6)
#define g_mode_bits(x) ((unsigned)((x) & 0000070) >> 3)
#define o_mode_bits(x) ((unsigned)((x) & 0000007) >> 0)

#define X_BIT(x) (x & 1)
#define FS_EXISTS       0x1
#define FS_EXECABLE     0x2

#define savestring(x) (char *)strcpy (malloc (1 + strlen (x)), (x))

int group_member (gid)
     gid_t gid;
{
  return ((gid == getgid ()) || (gid == getegid ()));
}

/* Return 1 if PATH1 and PATH2 are the same file.  This is kind of
   expensive.  If non-NULL STP1 and STP2 point to stat structures
   corresponding to PATH1 and PATH2, respectively. */
int
same_file (path1, path2, stp1, stp2)
     char *path1, *path2;
     struct stat *stp1, *stp2;
{
  struct stat st1, st2;

  if (stp1 == NULL)
    {
      if (stat (path1, &st1) != 0)
        return (0);
      stp1 = &st1;
    }

  if (stp2 == NULL)
    {
      if (stat (path2, &st2) != 0)
        return (0);
      stp2 = &st2;
    }

  return ((stp1->st_dev == stp2->st_dev) && (stp1->st_ino == stp2->st_ino));
}


/* Return some flags based on information about this file.
   The EXISTS bit is non-zero if the file is found.
   The EXECABLE bit is non-zero the file is executble.
   Zero is returned if the file is not found. */
int
file_status (name)
     char *name;
{
  struct stat finfo;
  static int user_id = -1;

  /* Determine whether this file exists or not. */
  if (stat (name, &finfo) < 0)
    return (0);

  /* If the file is a directory, then it is not "executable" in the
     sense of the shell. */
  if (S_ISDIR (finfo.st_mode))
    return (FS_EXISTS);

  /* Find out if the file is actually executable.  By definition, the
     only other criteria is that the file has an execute bit set that
     we can use. */
  if (user_id == -1)
    user_id = geteuid ();

  /* Root only requires execute permission for any of owner, group or
     others to be able to exec a file. */
  if (user_id == 0)
      {
      int bits;

      bits = (u_mode_bits (finfo.st_mode) |
              g_mode_bits (finfo.st_mode) |
              o_mode_bits (finfo.st_mode));

      if (X_BIT (bits))
        return (FS_EXISTS | FS_EXECABLE);
  }

  /* If we are the owner of the file, the owner execute bit applies. */
  if (user_id == finfo.st_uid && X_BIT (u_mode_bits (finfo.st_mode)))
    return (FS_EXISTS | FS_EXECABLE);

  /* If we are in the owning group, the group permissions apply. */
  if (group_member (finfo.st_gid) && X_BIT (g_mode_bits (finfo.st_mode)))
    return (FS_EXISTS | FS_EXECABLE);

  /* If `others' have execute permission to the file, then so do we,
     since we are also `others'. */
  if (X_BIT (o_mode_bits (finfo.st_mode)))
    return (FS_EXISTS | FS_EXECABLE);
  else
    return (FS_EXISTS);
}


static char * extract_colon_unit (string, index)
	char *string;
	int *index;
{
    int i, start;
    
    i = *index;
    
    if (!string || (i >= strlen (string)))
	return ((char *)NULL);
    
    /* Each call to this routine leaves the index pointing at a colon if
       there is more to the path.  If I is > 0, then increment past the
       `:'.  If I is 0, then the path has a leading colon.  Trailing colons
       are handled OK by the `else' part of the if statement; an empty
       string is returned in that case. */
    if (i && string[i] == ':')
	i++;
    
    start = i;
    
    while (string[i] && string[i] != ':') i++;
    
    *index = i;
    
    if (i == start)
	{
	    if (string[i])
		(*index)++;
	    
	    /* Return "" in the case of a trailing `:'. */
	    return (savestring (""));
	}
    else
	{
	    char *value;
	    
	    value = (char *)malloc (1 + (i - start));
	    strncpy (value, &string[start], (i - start));
	    value [i - start] = '\0';
	    
	    return (value);
	}
}

static char * get_next_path_element (path_list, path_index_pointer)
	char *path_list;
	int *path_index_pointer;
{
    char *path;
    
    path = extract_colon_unit (path_list, path_index_pointer);
    
    if (!path)
	return (path);

    if (!*path)
	{
	    free (path);
	    path = savestring (".");
	}

    return (path);
}


/* Finds 'name' in 'searchpath'. */
char * find_file_in_path(searchpath, name)
	char *searchpath, *name;

{
    char *full_path, *path, scratch[1024], fbuf[2048], *ptr;
   int status, path_index, name_len;
    struct stat finfo;
    
    name_len = strlen (name);

    /* if name is an abolute filename... */
    if (*name == '/')
	{
	    full_path = (char *)malloc (1 + strlen(name));
	    strcpy (full_path, name);
    
	    status = file_status (full_path);
	    
	    if (!(status & FS_EXISTS))
		return full_path;
	    else
		{
		    free (full_path);
		    return ((char *)NULL);
		}
	}
    
    /* Find out the location of the current working directory. */
    stat (".", &finfo);



    
    /* Go through searchpath looking for name */
    path_index = 0;
    while (searchpath && searchpath[path_index])
	{
	    path = get_next_path_element (searchpath, &path_index);
	    
	    if (!path)
		break;
	    
	    if (*path == '~')
		{
		    extern char *tilde();
		    tilde (path, scratch);
		    free (path);
		    path = scratch;
		}
	    
	    /* Remember the location of "." in the path, in all its forms
	       (as long as they begin with a `.', e.g. `./.') */
/*	    if ((*path == '.') &&
		same_file (".", path, &finfo, (struct stat *)NULL))*/
	    
	    full_path = (char *)malloc (2 + strlen (path) + name_len);
	    sprintf (full_path, "%s/%s", path, name);
	    free (path);
	    
	    status = file_status (full_path);
	    
	    if (status & FS_EXISTS)
		return (full_path);
	    else
		free (full_path);
	}
    return (char *) 0;
}

/* Just like cp (1), infile is parameter 1, outfile is parameter 2 */
void cp(infile, outfile)
    char *infile, *outfile;
{
    int fdin, fdout;
    char *src, *dst;
    struct stat statbuf;
	
    if (!infile || !strlen(infile) ||
	!outfile || !strlen(outfile))
    {
	log_msg(L_WARNING, "Null file name in cp.  No file copied.\n");
	return;
    }
    
    if ( (fdin = open(infile, O_RDONLY)) < 0)
    {
	log_msg(L_ERROR, "Can't open %s for reading\n", infile);
	return;
    }

    if ( (fdout = open(outfile, (O_RDWR | O_CREAT | O_TRUNC),
		       S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH)) < 0)
    {
	log_msg(L_ERROR, "Can't create %s for writing\n", outfile);
	return;
    }

    if (fstat(fdin, &statbuf) < 0)
    {
	log_msg(L_ERROR, "fstat error in cp.\n");
	return;
    }

    if (lseek(fdout, statbuf.st_size - 1, SEEK_SET) == -1)
    {
	log_msg(L_ERROR, "lseek error in cp.\n");
	return;
    }

    if (write (fdout, "", 1) != 1)
    {
	log_msg(L_ERROR, "write error in cp.\n");
	return;
    }

    if ( (src = mmap(0, statbuf.st_size, PROT_READ,
		     MAP_FILE | MAP_SHARED, fdin, 0)) == (caddr_t) -1)
    {
	log_msg(L_ERROR, "mmap error for input in cp.\n");
	return;
    }

    if ( (dst = mmap(0, statbuf.st_size, PROT_READ | PROT_WRITE,
		     MAP_FILE | MAP_SHARED, fdout, 0)) == (caddr_t) -1)
    {
	log_msg(L_ERROR, "mmap error for output in cp.\n");
	return;
    }

    memcpy(dst, src, statbuf.st_size);

    munmap(src, statbuf.st_size);
    munmap(dst, statbuf.st_size);
    close(fdin);
    close(fdout);
    
    return;
}

void append(infile, outfile)
    char *infile, *outfile;
{
    FILE *in, *out;
    char string[1025];

    /* insure that string will always be null terminated */
    string[1024]='\0';
    
    in = fopen(infile, "r");
    out = fopen(outfile, "a");

    while (!feof(in))
    {
	fgets(string, 1024, in);
	fputs(string, out);
    }

    fclose(in);
    fclose(out);
    return;
}

/*
 * char *find_crisp_file(fname, full_name)
 * 	find a crisp file.  first looks for fname either as an absolute path,
 * 	or relative to the current working directory.  If not found, it looks
 * 	for fname in the directory where the crisp executable resides.
 *	full_name is provided by the caller for the resulting path string.
 *	No permissions are checked.
 *
 *	returns:	NULL if no file found
 *			char *full_name, with complete path
 */

char *find_crisp_file(fname, full_name)
    char *fname;
    char *full_name;
{
    if (file_status(real_filename(fname, full_name)) & FS_EXISTS)
	return full_name;

/*    dirname(image_loc, full_name);
    strcat(full_name, "/");
    strcat(full_name, fname);
    if (file_status(full_name) & FS_EXISTS)
	return full_name;
    else
    */
	return NULL;
}
