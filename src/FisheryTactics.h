// fishery tactics class

#ifndef FISHERY_TACTICS_H
#define FISHERY_TACTICS_H

#include <assert.h>
#include "AgeVec.h"
#include "Bool.h"
#include "Calendar.h"
#include "Cohort.h"
#include "CNR.h"
#include "Ceiling.h"

class Fishery;
class IOCrud;

// tactis manager for a fishery object

class FisheryTactics : public Calendar {
    friend class Fishery_UI;
	friend class Fishery;
  public:
    FisheryTactics();
    ~FisheryTactics();

    void year_init() {}			    // currently no-op
    void year_wrapup(const Fishery& f) { if (ceiling) ceiling->year_wrapup(f); }
    
    // return the pnv for the current year, or -1 if none
    double pnv(const Age age) const { return pnvs[age][year()]; }
    // This is used for summary purposed only
    double pnv(const Age age, const int year) const {return pnvs[age][year];}
	void set_pnv(const Age age, const int year, const double val) {
		pnvs[age][year]=val; 
	}
    // ceiling data
    Bool non_ceilinged_fishery() const { return ceiling ? FALSE : TRUE; }
    Bool non_ceilinged_year() const
    { return (non_ceilinged_fishery() || ceiling->non_ceilinged_year())
      ? TRUE : FALSE; }
	const int is_ceilinged(){
		if(ceiling) return 1; return 0;}
    const int get_first_ceilinged_year(){
		return ceiling->get_first();}
    const int get_last_ceilinged_year(){
		return ceiling->get_last();}
    const double get_initial_base_catch(){
		return ceiling->get_initial_base_catch();}
    double get_initial_ratio(int year){
		return ceiling->get_initial_ratio(year);}
    unsigned int get_forced(int year){
		return ceiling->get_forced(year);}
	int set_forced(int year, unsigned int val){ if(ceiling)return ceiling->set_forced(year,val); return 0;}	
	int set_initial_ratio(int year, double val){ if(ceiling)return ceiling->set_initial_ratio(year,val); return 0;}	
	// these routines assume that a ceiling exists for this fishery,
    // AND that the current year is in range. 
    Bool forced_ceiling() const { return ceiling->forced_ceiling(); }
    double catch_ceiling(HarvestPhase phase) const
    { return ceiling->catch_ceiling(phase); }

    // return some cnr data for the current year, or 0 if none
    double sublegal_ratio(const Fishery& f) const
    { return (cnrs[year()] ? cnrs[year()]->sublegal_ratio(f) : 0); }
    double legal_ratio(const Fishery& f) const
    { return (cnrs[year()] ? cnrs[year()]->legal_ratio(f) : 0); }
    
    // parsing functions, psc style
    int read_default_pnvs(IOCrud *psc);
    int read_pnvs(IOCrud* psc, int first, int last);
    int read_cnrs(IOCrud* psc, int first, int last, double lsel, double slsel);
    int read_ceilings(IOCrud *, int, int, int, int, int *);
	
  private:
    // yearly pnvs
    HvAgeVec<double*> pnvs;
    
    // cnr data; array of size nyears()
    CNR** cnrs;
    
    // ceiling management; 0 if none for this fishery
    Ceiling *ceiling;
};

#endif
