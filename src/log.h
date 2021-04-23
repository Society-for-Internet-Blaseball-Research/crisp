

/*
 * log.h
 *
 *	The LogLevel class, which provides log window capabilities for
 * CRiSP2.  The function log_msg, which is the primary interface for this
 * utility and takes a LogLevel parameter, simply calls the public member
 * function display_log_level for the LogLevel passed in.
 *
 *	LogLevel itself maintains a static log_window pointer, as well
 * as a static list of valid LogLevels, which represent the available
 * loggable error levels.  The creation of a new LogLevel variable
 * automatically adds that level to the possible loggable errors, and
 * the deletion removes it.
 *
 *	The general way to add a loggable error level is to create a
 * global LogLevel variable which stays around for the life of the
 * program.  This then allows the program to call an error for any
 * LogLevel it has access to, although it is also possible to create
 * a local LogLevel if desired, which will add the level on construction
 * and remove the level on destruction.
 */
#ifndef C2_LOG_H
#define C2_LOG_H
#include <string.h>
#include <stdio.h>
#include <stdarg.h>
#include <rw/tpslist.h>

#ifdef USE_OI
#include <OI/oi.H>
#else // USE_OI
#ifdef _GUI_
#include <PopUpWindow.h>
#include <ToggleChoice.h>
#include <TextDisplay.h>
#endif 
#endif // USE_OI

#include "Bool.h"

extern "C" {
    #include <errno.h>
    extern int errno;
    extern int sys_nerr;
    extern char *sys_errlist[];
};

/* 
 * The constructor for LogLevel requires at least two parameters, the first,
 *	a boolean, specifies whether that LogLevel is "set" at init time.
 *
 * The required char * name parameter cannot have any characters inappropriate
 *	to use as OI object names (most notably spaces).
 */
class LogLevel {
  public:
    LogLevel(Bool, char *, char * = 0, Bool = FALSE, Bool = TRUE,
	     Bool = FALSE);
    ~LogLevel();

#ifndef OI_FIXED_THEIR_CONSTS
    static void display_log_message(char *);
#else
    static void display_log_message(const char *);
#endif

    Bool set() const { return flag; }

    // These two operators are mostly bogus, added to allow use of the list.
    int operator==(const LogLevel &rhs) const { return this == &rhs; }
    int operator<(const LogLevel &rhs)  const { return this <  &rhs; }

  private:

#ifdef USE_OI
    static OI_box *log_window;
#else
#ifdef _GUI_
    static PopUpWindow  *log_window;
    static ToggleChoice *toggle;
    static TextDisplay  *text;
#endif
#endif
    static RWTPtrSlist<LogLevel> list;

    static void hide_log_window();
    static void make_log_window();
    static void show_log_window();

#ifdef USE_OI
    void log_poly_callback(OI_menu_cell *, void *, OI_number);
#endif
    Bool set(Bool v) { return flag = v; }

    int is_fatal() const { return fatal; }
    int is_settable() const { return user_settable; }
    int forces_show() const { return force; }
    const char *get_name() const { return name; }

    // Note that because there is no copy constructor, passing by value is
    // *NOT* allowed!
    LogLevel(const LogLevel &);				// Prohibit its use.
    const LogLevel &operator=(const LogLevel &);	// Prohibit its use.

    Bool flag;
    Bool user_settable;
    Bool force;
    Bool fatal;

    char *name;
    char *prefix;
};

// These names don't fit in with the traditional naming scheme for
// backwards compatability.

extern LogLevel L_Error;
extern LogLevel L_Warning;
extern LogLevel L_Msg;
extern LogLevel L_IOMsg;
extern LogLevel L_DbgMsg;
extern LogLevel L_Fatal;
extern LogLevel L_Force;

/*
 * int LogTest(const LogLevel &l) A fast in-line test of a LogLevel to see
 *	if it is set.
 */
inline int LogTest(const LogLevel &l)
{
    return l.set();
}

/* LogBuf exists because current C++ compilers can handle temporary
 * arrays in inlined functions.  Go figure.  I don't like this way of
 * doing it (with a global variable) but it's tradition by now. -Tom
 */

extern char LogBuf[];

/* LogMsg was originally inlined, but this Sun's C++ compiler can't
 * handle optimizing and resolving an inlined function using stdargs,
 * so it's been moved to log.cc.
 */

extern void LogMsg(const LogLevel &l, const char *format, ...);

/*
 * void PerrorMsg(const char *string) - Perror style error message logging.
 *	Depends on the C global errno, which is somewhat counter to the
 *	C++ programming style.
 */
inline void PerrorMsg(const char *string)
{
    if (::LogTest(L_Error)) {
//	sprintf(LogBuf, "%s: %s\n", string, (errno < sys_nerr)
//		? sys_errlist[errno] : "Unrecognized error");
//	L_Error.display_log_message(LogBuf);
    }
}

#endif /* C2_LOG_H */













