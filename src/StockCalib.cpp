#include <iostream.h>
#include <math.h>
#include "Bool.h"
#include "StockCalib.h"
#include "globals.h"
#include "log.h"
#include "tokens.h"
#include "math.h"
			   
extern int SkipComment(FILE *);

Calibrator * 	StockCalib::Cal = NULL;
StockCalib *	StockCalib::prob_stock = NULL;
double 		StockCalib::big_prob = 0.0;
double 		StockCalib::biggest_prob = 0.0;
int 		StockCalib::prob_by = 0;

class EvDatYr
{
  public:
    virtual int read(FILE *fp) = 0;
    virtual double get_data(Age age) = 0;
    virtual double get_data() = 0;
    virtual short has_data() = 0;
};

class EvDat
{
  public:
    EvDat(StockCalib *s);
    int read(FILE *fp, int ev_type);

    int num_ev_yr() 	{ return numevyr; }
    int ev_yr()		{ return evyr; }
    Age st_age()	{ return stage; }
    int min_ages_ev()	{ return minagesev; }

    double get_data(Age age, int year) { return ev_dat[year]->get_data(age); }
    double get_data(int year) { return ev_dat[year]->get_data(); }

  protected:
    int numevyr;
    int evyr;
    Age stage;
    int minagesev;
    EvDatYr **ev_dat;
    
    StockCalib *sc;
};

class ModelDat
{
  public:
    ModelDat(StockCalib *s) : sc(s) {}
    virtual int read(FILE *) { return 0;}
    virtual double get_data(Age age, int year) = 0;
    virtual double get_tot_data(int year);
  protected:
    StockCalib *sc;
};

class EscDat :  public ModelDat
{
  public:
    EscDat(StockCalib *s) : ModelDat(s) {}
    virtual double get_data(Age age, int year);
};
class TermRunDat 	: public ModelDat
{
  public:
    TermRunDat(StockCalib *s) : ModelDat(s) {}
    virtual double get_data(Age age, int year);
};
class GSTCatchDat	: public ModelDat
{
  public:
    GSTCatchDat(StockCalib *s) : ModelDat(s) {}
    virtual double get_data(Age age, int year);
};
class CombinedDat	: public ModelDat
{
  public:
    CombinedDat(StockCalib *s)
	: ModelDat(s), comb_stocks(0), num_comb_stocks(0) {}
    virtual int read(FILE *fp);
    virtual double get_data(Age age, int year);
    
  private:
    int num_comb_stocks;
    StockCalib **comb_stocks;
};


double ModelDat::get_tot_data(int year)
{
    double val = 0.0;
    for (Age age = sc->ev_dat->st_age(); age <= age.top(); age++)
	val += get_data(age, year);
    return val;
}

double EscDat::get_data(Age age, int year)
{
    return sc->get_stock()->get_escapement(age, year);
}

double TermRunDat::get_data(Age age, int year)
{    
    return sc->get_stock()->get_true_term_run(age, year);
}

double GSTCatchDat::get_data(Age, int)
{
    return 0.0;
}    

int CombinedDat::read(FILE *fp)
{
    int erc = 0;
    char tmps[MAX_TOKEN_LEN];
    
    if ((fscanf(fp, "%d", &num_comb_stocks) != 1) || SkipComment(fp))
	erc++;
    else
    {
	comb_stocks = new StockCalib * [num_comb_stocks];
    assert(comb_stocks);
	comb_stocks[0] = sc;
	for (int i = 1; i < num_comb_stocks; i++)
	{
	    if ((fscanf(fp, " %[^,\n\t ]", tmps) != 1)
		|| SkipComment(fp))
		erc++;			
	    else
	    {
		StockCalib *stk_cal = ::Calib->find_stock_calib(tmps);
		if (stk_cal)
		{
		    stk_cal->set_ev_dat(sc->get_ev_dat());
		    stk_cal->set_model_dat(sc->get_model_dat());
		    comb_stocks[i] = stk_cal;
		    
		    if (sc->get_stock() == stk_cal->get_stock())
			::LogMsg(L_Warning, "Repeat of Primary stock"
				 " in ev_data/Stock#=%s", tmps);
		}
		else
		    :: LogMsg(L_Error,
			      "Unable to match stock in ev_data"
			      " file/Stock#=%d", tmps);
	    }
	}
    }
    return erc;
}

double CombinedDat::get_data(Age age, int year)
{
    double val = 0.0;
    for (int i = 0; i < num_comb_stocks; i++)
	//..... Hardwire in special exemption for WCVI stock
	// CHANGE TO START ADDING IN 1985  (huh?) %%%
	if (!(!strcmp(sc->get_stock()->get_abbrv(), "RBH")
	      && (year < 5) && (i > 0)))
	    val += comb_stocks[i]->get_stock()->get_true_term_run(age, year);
    return val;
}

class AgeEvDatYr : public EvDatYr
{
  public:
    AgeEvDatYr(EvDat *d);
    int read(FILE *fp);
    double get_data(Age age);
    double get_data();
    short has_data()
    {
	for(int i=0; i < (evd->st_age().top() - evd->st_age()); i++)
	    if (ev_data[i]) return 1;
	return 0;
    }

  private:
    double *ev_data;
    EvDat *evd;
};

AgeEvDatYr::AgeEvDatYr(EvDat *d)
: evd(d)
{
    ev_data = new double [evd->st_age().top() - evd->st_age() + 1];
    assert (ev_data);
}

int AgeEvDatYr::read(FILE *fp)
{
    int erc = 0;
    for (Age age = evd->st_age(); age <= age.top(); age++)
	if (fscanf(fp, " , %lf", &ev_data[age - evd->st_age()]) != 1)
	    erc++;
    SkipComment(fp);

    return erc;
}

double AgeEvDatYr::get_data(Age age)
{
    return ev_data[age - evd->st_age()];
}

double AgeEvDatYr::get_data()
{
    double tot = 0;
    for (Age age = evd->st_age(); age <= age.top(); age++)
	tot += ev_data[age - evd->st_age()];
    return tot;
}

class AgelessEvDatYr : public EvDatYr
{
  public:
    AgelessEvDatYr(EvDat *d, ModelDat *m, int y);
    int read(FILE *fp);

    double get_data(Age age);
    double get_data();
    short has_data() { return (ev_dat > 0.0); }

  private:
    double ev_dat;
    EvDat *evd;
    ModelDat *md;
    int year;
};

AgelessEvDatYr::AgelessEvDatYr(EvDat *d, ModelDat *m, int y)
: evd(d), md(m), year(y)
{}

int AgelessEvDatYr::read(FILE *fp)
{
    int erc = 0;
    
    if (fscanf(fp, ",%lf", &ev_dat) != 1)
	erc++;
    SkipComment(fp);

    return erc;
}

double AgelessEvDatYr::get_data(Age age)
{
    return ev_dat * md->get_data(age, year) / md->get_tot_data(year);
}

double AgelessEvDatYr::get_data()
{
    return ev_dat;
}

EvDat::EvDat(StockCalib *s)
:sc(s)
{
    ev_dat = new EvDatYr * [::Chronographer->nyears()];
    assert (ev_dat);
}

int EvDat::read(FILE *fp, int ev_type)
{
    int erc = 0;
    int int_age;

    if (ev_type > 0)
	if ((fscanf(fp, "%d", &int_age) != 1) || SkipComment(fp)
	    || (fscanf(fp, "%d", &minagesev) != 1) || SkipComment(fp))
	    erc++;
	else
	    stage.assign_from_int(int_age);
    for (int year = 0; year < ::Chronographer->nyears(); year++)
    {
	int yr, pnt_temp;
	if ((fscanf(fp, "%d", &yr) != 1)
	    || ((::Calib->get_first_ev_year() + year) != yr))
	{
	    erc++;
	    ::LogMsg(L_Error,
		     "Incorrect year match in ev_data file/Stock#=%s.\n",
		     sc->get_stock()->get_abbrv());
	}
	else if (fscanf(fp, ",%d", &pnt_temp) != 1)
	    erc++;
	else
	{
	    if (pnt_temp)
		ev_dat[year] = new AgeEvDatYr(this);
	    else
		ev_dat[year] = new AgelessEvDatYr(this, sc->model_dat, year);
	    erc += ev_dat[year]->read(fp);
	}
    }

    evyr = 0;
    //..... Step backwards to find last year of data
    for (year = ::Chronographer->nyears()-1; !evyr && (year >= 0); year--)
	for (Age age = st_age(); age <= age.top(); age++)
	    if (ev_dat[year]->has_data())
	    {
		evyr = year;
		break;
	    }
    

    //..... Calculate the # of brood years to be fitted:
    //..... Must be decreased by the min # of ages to be fitted as well
    //..... (See notes dated Jan. ??, 1990)
    numevyr = evyr - stage - (minagesev - 1);

    return erc;
}


StockCalib::StockCalib(Stock *s)
: stk_mat(0), num_mat_sched(0),
  model_dat(0), stock(s), ev_dat(0)

{
    if (!(ratios = new double  [::Chronographer->nyears()])
	|| !(brd_yr_flg = new int [::Chronographer->nyears()]))
	
	LogMsg(L_Fatal, "Memory exhausted in StockCalib::calc_ev()\n");
}

StockCalib::~StockCalib()
{
    delete [] brd_yr_flg;
    delete [] ratios;
    delete [] ev_dat;
    delete model_dat;
}

double StockCalib::get_data(Age age, int year)
{
    return model_dat->get_data(age, year);
}

double StockCalib::model_data(Age age, int year)
{
    return model_dat->get_data(age, year);
}

void StockCalib::calc_ev(int num_iter)
{
    if (!model_dat) return;

    reset();
    compute_ratios();
    adjust_evs(num_iter);
    set_average_evs();
    
}

void StockCalib::reset()
{
    for (int year = Cal->get_first_ev_year();
	 year < ::Chronographer->nyears();  year++)
    {
	ratios[year] = 1.0;
	brd_yr_flg[year] = 0;
	for (Age age = ev_dat->st_age(); age <= age.top(); age++)
	{
	    // Flag brood years with ev_data
	    if ((year <= ev_dat->num_ev_yr())
		&& (ev_dat->get_data(age, year + age)))
	    {
		brd_yr_flg[year] = 1;
		break;
	    }
	}
    }
}


double StockCalib::avg_ratio(Age age)
{
    double ret_val = 0;

    for (int brd_yr = Cal->get_first_ev_year(); brd_yr <= ev_dat->num_ev_yr();
	 brd_yr++)
    {
	// Store calibration data in temporary variable
	double temp_ev = ev_dat->get_data(age, brd_yr + age);
	if (temp_ev)
	{
	    // Data specified for fitting store corresponding model
	    // estimate in temporary variable
	    double temp_mod = model_dat->get_data(age, brd_yr + age);
	    if (temp_mod > 0)
		ret_val += temp_ev / temp_mod;
	}	
    }

    if (ev_dat->num_ev_yr() >= Cal->get_first_ev_year())
	return ret_val / (ev_dat->num_ev_yr() - Cal->get_first_ev_year() + 1);
    else
	return 1;
}

void StockCalib::calc_mr()
{
    switch (stk_mat)
    {
	// Apparently you compute new aeqs iff the last cal year's mr changes.
      case 1:
	check_mat_rate(AGE3);
	if (check_mat_rate(AGE4))
	    compute_aeqs(AGE4);
	break;
      case 3:
	if (check_mat_rate(AGE3))
	    compute_aeqs(AGE3);
	break;
      case 4:
	if (check_mat_rate(AGE4))
	    compute_aeqs(AGE4);
	break;
    }
}

int StockCalib::check_mat_rate(Age age)
{
    double avg_rat = avg_ratio(age);
    if (fabs(1 - avg_rat) > Cal->get_conv_tolerance())
    {
//	Cal->set_converged(FALSE);

	// For stocks not in the .mat file, all years get same val for an age.
#ifdef DEBUG
	if (stock_mon())
	    cout << "Old MR: " << stock->maturation_rate(0, age);
#endif	
	double new_mr = stock->maturation_rate(0, age) * avg_rat;
	new_mr = (new_mr > 1.0) ? 1.0 : new_mr;
	    for (int year = 0; year < ::Chronographer->nyears(); year++)
		stock->set_maturation_rate(year, age, new_mr);
#ifdef DEBUG
	if (stock_mon())
	    cout << " New: " << new_mr << endl;
#endif	
	return 1;
    }
    return 0;
}

void StockCalib::compute_aeqs(Age age)
{
    //..... Compute Adult Equivalence Factors
    for (; age >= 2; age--)
    {
	double new_mr = stock->maturation_rate(0, age);
	age++;
	double new_aeq = new_mr +
	    (1-new_mr) * stock->get_surv_rt(age) * stock->get_adult_eq(age, 0);
	age--;
#ifdef DEBUG
	if (stock_mon())
	{	
	    cout << "Age: " << age.string();
	    cout << " New MR: " << new_mr;
	    cout << " surv_rt: " << stock->get_surv_rt(age);
	    cout << "Old aeq: " << stock->get_adult_eq(age, 0);
	    cout << "New aeq: " << new_aeq << endl;
	}
#endif	
	for (int year = 0; year < ::Chronographer->nyears(); year++)
	    stock->set_adult_eq(year, age, new_aeq);
    }
}
void StockCalib::compute_ratios()
{
    double sum_model, sum_comp, temp_ev, temp_mod;
    
    //..... Compute ratios between calibration data and model estimates
    for (int brd_yr = Cal->get_first_ev_year(); brd_yr <= ev_dat->num_ev_yr();
	 brd_yr++)
    {
	sum_model = sum_comp = 0.0;
	for (Age age = ev_dat->st_age();
	     (age <= age.top()) && ((brd_yr + age) <= ev_dat->ev_yr());
	     age++)
	{
	    int year = brd_yr + age;
	    // Store calibration data in temporary variable
	    temp_ev = ev_dat->get_data(age, year);

	    if (temp_ev)
	    {
		// Data specified for fitting store corresponding model
		// estimate in temporary variable
		temp_mod = model_dat->get_data(age, year);
		// accumulate model data for comparison with calibration
		sum_model += temp_mod;
		// check if age-specific data are specified
		sum_comp += temp_ev;
	    }
	}

	if ((sum_model > 0) && (sum_comp > 0))
	    ratios[brd_yr] = sum_comp / sum_model;

#ifdef DEBUG
	if (stock_mon())
	    cout << "SM =  " << sum_model << "  SC = " << sum_comp << endl;
#endif
    }
}

void StockCalib::adjust_evs(int num_iter)
{
    //..... Adjust EV Scalars
    for (int brd_yr = Cal->get_first_ev_year(); brd_yr <= ev_dat->num_ev_yr();
	 brd_yr++)
	if ((Cal->is_ev_estimate_year(brd_yr, num_iter))
	    && brd_yr_flg[brd_yr])
	    adjust_ev(brd_yr);
}

void StockCalib::adjust_ev(int brd_yr)
{
    double tmp = get_ev(brd_yr);
    set_ev(brd_yr, ratios[brd_yr] * tmp);

    if (tmp > Cal->get_min_ev())
    {
	double conv_check;
	//..... Convergence check
	if (Cal->get_calibration_test())
	    conv_check = (1 - ratios[brd_yr]);
	else
	    conv_check = (1 - ratios[brd_yr]) * tmp;
	
	conv_check = fabs(conv_check);
	
	// %%% Only check the ones we're adjusting this pass?
	if ((get_ev(brd_yr) > Cal->get_min_ev()) &&
	    (conv_check > Cal->get_conv_tolerance()))
	{
	    Cal->set_converged(FALSE);
	    if (conv_check > biggest_prob)
	    {
		big_prob = ratios[brd_yr];
		biggest_prob = conv_check;
		prob_stock = this;
		prob_by = brd_yr + 79; // %%% Why is 79 hardcoded?
	    }
	}
    }
}

void StockCalib::set_average_evs()
{
    //..... Set EVs to Average for indicated brood years
    double avg_ev = average_ev();
    for (int brd_yr = 0; brd_yr <= ev_dat->num_ev_yr(); brd_yr++)
	if (!brd_yr_flg[brd_yr])
	    set_ev(brd_yr, avg_ev);

    //.....Set EVs to average for all years after the last one to be estimated
    for (brd_yr = ev_dat->num_ev_yr() + 1; brd_yr < ::Chronographer->nyears(); brd_yr++)
	set_ev(brd_yr, avg_ev);
}

//..... Compute average EV
double StockCalib::average_ev()
{
    double sum = 0.0;
    int num = 0;

    for (int brd_yr = Cal->get_first_ev_year(); brd_yr <= ev_dat->num_ev_yr();
	 brd_yr++)
	if ((brd_yr_flg[brd_yr]) && (get_ev(brd_yr) > Cal->get_min_ev()))
	{
	    sum += get_ev(brd_yr);
	    num++;
	}

    if (num)
	return sum / (double) num;
    else
	return 1.0;
}

int StockCalib::read_ev_data(FILE *fp)
{
    int erc = 0;
    int ev_type;
    
    ev_dat = new EvDat(this);
    assert (ev_dat);

    if ((fscanf(fp, "%d", &stk_mat) != 1) || SkipComment(fp)
	|| (fscanf(fp, "%d", &ev_type) != 1) || SkipComment(fp))
	erc++;
    else
	switch (ev_type)
	{
	  case 1:
	    model_dat = new EscDat(this);
	    break;
	  case 2:
	    model_dat = new TermRunDat(this);
	    break;
	  case 3:
	    model_dat = new GSTCatchDat(this);
	    break;
	  case 4:
	    model_dat = new CombinedDat(this);
	    model_dat->read(fp);
	    break;
	  default:
	    ::LogMsg(L_Error,
		     "Bad EV Type for stock %s.\n", stock->get_abbrv());
	    break;
	}
    
    ev_dat->read(fp, ev_type);
    
    return erc;
}

void StockCalib::write_evo(FILE *fp)
{
    for (int year = 0; year < ::Chronographer->nyears(); year++)
	fprintf(fp, " %.9E ", get_ev(year));
}

// Write convergence info on the latest pass . . .
void StockCalib::write_results()
{
    if (!prob_stock)
    {
	cout << "Calibration complete.." << endl;
	return;
    }
    cout << "WORST PROB: Brood year=" << prob_by
	<< " Stock=" << prob_stock->stock->get_abbrv();
    cout << " ratio="    << big_prob
	<< " convergence test result="    << biggest_prob
	<< endl;
}

void StockCalib::end_iteration()
{
    write_results();
    
    prob_stock = NULL;
    big_prob = 0.0;
    biggest_prob = 0.0;
    prob_by = 0;
}

