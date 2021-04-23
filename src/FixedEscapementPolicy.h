// FixedEscapementPolicy.h  -  subclass of Policy

#ifndef FIXED_ESCAPEMENT_POLICY_H
#define FIXED_ESCAPEMENT_POLICY_H

// the FixedEscapementPolicy classes implement a fixed escapement
// management policy.  the behavior is the default in non-management
// years.  the Calendar class is a parent because of data needs (some
// input data varies by simulation year).  the abstract base class
// provides interface as well as some basic implementations.  the
// derived classes provide the specific versions of the ratio
// computation functions.
//
// the fishery list in the ctor is used to initialize the list in the
// policy class.  it is the the list of fisheries managed by this policy,
// i.e. in-river fisheries.
//
// the stocklist (from the ctor) specifies all stocks managed by this
// policy (i.e. in-river stocks).  this data is in the protected
// section for use by derived classes.  for proper operation, the
// stocks in the stocklist specified in the constructor must all be
// configured with appropriate data (using the FixedEscStock class).
// at the very least, this must provide the stock specific management
// idls for this policy.
//
// this class also generates (late initialization) and maintains a list of
// non-river fisheries, i.e. those which are not managed under this policy,
// but which still catch these fixed escapement stocks, possibly in the
// terminal phase.  this is also in the protected section for use by
// the subclasses.
//
// the implementation of this class assumes that river fisheries have
// little, or preferably no harvest in the preterm phase.  Specifically,
// only terminal harvests are recalculated during the river harvest phase.

#include <rw/tvvector.h>
#include <rw/tpordvec.h>
#include "AgeVec.h"
#include "FisheryList.h"
#include "StockList.h"
#include "Policy.h"
#include "Bool.h"

typedef RWTValVector<Bool> BoolVec;
typedef RWTValVector<double> DoubleVec;

// ctor takes fisheries and stock lists, and Bool vectors of
// management years and forced years.  these must be sized
// Calendar::nyears()

class FixedEscapementPolicy : public Policy, public Calendar {
  public:
    FixedEscapementPolicy(const FisheryList &fl, const StockList &sl,
			  const BoolVec &mgt, const BoolVec &forced);
    virtual ~FixedEscapementPolicy();

    // the harvest logical phases, in chronological order
    virtual void take_preterm_harvests() { Policy::take_preterm_harvests(); }
    virtual void take_terminal_harvests() {}   // term harv in river phase
    virtual void take_river_harvests();

  protected:
    virtual double compute_ratio() = 0;
    virtual double avg_hv_rate() = 0;
    void take_bounded_term_harvests();
    void take_initial_bounded_harvests();
    double adult_river_mort(const Stock &) const;
    double adult_river_mort(int i) const;
    double adult_fish_avail(const Stock &) const;
    double adult_fish_avail(int i) const;
    Bool management_on() const { return management_on_[year()]; }
    Bool forced_esc() const { return forced_esc_[year()]; }

    // data
    StockList slist;
    FisheryList non_river_flist;
    HvAgeVec<double> *fish_avail; // fish avail by stock by age
    
  private:
    double compute_newscale();
    void init_non_river_flist(); // late init fn

    Bool nr_flist_done;		// flag to perform late init
    BoolVec management_on_;	// years to manage
    BoolVec forced_esc_;	// which years to force escapement goal
};


// some derived classes which define the compute_ratio() routine

// this class specifies combined escapement goals for all stocks as
// a ctor argument.  size of the vector must be Calendar::nyears().

class FixedEscapementCombined : public FixedEscapementPolicy {
  public:
    FixedEscapementCombined(const FisheryList& fl, const StockList& sl,
			    const BoolVec& m, const BoolVec& f,
			    const DoubleVec& esc)
	: FixedEscapementPolicy(fl, sl, m, f), escapement_goals(esc)
	{}
    virtual ~FixedEscapementCombined() {}
    
  protected:
    // special ctor for use by derived classes only.  allows for null
    // initialization of escapement_goals vec, assuming that the derived
    // class will also override the escapement_goal() virtual fn.
    FixedEscapementCombined(const FisheryList& fl, const StockList& sl,
			    const BoolVec& m, const BoolVec& f)
	: FixedEscapementPolicy(fl, sl, m, f), escapement_goals(0)
	{}

    virtual double compute_ratio();
    virtual double avg_hv_rate();
    virtual double escapement_goal() const { return escapement_goals[year()]; }

  private:
    DoubleVec escapement_goals;	// combined stock esc goals by year
};


// this class assumes that individual stocks have configured escapement
// goals.

class FixedEscapementStrength : public FixedEscapementPolicy {
  public:
    enum FESType { STRONG, WEAK };
    
    FixedEscapementStrength(const FisheryList &fl, const StockList &sl,
			    const BoolVec &m, const BoolVec &f, FESType tp)
	: FixedEscapementPolicy(fl, sl, m, f), type(tp), strength_stock(0),
	this_year(-1) {}
    virtual ~FixedEscapementStrength() {}
    
  protected:
    virtual double compute_ratio();
    virtual double avg_hv_rate();

  private:
    double compute_stock_ratio(const Stock &);

    // data
    const FESType type;		// strong vs weak management
    Stock* strength_stock;	// last indicator stock identified
    int this_year;		// year in which indicator stock was identified
};


#endif
