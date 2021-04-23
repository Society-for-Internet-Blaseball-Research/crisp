/* clog.cc
 *
 *	C compatability functions for the CRiSP2 message log.
 */
#include <stdarg.h>
#include "clog.h"
#include "log.h"

// The structs here must be in the same order as the enumeration type
// reflects in clog.h
const LogLevel *C_LogLevels[L_EOLL] = {
    &L_Error, &L_Warning
};

extern "C" void log_msg(log_levels l, const char *format, ...)
{
    if (::LogTest(*C_LogLevels[l])) {
	va_list args;
	va_start(args, format);
	vsprintf(LogBuf, format, args);
	C_LogLevels[l]->display_log_message(LogBuf);
	va_end(args);
    }
}
