#ifndef _SAMPLE_H_
#define _SAMPLE_H_

#include <math.h>

#define R_A 16807.0
#define R_M 2147483647.0
#define R_Q 127773.0
#define R_R 2836.0
#define R_IM (1.0 / R_M)
#define R_IQ (1.0 / R_Q)

extern double drand(double&);
extern double normal_sample();
extern double uniform_sample();
extern double broken_stick_sample();

#endif
