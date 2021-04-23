/* FixedCombHarv.h - Subclass of FixedEscapementCombined to handle a
 * combined harvest rate goal for a group of river fisheries.
 */

#ifndef FIXED_COMB_HARV_H
#define FIXED_COMB_HARV_H

#include "FixedEscapementPolicy.h"

class FixedCombHarv : public FixedEscapementCombined {
  public:
    FixedCombHarv(const FisheryList& fl, const StockList& sl,
		  const BoolVec& m, const BoolVec& f,
		  const DoubleVec& hrs) 
	: FixedEscapementCombined(fl, sl, m, f), hr_goals(hrs)
	{}

    virtual ~FixedCombHarv() {}

  protected:
    virtual double escapement_goal() const;
    
  private:
    DoubleVec hr_goals;		// combined harvest rate goals by year
};

#endif
