// StockSummary.cc - implementations
#include "strtools.h"
#include "Stock.h"
#include "StockSummary.h"
#include "HarvestList.h"
#include "Harvest.h"

// ctor

StockSummary::StockSummary(Stock* s) : stock(s)
{
    // escapements and term runs are type HvAgeVec 
    for (Age age=escapements.mindex(); age <= escapements.maxdex(); ++age)
    {
	escapements[age] = (double *) new double[nyears()];
	assert(escapements[age]);
	terminal_run[age] = (double *) new double[nyears()];
	assert(terminal_run[age]);
	strzero((char *) escapements[age], sizeof(double) * nyears());
	strzero((char *) terminal_run[age], sizeof(double) * nyears());
    }
    // abundances is an AgeVec
    for (age=abundances.mindex(); age <= abundances.maxdex(); ++age){
	abundances[age]  = (double *) new double[nyears()];
	assert(abundances[age]);
    }
}

StockSummary::~StockSummary()
{
    for (Age age=escapements.mindex(); age <= escapements.maxdex(); ++age)
    {
	delete [] escapements[age];
	delete [] terminal_run[age];
    }
    for (age=abundances.mindex(); age <= abundances.maxdex(); ++age)
	delete [] abundances[age];
}

// stash abundances at the start of the year

void StockSummary::start_year()
{
    for (Age age=abundances.mindex(); age <= abundances.maxdex(); ++age)
    {
	abundances[age][year()]  = stock->cohort[age];
    }
}

// stash year end results

void StockSummary::end_year()
{
    for (Age age=escapements.mindex(); age <= escapements.maxdex(); ++age)
    {
	escapements[age][year()] = stock->escapement[age];
	terminal_run[age][year()] = stock->terminal_run[age];
    }
}

// report total preterminal catch for an age and year.  since these are kept
// in the harvest summaries, we must access those for this stock.

double StockSummary::get_preterm_catch(Age age, int year) const
{
    double total = 0;
    for (Harvest *hv = stock->hv_list.head(); hv; hv = stock->hv_list.next())
	total += hv->get_preterm_catch(age, year);
    return total;
}

// report total terminal catch for an age and year.  since these are kept
// in the harvest summaries, we must access those for this stock.

double StockSummary::get_term_catch(Age age, int year) const
{
    double total = 0;
    for (Harvest *hv = stock->hv_list.head(); hv; hv = stock->hv_list.next())
	total += hv->get_term_catch(age, year);
    return total;
}

// report total sublegal cnrs for an age and year.  since these are kept
// in the harvest summaries, we must access those for this stock.

double StockSummary::get_cnr_sublegals(Age age, int year) const
{
    double total = 0;
    for (Harvest *hv = stock->hv_list.head(); hv; hv = stock->hv_list.next())
	total += hv->get_cnr_sublegals(age, year);
    return total;
}

// report total legal cnrs for an age and year.  since these are kept
// in the harvest summaries, we must access those for this stock.

double StockSummary::get_cnr_legals(Age age, int year) const
{
    double total = 0;
    for (Harvest *hv = stock->hv_list.head(); hv; hv = stock->hv_list.next())
	total += hv->get_cnr_legals(age, year);
    return total;
}

// report escapement summed over harvestable ages, by year

double StockSummary::get_escapement(int year) const
{
    double total = 0;
    for (Age age = FIRST_HV_AGE; age <= age.top(); ++age)
	total += escapements[age][year];
    return total;
}    

// report adult escapement, by year

double StockSummary::get_adult_escapement(int year) const
{
    double total = 0;
    for (Age age = ADULT_AGE; age <= age.top(); ++age)
	total += escapements[age][year];
    return total;
}    
