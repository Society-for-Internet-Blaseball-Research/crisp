// fishery class and related declarations

#ifndef FISHERY_H
#define FISHERY_H

//#include <fstream.h>
#include "Bool.h"
#include "Cohort.h"
#include "FisheryTactics.h"
#include "FisherySummary.h"
#include "HarvestList.h"
#include "Phase.h"
#include "Policies.h"

class IOCrud;
class FloatSliderDisplay;
class Stock;

class Fishery {
  friend class FisherySummary;
  friend class Fishery_UI;
    
  public:
    Fishery();
    ~Fishery() { delete name; delete abbrv; }

    // inits
    void set_term_net_age(Age age) { term_net_age = age; }
    void set_policy(Policies::PolicyType pt) { policy_type_ = pt; }
    void year_init(int year);
    
    // data access
    const char* get_name() const { return name; }
    Harvest *get_harvest(const Stock *stock) const;
    double pnv(Age age) const { return (tactics.pnv(age)); }
	double pnv(Age age, const int year) const { return (tactics.pnv(age, year)); }
	void set_pnv(const Age age, const int year, const double val) { tactics.set_pnv(age,year,val); }
	double pv(Age age) const { return 1.0 - pnv(age); }
    double pv(Age age, int year) const { return 1.0 - tactics.pnv(age, year); }
    Bool ocean_net() const { return ocn_net_flg; }
    const Age& get_term_net_age() const { return term_net_age; }
    double shak_mort_rt() const { return shaker_mort_rate; }
	const HarvestList &get_harvest_list() const { return hv_list; } 	
    

    Bool ismultiphase() const;
    const Policies::PolicyType policy_type() const
    { if (policy_type_ == Policies::CEILING && ismultiphase())
	return Policies::MULTI_CEILING;
      else
	return policy_type_;
    }

    // intermediate results data access

    // relative harvest rate is policy scalar, capped at 1.0, for CNRs
    double rel_hr() const
    { return (policy_scalar < 1.0) ? policy_scalar : 1.0; } 
    double encounter_rt() const { return encntr_rt; }	// current encounter rt
    double policy_hv_scalar() const { return policy_scalar; }
    double sublegal_ratio() const			// cnr sublegal ratio
    { return tactics.sublegal_ratio(*this); }
    double legal_ratio() const				// cnr legal ratio
    { return tactics.legal_ratio(*this); }
      
    // message methods
    void make_harvest_list(HarvestList& hvl);
    void set_shakers(HarvestPhase phase);
    void enforce_ceiling(HarvestPhase phase);
    Bool set_multi_ceiling_ratio();
    void year_wrapup() { tactics.year_wrapup(*this); results.end_year(); }
    void set_hv_scalar(double r) { policy_scalar = r; }
    void apply_hv_scalar(HarvestPhase phase);
    
    // results
    double get_preterm_catch(Age age, int year) const
    	{ return results.get_preterm_catch(age, year); }
    double get_term_catch(Age age, int year) const
    	{ return results.get_term_catch(age, year); }
    double get_total_catch(Age age, int year) const
    	{ return results.get_total_catch(age, year); }
    double get_total_catch(int year);
    double get_term_catch(int year);
    double get_preterm_catch(int year);
    
    double get_cnr_total_legal(int year) const
        { return results.get_total_legal_cnr(year); }
    double get_cnr_total_sublegal(int year) const
        { return results.get_total_sublegal_cnr(year); }
    double get_cnr_total(int year) const
        { return results.get_total_cnr(year); }

    double get_preterm_shakers(int year) const
        { return results.get_preterm_shakers(year); }
    double get_term_shakers(int year) const
        { return results.get_term_shakers(year); }

    double get_policy_hv_scalar(int year) const
        { return results.get_policy_hv_scalar(year); }
    
    double get_abundance_index(int year);

	//Ceiling accessor functions
	FisheryTactics *gui_get_tactics(void){ return &tactics; }

    // operators (for Rogue Wave)
    int operator==(const Fishery &rhs) const
	{ return (&rhs==this); }
    
    // parsing functions.  psc style (yuk) at the moment
    static int parse_net_age(IOCrud *);
    int parse_name_and_gear(IOCrud *);
    int parse_pnv(IOCrud *);
    int parse_ocn_net(IOCrud *);
    int parse_opt_pnvs(IOCrud *);
    int parse_cnrs(IOCrud *, int, int);
    int parse_clngs(IOCrud *, int, int, int, int, int *);

    static int parse_imrs(IOCrud *);
    
#ifdef DEBUG    
    // debugging fns
    void print_harvests();
#endif
    
private:
    char *name;
    char *abbrv;

    FisheryTactics tactics;	// tactics manager
    HarvestList hv_list;	// list of harvests for this fishery
    FisherySummary results;	//
    
    // gear types
    enum GearType { TROLL, NET, SPORT }; 	

    GearType gear;		// gear type
    Bool ocn_net_flg;		// ocean net fishery?
    Policies::PolicyType policy_type_;	// management policy 
    
    static Age term_net_age;    // age at which net fisheries are terminal
    
    // cohort characterisics
    double shaker_mort_rate;	// shaker mortality
    double encntr_rt;		// current encounter rate (computed)

    double policy_scalar;	// computed harvest scalar for policy management
};

    
#endif
