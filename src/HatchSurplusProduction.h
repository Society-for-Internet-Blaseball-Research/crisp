// HatchSurplus Production

#ifndef HATCH_SURPLUS_PRODUCTION_H
#define HATCH_SURPLUS_PRODUCTION_H

#include "NaturalProduction.h"
#include "HatcheryProduction.h"

class HatchSurplusProduction
	: public HatcheryProduction, public NaturalProduction {

public:
    HatchSurplusProduction(const Stock * const stk,
			   const NaturalProduction * const nat_prod,
			   const double ra, const double so, const Bool skp_msh,
			   const Bool enh_sup_flag)
	: Production(stk, ra, so),
    	  HatcheryProduction(stk, ra, so),
          NaturalProduction(stk, ra, so, skp_msh, enh_sup_flag),
    	  natural_prod(nat_prod)
	  {}
    virtual ~HatchSurplusProduction() {}
    
    virtual double spawn(double escp) const;

private:
    // this is the corresponding natural stock, initialized in the ctor
    const NaturalProduction * const natural_prod;
    static const double MAX_NATURAL_SPAWN;
};		      

#endif
