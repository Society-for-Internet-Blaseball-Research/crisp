// Summary.h - abstract class for handling ouput data storage.
// just provides some virtual fns

#ifndef SUMMARY_H
#define SUMMARY_H

#include "Calendar.h"

class Summary : public Calendar {
public:
    virtual ~Summary() {}

    virtual void start_year() = 0;
    virtual void end_year() = 0;
};

#endif
