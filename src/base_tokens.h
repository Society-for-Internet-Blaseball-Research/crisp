/* base_tokens.h
 */

#include "ReadToken.h"

extern ReadToken *ReadDiscardToken;// Discard the next token read.
extern ReadToken *ReadDiscardLine; // Discard to End of Line
extern ReadToken *ReadNothing;     // Read No further..NOP
extern ReadToken *ReadEnd;	   // Read No further, return End value.
