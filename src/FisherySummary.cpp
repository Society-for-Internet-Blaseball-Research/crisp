// StockSummary.cc - implementations

#include "Fishery.h"
#include "FisherySummary.h"
#include "HarvestList.h"
#include "Harvest.h"

// report total preterminal catch for an age and year.  since these are kept
// in the harvest summaries, we must access those for this fishery.

double FisherySummary::get_preterm_catch(Age age, int year) const
{
    double total = 0;
    for (Harvest *hv = fishery->hv_list.head();hv;hv = fishery->hv_list.next())
	total += hv->get_preterm_catch(age, year);
    return total;
}

// report total terminal catch for an age and year.  since these are kept
// in the harvest summaries, we must access those for this fishery.

double FisherySummary::get_term_catch(Age age, int year) const
{
    double total = 0;
    for (Harvest *hv = fishery->hv_list.head();hv;hv = fishery->hv_list.next())
	total += hv->get_term_catch(age, year);
    return total;
}

double FisherySummary::get_preterm_shakers(Age age, int year) const
{
    double total = 0;
    for (Harvest *hv = fishery->hv_list.head();hv;hv =fishery->hv_list.next())
	total += hv->get_preterm_shakers(age, year);
    return total;
}

double FisherySummary::get_term_shakers(Age age, int year) const
{
    double total = 0;
    for (Harvest *hv = fishery->hv_list.head();hv;hv =fishery->hv_list.next())
	total += hv->get_term_shakers(age, year);
    return total;
}

double FisherySummary::get_preterm_shakers(int year) const
{
    double total = 0;
    for (Harvest *hv = fishery->hv_list.head();hv;hv =fishery->hv_list.next())
	for (Age age = FIRST_HV_AGE; age <= age.top(); age++)
	    total += hv->get_preterm_shakers(age, year);
    return total;
}

double FisherySummary::get_term_shakers(int year) const
{
    double total = 0;
    for (Harvest *hv = fishery->hv_list.head();hv;hv =fishery->hv_list.next())
	for (Age age = FIRST_HV_AGE; age <= age.top(); age++)
	    total += hv->get_term_shakers(age, year);
    return total;
}

double FisherySummary::get_total_legal_cnr(int year) const
{
    double total = 0;
    for (Harvest *hv = fishery->hv_list.head();hv;hv =fishery->hv_list.next())
	for (Age age = FIRST_HV_AGE; age <= age.top(); age++)
	    total += hv->get_cnr_legals(age, year);
    return total;
}

double FisherySummary::get_total_sublegal_cnr(int year) const
{
    double total = 0;
    for (Harvest *hv = fishery->hv_list.head();hv;hv =fishery->hv_list.next())
	for (Age age = FIRST_HV_AGE; age <= age.top(); age++)
	    total += hv->get_cnr_sublegals(age, year);
    return total;
}
    
double FisherySummary::get_total_cnr(int year) const
{
    double total = 0;
    for (Harvest *hv = fishery->hv_list.head();hv;hv =fishery->hv_list.next())
	for (Age age = FIRST_HV_AGE; age <= age.top(); age++)
	    total += hv->get_cnr_legals(age, year)
		+ hv->get_cnr_sublegals(age, year);
    return total;
}

double FisherySummary::get_abundance_index(int year) const
{
    double total = 0;
    for (Harvest *hv = fishery->hv_list.head();hv;hv =fishery->hv_list.next())
	total += hv->get_abundance_index(year);
    return total;
}

double FisherySummary::get_policy_hv_scalar(int year) const
{
    return policy_scalars[year];
}

// Stash year end results.
void FisherySummary::end_year()
{
    policy_scalars[year()] = fishery->policy_scalar;
}

/* Constructors and destructors.
 */
FisherySummary::FisherySummary(Fishery* f) : fishery(f)
{
    policy_scalars = new double [nyears()];
    assert(policy_scalars);
    for (int i = 0; i < nyears(); i++)
	policy_scalars[i] = 0.0;
}

FisherySummary::FisherySummary()
{
    policy_scalars = new double [nyears()];
    assert(policy_scalars);
    for (int i = 0; i < nyears(); i++)
	policy_scalars[i] = 0.0;
}

FisherySummary::~FisherySummary()
{
    delete [] policy_scalars;
}
