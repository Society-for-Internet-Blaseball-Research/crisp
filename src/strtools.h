
#ifndef _STR_TOOLS_
#define _STR_TOOLS_

extern char *strupper(char *str);
extern void strzero(char *str, int num);

#ifdef WIN32
extern int strcasecmp( char *s1, char *s2 );
#endif

#endif
