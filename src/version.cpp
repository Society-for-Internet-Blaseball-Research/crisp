#include <string.h>

/* version string, including sccs keyword characters
 *	note: the program version portion should be of the form
 *	"CRiSP ...\n" for proper functioning of the program version
 *	retrieval function below.
 */
static const char *version_id = "@(#)CRiSP Harvest v3.0.5\n@(#)version.cpp 4.3 97/05/29";

/* internal program version id, generated from version_id above */
static char program_version[64] = { 0 };


/* char *GetProgramVersion() returns a const pointer to the program
 *	version string.  this routine plucks the program version from
 *	the general version_id string.
 */

const char *GetProgramVersion()
{
    char *ptr1, *ptr2;
    int i;

    if (program_version[0] == 0)
    {
	ptr1 = strstr(version_id, "CRiSP");
	ptr2 = strchr(ptr1, '\n');

	for (i = 0; ptr1 != ptr2; i++, ptr1++)
	    program_version[i] = *ptr1;

	program_version[i] = 0;
    }
    return(program_version);
}
