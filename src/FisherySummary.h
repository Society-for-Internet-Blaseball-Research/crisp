// StockSummary.h

#ifndef FISHERYSUMMARY_H
#define FISHERYSUMMARY_H

#include "Summary.h"
#include "Cohort.h"

class Fishery;

// saves output data from Fishery objects every model year

class FisherySummary : public Summary {
  public:
    FisherySummary(Fishery* f);
    FisherySummary();
    virtual ~FisherySummary();
    virtual void start_year() {}
    virtual void end_year();
	
    // access fns
    double get_preterm_catch(Age age, int year) const;
    double get_term_catch(Age age, int year) const;
    double get_total_catch(Age age, int year) const
    	{ return get_preterm_catch(age, year) + get_term_catch(age, year); }

    double get_preterm_shakers(Age age, int year) const;
    double get_term_shakers(Age age, int year) const;

    double get_preterm_shakers(int year) const;
    double get_term_shakers(int year) const;
    
    double get_total_legal_cnr(int year) const;
    double get_total_sublegal_cnr(int year) const;
    double get_total_cnr(int year) const;

    double get_abundance_index(int year) const;
    double get_policy_hv_scalar(int year) const;
    
	void setFisheryPtr( Fishery *pf ) { fishery = pf; };

  private:
//GROT - was Fishery *const fishery;		
    Fishery *fishery;		// Fishery for this summary object
    double *policy_scalars;
};

#endif
