// HvSummary.h 

#ifndef HVSUMMARY_H
#define HVSUMMARY_H

#include "AgeVec.h"
#include "Summary.h"
#include "Phase.h"

// saves output data from Harvest objects every model year

class Harvest;

class HvSummary : public Summary {
public:
    HvSummary(Harvest *hv);
    virtual ~HvSummary();

    virtual void start_year() {}	// year start summaries
    virtual void end_year();		// save year end summaries

    // access results
    double get_preterm_catch(Age age, int year) const
    	{ return catches[PRETERM][age][year]; }
    double get_term_catch(Age age, int year) const
    	{ return catches[TERM][age][year]; }

    double get_cnr_sublegals(HarvestPhase phase, Age age, int year) const
    	{ return cnr_sublegals[phase][age][year]; }
    double get_cnr_legals(HarvestPhase phase, Age age, int year) const
    	{ return cnr_legals[phase][age][year]; }

    double get_preterm_shakers(Age age, int year) const
        {  return shakers[PRETERM][age][year]; }
    double get_term_shakers(Age age, int year) const
        {  return shakers[TERM][age][year]; }

	void setHarvestPtr( Harvest *ph ) { harvest = ph; };

private:
    Harvest *harvest;
    HvAgeVec<double *> catches[NUM_PHASES];
    HvAgeVec<double *> shakers[NUM_PHASES];
    HvAgeVec<double *> cnr_sublegals[NUM_PHASES];
    HvAgeVec<double *> cnr_legals[NUM_PHASES];
};


#endif
