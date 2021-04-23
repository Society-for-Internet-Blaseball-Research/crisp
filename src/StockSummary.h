// StockSummary.h

#ifndef STOCKSUMMARY_H
#define STOCKSUMMARY_H

#include "AgeVec.h"
#include "Summary.h"
#include "Cohort.h"

class Stock;

// saves output data from Stock objects every model year

class StockSummary : public Summary {
  public:
    StockSummary(Stock* s);
    virtual ~StockSummary();

    virtual void start_year();		// save year start summaries
    virtual void end_year();		// save year end summaries
    
    // access fns
    double get_preterm_catch(Age age, int year) const;
    double get_term_catch(Age age, int year) const;
    double get_total_catch(Age age, int year) const
    	{ return get_preterm_catch(age, year) + get_term_catch(age, year); }
    double get_escapement(Age age, int year) const
    	{ return escapements[age][year]; }
    double get_escapement(int year) const;
    double get_adult_escapement(int year) const;
    double get_abundance(Age age, int year) const
    	{ return abundances[age][year]; }
    double get_cnr_sublegals(Age age, int year) const;
    double get_cnr_legals(Age age, int year) const;
    double get_term_run(Age age, int year) const
        { return terminal_run[age][year]; }
    
	void setStockPtr( Stock *s ) { stock = s; };

  private:
    Stock *stock;			// stock for this summary object
    HvAgeVec<double*> escapements;	// yearly escapements
    HvAgeVec<double*> terminal_run; 	// yearly term run
    AgeVec<double*> abundances;		// year end abundances
};


#endif
