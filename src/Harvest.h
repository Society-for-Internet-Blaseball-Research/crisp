// harvest class declaration 

#ifndef HARVEST_H
#define HARVEST_H

#include "AgeVec.h"
#include "Cohort.h"
#include "Phase.h"
#include "HarvestTactics.h"
#include "HvSummary.h"
//#include "Fishery.h"
#include "Bool.h"

class Fishery;
class FloatSliderDisplay;
class Stock;
class IOCrud;

extern double get_total_harvest_rate(Harvest *);

// the Harvest class contains items items which are specific
// to both stock and fishery

class Harvest {
  friend class HvSummary;
  friend class Harvest_UI;
    
  public:
    // constructor, demands stock and fishery pointers
    Harvest(Stock *s, Fishery *f);
    
    //GROT - hv_rate kludge
    void funky_hv_reset(int year);

    void year_init(int year);	// initialize yearly data
    void year_wrapup() { results.end_year(); } // store yearly data
    Bool inactive() const;	// active harvest for all cohorts?
    Bool stock_match(const Stock *s) const
	{ return (s == stock ? TRUE : FALSE); }
    Bool fishery_match(const Fishery *f) const
	{ return (f == fish ? TRUE : FALSE); }
    const Stock* get_stock()	 const { return(stock); }
    const Fishery* get_fishery() const { return(fish); }

    // various ways to get the term_type
    Bool isterm() const		// strictly terminal harvest (all ages)?
    	{ return (term_type == ALL_TERM) ? TRUE : FALSE; }
    Bool ispreterm() const		// strictly preterm harvest?
    	{ return (term_type == ALL_PRETERM) ? TRUE : FALSE; }
    Bool ismultiphase() const		// mixed harvest phases?
    	{ return (term_type == MIXED) ? TRUE : FALSE; }
    HarvestPhase phase(Age age) const { return (isterm(age) ? TERM : PRETERM); }

    // messages
    void final_inits();
    void preterm_harvest();	// take preterminal harvests
    void terminal_harvest();	// take terminal harvests
    void bounded_terminal_harvest(); // new style harvesting
    void adjust_harvest(HarvestPhase ph, double scalar); // harvest adjustment
    void preterm_cnrs()  { set_cnrs(PRETERM); }	// incidental morts
    void terminal_cnrs() { set_cnrs(TERM); }
    void sum_reg_mort_in_stock() { sum_mort_in_stock(REGULAR); }
    void sum_special_mort_in_stock() { sum_mort_in_stock(SPECIAL); }

    // access intermediate results
    
	double hv_rate(Age age) const;

    double get_catch(HarvestPhase phase, Age age) const
    	{ return mdl_catch[phase][age]; }
    double get_catch(HarvestPhase phase) const; // total phase catch over ages
    double get_weighted_catch() const { return weighted_catch; }
    void   set_weighted_catch(double wc) { weighted_catch = wc; }
    void set_shakers(HarvestPhase phase, Age age, double shakes)
    	{ shakers[phase][age] = shakes; }
    double get_shakers(HarvestPhase phase, Age age) const
    	{ return shakers[phase][age]; }
    double get_cnrs(HarvestPhase phase, Age age) const
    	{ return cnr_sublegal_catch[phase][age]+cnr_legal_catch[phase][age]; }
    double get_phase_mort(HarvestPhase, Age age);
    void set_catchability(Age age, double val)
	{ catchability[age] = val; }
    double get_catchability(Age age) const
	{ return catchability[age]; }
    
    // access result data
    double get_preterm_catch(Age age, int year) const
    	{ return results.get_preterm_catch(age, year); }
    double get_term_catch(Age age, int year) const
    	{ return results.get_term_catch(age, year); }
    double get_total_catch(Age age, int year) const
    	{ return get_preterm_catch(age, year) + get_term_catch(age, year); } 
    double get_total_catch(int year) const;

    double get_cnr_sublegals(Age age, int year) const
    	{ return results.get_cnr_sublegals(PRETERM, age, year)
	  + results.get_cnr_sublegals(TERM, age, year);
      	}
    double get_cnr_legals(Age age, int year) const
    	{ return results.get_cnr_legals(PRETERM, age, year)
	  + results.get_cnr_legals(TERM, age, year);
      	}
    double get_cnr_preterm_sublegals(Age age, int year) const
        { return results.get_cnr_sublegals(PRETERM, age, year); }
    double get_cnr_term_sublegals(Age age, int year) const
        { return results.get_cnr_sublegals(TERM, age, year); }
    double get_cnr_preterm_legals(Age age, int year) const
        { return results.get_cnr_legals(PRETERM, age, year); }
    double get_cnr_term_legals(Age age, int year) const
        { return results.get_cnr_legals(TERM, age, year); }
    
    double get_preterm_shakers(Age age, int year) const
        { return results.get_preterm_shakers(age, year); }
    double get_term_shakers(Age age, int year) const
        { return results.get_term_shakers(age, year); }

    double get_abundance_index(int year) const;

    double get_total_harvest_rate() const;
    double get_base_harvest_rate(Age age) const
        { return harvest_rate[age]; }
	void set_base_harvest_rate(Age age, double val){ harvest_rate[age]=val; }

	HarvestTactics *gui_get_harvest_tactics(void){ return &tactics; }
    // public const
    static const double MAX_CATCHABILITY;	// maximum poisson catchability
    
    // parsing functions.  psc style (yuk) at the moment
    int parse_termpt(IOCrud *);
    int parse_hr(IOCrud *);
    int parse_fp(IOCrud *, int);
    
  private:
    enum MortType { REGULAR, SPECIAL };
    enum TermType { ALL_PRETERM, ALL_TERM, MIXED };

    // direct from external data
    Fishery *fish;		// fishery for this object
    Stock *stock;		// stock for this object
    Bool terminal;		// term flag from data; true==always term

    // contained classes
    HarvestTactics tactics;	// tactics manager for this harvest
    HvSummary results;		// yearly results
    
    // computed
    TermType term_type;		// preterm/term/mixed
    // cohort specific vars
    HvAgeVec<double> harvest_rate; // harvest rate
    HvAgeVec<double> mdl_catch[NUM_PHASES]; // catches; preterminal, term, etc.
    HvAgeVec<double> shakers[NUM_PHASES];   // shaker deaths
    double weighted_catch;	// really just a temp for shaker computation
    HvAgeVec<double> cnr_sublegal_catch[NUM_PHASES]; // sublegal incidentals
    HvAgeVec<double> cnr_legal_catch[NUM_PHASES];    // legal incidentals
    HvAgeVec<double> catchability; // poisson coeff for bounded harvest
    
    // private fns
    double get_preterm_abundance(int year) const;
    double get_term_abundance(int year) const;
    
    // determine if this is a terminal harvest for this cohort/fishery
	Bool isterm(Age age) const;	

    // sets the cnr morts for all ages this phase
    void set_cnrs(HarvestPhase ph);

    // sum the prterm morts, regular or special, into the stock
    void sum_mort_in_stock(MortType mt);
};


#endif    
