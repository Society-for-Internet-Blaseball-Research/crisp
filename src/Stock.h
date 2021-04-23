// stock class declarations

#ifndef STOCK_H
#define STOCK_H

#include <assert.h>
#include "AgeVec.h"
#include "Cohort.h"
#include "Phase.h"
#include "HarvestList.h"
#include "StockSummary.h"
#include "StockConfig.h"
#include "Production.h"

class IOCrud;
class MonteStockIntrfc;

class Stock {
  friend class StockSummary;
  friend class Stock_UI;
public:
    Stock();
    // at the moment stocks can't be copied - this fn satisfies RW classes
    Stock(const Stock&) : results(0) { assert(0); }
    ~Stock();
    
    // interface to data
    const char* get_name() const { return name; }
    const char* get_abbrv() const { return abbrv; }
    double get_cohort(Age age) const { return cohort[age]; }
    double get_term_run(Age age) const { return terminal_run[age]; }
    double get_adult_term_run() const;
    Age get_term_stats_age() const { return term_stats_age; }
    const HarvestList & get_harvest_list() const { return hv_list; }
    double escapement_goal() const { return config.escapement_goal(); }
    double management_idl() const { return config.management_idl(); }   
    
    void incr_reg_mort(Age age, double val) { regular_mort[age] += val; }
    void incr_special_mort(Age age, double val) { special_mort[age] += val; }
    void clear_special_morts()
    	{ special_mort = 0; }
    double inter_dam_loss() const	// inter-dam loss rate
        { return config.inter_dam_loss(); }
    double inter_dam_loss(int year) const   // For use w/ summaries.
        { return config.inter_dam_loss(year); } 
    double get_surv_rt(Age age) const { return surv_rt[age]; }
	double get_ev_scalars(int year) const
		{ return config.ev_scalar(year); }


	void gui_set_idl(const int year, const double val){
		config.gui_set_idl(year, val);
	}

    // Use these only for calibration.
    void calibrate_ev(int year, double val) { config.set_ev(year, val); }
    double ev_scalar(int year) const        { return config.ev_scalar(year); }

    double maturation_rate(int year, Age age) const 
        { return config.maturation_rate(year, age); }
    void set_maturation_rate(int year, Age age, double val)
        { config.set_maturation_rate(year, age, val); }
    void set_adult_eq(int year, Age age, double val)
        { config.set_adult_eq(year, age, val); }


    // interface to summary data
    double get_preterm_catch(Age age, int year) const
    	{ return results.get_preterm_catch(age, year); }
    double get_term_catch(Age age, int year) const
    	{ return results.get_term_catch(age, year); }
    double get_total_catch(Age age, int year) const
    	{ return results.get_total_catch(age, year); }
    double get_escapement(Age age, int year) const
    	{ return results.get_escapement(age, year); }
    double get_adult_escapement(int year) const;
    double get_abundance(Age age, int year) const
    	{ return results.get_abundance(age, year); }
    double get_cnr_sublegals(Age age, int year) const
    	{ return results.get_cnr_sublegals(age, year); }
    double get_cnr_legals(Age age, int year) const
    	{ return results.get_cnr_legals(age, year); }
    double get_term_run(Age age, int year) const
    	{ return results.get_term_run(age, year); }
    double get_river_catch(Age age, int year) const;
    double get_ocean_catch(Age age, int year) const;
    double get_true_term_run(Age age, int year);
    double get_ocn_adult_eq_hr1(int year);
    double get_ocn_adult_eq_hr2(int year);
    double get_tot_adult_eq_hr1(int year);
    double get_tot_adult_eq_hr2(int year);
    double get_adult_eq(Age age, int year) const
        { return config.adult_eq(age, year); }
	
	// So that we don't have a zillion accessor functions...
	Production *gui_get_production(){ return production; }
	
    MonteStockIntrfc* get_monte() const { return monte_carlo; }
    
    // actions
    void final_inits();		// data inits after reading most data
    void make_harvest_list(HarvestList& hvl);
    void year_init(int year);	// initialize yearly data
    void year_wrapup() { results.end_year(); } // stash year-end data
    void ocean_mortality();	// take ocean mortalities (update cohort)
    void maturate();		// cause maturation; compute terminal run
    void update_cohort_from_harvests();	// preterm morts and term run update
    void set_escapement();	// compute pre-idl escapements by age
    void apply_idls();		// apply idls to escapements
    void age_cohorts(double age1);	// age all cohorts for next model year
    void add_ev_scalars(double *evs)	// add the ev scalars in the config
	{ config.add_ev_scalars(evs); }
    void add_fixed_escapement(const FixedEscStock &fes) // add fixed escapement
	{ config.add_fixed_escapement(fes); }
    void add_production_enhancement(double *s_prod, double e_parm,
				    double s_age1, double e_prop)
	{ production->add_enhancement(s_prod, e_parm, s_age1, e_prop); }

    // spawn() returns new age1 cohort.  escapement is a precondition.
    double spawn() { return(production->spawn(adult_escp()) * ev_scalar()); }	
	
    // parsing functions.  psc style (yuk) at the moment
    int parse_hunk(IOCrud *);
    int parse_adult_eqs(IOCrud *, int);
    int parse_maturation_rates(IOCrud *, int);
    int parse_opt_idls(IOCrud *, int, int);
    static int parse_term_stats_age(IOCrud *);
	static int parse_surv_rt(IOCrud *);

    // operators
    // op= and op== for Rogue Wave
    Stock& operator=(const Stock &)
	{ assert(0); return *this; } // disabled
    int operator==(const Stock &rhs) const
	{ return (&rhs==this); }
    
#ifdef DEBUG    
    // debugging fns
    void print_harvests();
#endif    

private:
    char *name;
    char *abbrv;

    HarvestList hv_list;		// harvests for this stock
    StockSummary results;		// yearly data storage
    StockConfig config;			// miscellaneous config objects
    Production *production;		// production config
    MonteStockIntrfc* monte_carlo;	// monte carlo interface
    
    static Age term_stats_age;
    double scale2to1;			// computes initial age 1 abundance

    double ev_scalar() const		// ev_scalar
       { return config.ev_scalar(); }
    double maturation_rate(Age age) const 	// maturation rate
       { return config.maturation_rate(age); }

    double get_total_pre_idl_esc(int year) const;
    double get_term_ocn_cat(Age age, int year);
    double get_ocn_adult_eq_catch(int year);
    double get_term_adult_eq_catch(int year);
    double get_exp_denom1(int year);
    double get_exp_denom2(int year);

    // cohort specific vars - note some for all ages, others harvest only
    // these first few don't change once initialized
    static AgeVec<double> surv_rt; 	// survival rate
    AgeVec<double> initial_cohort;	// initial cohort sizes

    // other results by cohort - most are for harvestable ages only
    AgeVec<double> cohort; 		// ocean abundance
    HvAgeVec<double> terminal_run;	// terminal run size
    HvAgeVec<double> catches[NUM_PHASES];	// terminal catch
    HvAgeVec<double> regular_mort;	// regular mortality, preterm only
    HvAgeVec<double> special_mort;	// special mortality, preterm only
    HvAgeVec<double> escapement;	// escapements

    double adult_escp();		// compute total adult escapement
};


#endif
