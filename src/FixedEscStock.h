// FixedEscStock stores the stock specific data for the fixed
// escapement policy.  the StockConfig object in each stock contains a
// handle to one of these, if fixed escapement is configured for that
// stock.
//
// this class always contains the management idls for the stock, and
// may contain individual escapement goals (if operating under a strength
// policy.)  the actual data is read in from file.

#ifndef FIXED_ESC_STOCK_H
#define FIXED_ESC_STOCK_H

#include <rw/tvvector.h>
#include "Bool.h"		// redefine rogue's Bool
#include "Calendar.h"

// stock specific data for the fixed escapement management policy.
// ctor takes vector of doubles size Calendar::nyears() specifying
// management idls.  optionally takes another similar vector of
// escapement goals, for use in strong/weak management scenarios.

typedef RWTValVector<double> DoubleVec;

class FixedEscStock : public Calendar {
  public:
    FixedEscStock(const DoubleVec& m_idls) : management_idls(m_idls) {}
    FixedEscStock(const DoubleVec& m_idls, const DoubleVec& esc)
	: management_idls(m_idls), escapement_goals(esc) {}

    // default copy ctor is adequate
    
    ~FixedEscStock() {}

    double management_idl() const
	{ return management_idls[year()]; }
    double escapement_goal() const
	{ return escapement_goals.length() ? escapement_goals[year()] : 0; }

  private:
    DoubleVec management_idls;
    DoubleVec escapement_goals;
};


#endif
