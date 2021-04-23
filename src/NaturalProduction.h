// Natural Production

#ifndef NATURAL_PRODUCTION_H
#define NATURAL_PRODUCTION_H

#include "Bool.h"
#include "Production.h"

class NaturalProduction : public virtual Production {
  public:
    NaturalProduction(const Stock * const stk, const double ra, 
		      const double so, const Bool skp_msh,
		      const Bool enh_sup_flag)
	: Production(stk, ra, so), rickerb(s_opt / (0.5 - 0.07 * rickera)),
    	  s_max(rickerb / rickera), skip_msh(skp_msh), enh_sup_flg(enh_sup_flag)
	  {}
    virtual ~NaturalProduction() {}
    
    virtual double spawn(double escp) const;

protected:
    const double rickerb;
    const double s_max;

    const Bool skip_msh;
    
    // enhancement stuff
    const Bool enh_sup_flg;

    // fns
    double fricker(double escp) const;

    // allow derived classes to get some production from a different object
    double get_other_prod(const NaturalProduction *nprod, double escp) const
    { return (nprod->fricker(escp) / nprod->recrt_age1); }
};
		      
#endif
