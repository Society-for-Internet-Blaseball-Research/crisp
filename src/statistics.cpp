#include <assert.h>

/*
 * int compare(float *we, float *they)
 * For use with qsort().
 * if (*we > *they) returns 1
 * if (*we < *they) returns -1
 * if (*we == *they) returns 0
 */
int compare(const void * we, const void * they )    
{
    float *a = (float *) we;
    float *b = (float *) they;
    
    if (*a > *b)
        return 1;
    else if (*a < *b)
        return -1;
    else
        return 0;
}

/*
 * There's some disagreement on what a quantile is.  This method performs
 * linear interpolation with the bounding samples within the cumulative
 * distribution 'vals'.  It should be clearly documented to the user.
 */
float get_quantile(float *vals, int nvals, float q)
{
    assert( (q >= (.5 / (float) nvals))
	   && (q <= (1 - .5 / (float) nvals)) );
    float j = (float)(q * nvals + 0.5);
    int lsample = (int) j;
    j -= (float) lsample;
    lsample--;
    return vals[lsample] + j
	* (vals[lsample+1] - vals[lsample]);
}
