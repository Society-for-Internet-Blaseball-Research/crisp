#ifndef CRISP_DIR_H
#define CRISP_DIR_H

#ifndef MAXPATHLEN
#define MAXPATHLEN (1024)
#endif

/*
 * int pushd ( char * newdir );		returns chdir codes
 * unsigned char can_popd();		returns 1 if you can pop a directory,
 *					0 otherwise 
 * int popd ();				returns chdir codes
 * char * basename ( char * path, char * name );
 *					returns a pointer to the basename 
 * char * dirname ( char * path, char * dir );
 *					returns a pointer to the directory
 * char * real_filename ( char * path, char * newpath );
 *					returns a pointer to newpath
 * Unix routines that are also usefull
 *      int access(path, mode)
 *	     char *path;
 *	     int mode;
 *		      
 *      char *realpath(path, resolved_path)
 *	    char *path;
 *	    char resolved_path[MAXPATHLEN];    
 */

#ifdef __cplusplus
extern "C" int pushd ( char * newdir );
extern "C" unsigned char can_popd();
extern "C" int popd ();
extern "C" char * basename ( char * path, char * name );
extern "C" char * dirname ( char * path, char * dir );
extern "C" char * tilde (char * file, char * scratch);
extern "C" char * real_filename ( char * path, char * newpath );
//extern "C" char * realpath ( char * path, char resolved_path[] );
#else
extern int pushd ();
extern unsigned char can_popd();
extern int popd ();
extern char * basename ();
extern char * dirname ();
extern char * tilde ();
extern char * real_filename ();
extern char * realpath ();
#endif

#endif CRISP_DIR_H
