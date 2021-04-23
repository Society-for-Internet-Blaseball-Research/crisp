// Production base class, used from Stocks 

#ifndef PRODUCTION_H
#define PRODUCTION_H

#include "Calendar.h"

class Stock;

class Production : public Calendar {
  friend class Stock_UI;
 public:
    Production(const Stock * const stk, const double ricker_a,
	       const double sopt);
    virtual ~Production();
    
    // set the recrt_age1 from outside - a late initialization
    void set_recrt_age1(double rcrt) { recrt_age1 = rcrt; }

    // derived classes still need to call this if they implement their own
    virtual void add_enhancement(double *s_prod, double e_parm,
				 double s_age1, double e_prop);
				 
    virtual double spawn(double escp) const = 0; // this fn is behind it all

	// Gui accessor functions..
	double get_smolt_prod(int year){ return smolt_prod[year]; }
	void set_smolt_prod(int year, double val){ 	smolt_prod[year] = val;	}
	double get_enh_parm(void){ return enh_parm; }
	void set_enh_parm(double val){ enh_parm = val;}
	double get_smolt_age1(void) { return smolt_age1; }
	void set_smolt_age1(double val){ smolt_age1 = val;}
	double get_enh_prop(void) { return enh_prop; }
	void set_enh_prop(double val){ enh_prop = val;}

protected:

    // enhancement vars
    double *smolt_prod; 			// 0 val means no enhancement
    double enh_parm;				// enhancement productivity
    double smolt_age1;				// smolt to age1 survival
    double enh_prop;				// max proportion nat spawners


    const Stock * const stock;			// initial param
    const double rickera;			// initial param
    const double s_opt;				// initial param
    double recrt_age1;				// set later
    double latent_prod;				// computed from others
    

    double enh_prod;				// computed from the others

    double fbrood() const			// depends upon enhancement
    { return smolt_prod[year()] * smolt_age1 / enh_prod; }
};

#endif
