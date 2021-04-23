// MonteOutputItem.h

#ifndef MONTE_OUTPUT_ITEM_H
#define MONTE_OUTPUT_ITEM_H

#include <stdio.h>
#include "Stock.h"

/*
 * This class is responsible for keeping track of what hardcopy data the user
 * wants saved.  One item should be created for each variable.  A handful
 * of quantiles are printed out for selected stocks, all years, and for
 * selected years, histogram data is printed according to specs in the
 * .monte file.
 */

class MonteOutputItem
{
  public:
    MonteOutputItem();
    virtual ~MonteOutputItem();

    int read(FILE *fp);
    virtual int write(char *prefix) const = 0;
    
    // unused, but necessary for rogue compilation
    int operator==(const MonteOutputItem &i) { return (&i==this); }
    int operator<(const MonteOutputItem &);

  protected:
    int nyears;
    int *years;  // array of nyears.

    int nstocks;
    Stock **stocks;
};    

class MonteEscapementOutput : public MonteOutputItem
{
    virtual int write(char *prefix) const;
};

class MonteEscQuantileOutput : public MonteOutputItem
{
    virtual int write(char *prefix) const;
};

#endif
