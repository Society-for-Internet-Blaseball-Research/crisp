// stock config class

#ifndef STOCK_CONFIG_H
#define STOCK_CONFIG_H

#include <assert.h>
#include "AgeVec.h"
#include "Calendar.h"
#include "Cohort.h"
#include "FixedEscStock.h"

class FloatSliderDisplay;
class Stock;
class IOCrud;

// config manager for a harvest object

class StockConfig : public Calendar {
  friend class Stock_UI;
  public:
    StockConfig();
    ~StockConfig();

    // return the inter_dam_loss for the current year
    double inter_dam_loss() const
	{ return inter_dam_losses[year()]; }
    // Return the inter_dam_loss for an arbitrary year -- for summaries.
    double inter_dam_loss(int yr) const
	{ return inter_dam_losses[yr]; }  

    // return the ev_scalar for the current year.
    double ev_scalar(int yr = -1) const
	{   return ev_scalars[(yr < 0) ? year() : yr]; }

    // return the current maturation rate
    double maturation_rate(Age age) const
	{ return maturation_rates[age][year()]; }
    double maturation_rate(int year, Age age) const
        { return maturation_rates[age][year]; }

    // return escapement management data
    double escapement_goal() const
	{ return fixed_esc ? fixed_esc->escapement_goal() : 0; }
    double management_idl() const
	{ return fixed_esc ? fixed_esc->management_idl() : 0; }
    
    // Return adult_eq for summaries.
    double adult_eq(Age age, int yr) const
	{ return adult_eqs[age][yr]; }
    
    // data initialization fns - data is copied

    void add_ev_scalars(const double* evs);
    void add_fixed_escapement(const FixedEscStock& fes);

    // monte interface fns.  these provide underlying access to data items.
    // yes, they are public fns, but they should not be echoed in the Stock
    // class.  thus, only a class which has a handle to this Config (e.g.
    // MonteStockIntrfc) will be able to call them.

    double* get_ev_ptr() { return ev_scalars; }

    // For use by calibration code only:
    void set_ev(int year, double val) { ev_scalars[year] = val; }
    void set_maturation_rate(int year, Age age, double val)
        { maturation_rates[age][year] = val; }
    void set_adult_eq(int year, Age age, double val)
        { adult_eqs[age][year] = val; }
    
    // parsing functions.
    int parse_default_adult_eqs(IOCrud *);
    int parse_adult_eqs(IOCrud *, int);
    int parse_default_maturation_rates(IOCrud *);
    int parse_maturation_rates(IOCrud *, int);
    int parse_default_inter_dam_loss(IOCrud *);
    int parse_variable_inter_dam_loss(IOCrud *, int, int);

	//GUI set function
	void gui_set_idl(const int yr, const double val) 
	{ inter_dam_losses[yr] = val; }  

  private:
    HvAgeVec<double *> adult_eqs;
    HvAgeVec<double *> maturation_rates;
    double *inter_dam_losses;
    double *ev_scalars;

    // fixed escapement management.  0 if not configured for this stock.
    FixedEscStock *fixed_esc;
};


#endif
