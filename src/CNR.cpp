// CNR base class and subclass implementations


#include "CNR.h"
#include "Fishery.h"
#include "log.h"
#include "cnrVisitor.h"

// Harvest Ratio (RT) methods
//   these use relative harvest rates from the fishery, as computed by
//   the ceiling management routines.


void CNR_HarvestRatio::accept(cnrVisitor& v){
  v.Visit(this);
}

double CNR_HarvestRatio::sublegal_ratio(const Fishery& f) const
{
    double rel_hr = f.rel_hr();
    
    if (rel_hr == 0)
    {
	LogMsg(L_Warning, "relative harvest rate = 0.0 in fishery %s,"
	       "\n\tCNR computations will be inaccurate.",
	       f.get_name());
	return 0;
    }

    return (sublegal_sel * (1.0 - rel_hr) / rel_hr);
}

double CNR_HarvestRatio::legal_ratio(const Fishery& f) const
{
    double rel_hr = f.rel_hr();
    
    if (rel_hr == 0)
    {
	LogMsg(L_Warning, "relative harvest rate = 0.0 in fishery %s,"
	       "\n\tCNR computations will be inaccurate.",
	       f.get_name());
	return 0;
    }

    return (legal_sel * (1.0 - rel_hr) / rel_hr);
}


//Wild Ass Guess Method

void CNR_WildAssGuess::accept(cnrVisitor& v){
  v.Visit(this);
}

double CNR_WildAssGuess::sublegal_ratio(const Fishery& f) const
{
    return (sublegal_sel*((1.0-cnr_season_fraction)/cnr_season_fraction));
}

double CNR_WildAssGuess::legal_ratio(const Fishery& f) const
{
    return    (legal_sel*((1.0-cnr_season_fraction)/cnr_season_fraction));
}

// Season Length method
void CNR_SeasonLength::accept(cnrVisitor& v){
  v.Visit(this);
}

double CNR_SeasonLength::sublegal_ratio(const Fishery& ) const
{
    return (sublegal_sel * (cnr_season_len / legal_season_len));
}

double CNR_SeasonLength::legal_ratio(const Fishery& ) const
{
    return (legal_sel * (cnr_season_len / legal_season_len));
}


// Reported Encounter method
//   this uses the encounter rate as computed in the shaker calculations

void CNR_ReportedEncounter::accept(cnrVisitor& v){
  v.Visit(this);
}

double CNR_ReportedEncounter::sublegal_ratio(const Fishery& f) const
{
    return (f.encounter_rt() ?
	    rpt_sublegal_enc / (f.encounter_rt() * rpt_catch) : 0.0);
}

double CNR_ReportedEncounter::legal_ratio(const Fishery& ) const
{
    return (rpt_legal_enc / rpt_catch);
}



