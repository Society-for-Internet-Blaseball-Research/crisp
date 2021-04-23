
#include "strtools.h"

char *strupper(char *str){
	char *p = str;
	while(*p != '\0'){
		if(*p <= 'z' && *p >= 'a')*p = *p-'a'+'A';
		p++;
	}
	return str;
}
// replaces bzero
void strzero(char *str, int num){
	int i;
	for(i=0;i<num;i++){
		*str=0;
		str++;
	}

}

#ifdef WIN32
/* This routine is not present in the Windows C libraries, so must be
 *  implemented to match the Unix specification.
 */
int strcasecmp( char *s1, char *s2 )
{
	int c1, c2;
	do {
		c1 = *(s1++);
		c2 = *(s2++);
		if (c1 >= 'a' && c1 <= 'z')
			c1 = (c1 - 'a') + 'A';
		if (c2 >= 'a' && c2 <= 'z')
			c2 = (c2 - 'a') + 'A';
		if (c1 != c2)
			return c1 - c2;  // return on first miscompare.
	} while (c1 || c2);
	return 0;  // strings ended without any difference detected.
}

#endif
