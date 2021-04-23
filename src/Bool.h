// Boolean declaration

// There is a classic namespace problem here.  Other packages may (and do)
// define TRUE and FALSE, and may even define Bool.  I like mine, however,
// so I undef anything else that may be hanging around.  For this to work
// properly, one MUST follow the convention of including other library
// headers first (where the conflicting definitions may lie), then
// including this file (Bool.h).

#undef FALSE
#undef TRUE
#undef True
#undef False
#undef Bool

#ifndef BOOL_H
#define BOOL_H

enum Bool { FALSE = 0, False = 0, TRUE = 1, True = 1 };

#endif
