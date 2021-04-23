/*
 * clog.h
 *
 *	C-includeable header file for the CRiSP2 message log.
 */

#ifdef __cplusplus
extern "C" {
#endif

enum log_levels { L_ERROR, L_WARNING, L_EOLL };

#ifndef __cplusplus

/* Not ANSI C */
extern void log_msg();

#else

extern void log_msg(enum log_levels, const char *, ...);
};

#endif
