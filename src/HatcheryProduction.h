// Hatchery Production

#ifndef HATCHERY_PRODUCTION_H
#define HATCHERY_PRODUCTION_H

#include "Production.h"

class HatcheryProduction : public virtual Production {
  public:
    HatcheryProduction(const Stock * const stk, const double ra, 
		      const double so) : Production(stk, ra, so) {}
    virtual ~HatcheryProduction() {}
    
    virtual double spawn(double escp) const;
};
		      
#endif
