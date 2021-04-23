//#ifdef _GUI_
#include <iostream.h>

#include "IOCrud.h"
#include "Calibrator.h"
#include "StockCalib.h"
#include "strtools.h"
#include "globals.h"
#include "log.h"

// %%% means I need to check this for accuracy later.

Calibrator::Calibrator()
: conv_flag(FALSE), conv_tolerance(.05), max_iter(100), min_ev(.01),
  stock_calibs(0)
{
    StockCalib::set_Cal(this);
}

void Calibrator::set_file_prefix(const char *prefix)
{
    file_prefix = new char [strlen(prefix) + 1];
    assert(file_prefix);
    strcpy(file_prefix, prefix);
}
    
void Calibrator::calibrate() 
{
    extern void RunTheModel();
    
    int old_prec = cout.precision();
    cout.precision(4);
    cout.setf(ios::fixed,ios::fixed);
    
    for (int iter = 0; (iter < max_iter) && !conv_flag; iter++)
    {
	cout << "	Iteration number: " << iter << endl;
	RunTheModel();
	calc_evs(iter);	// We have to calculate them to check for convergence.
	if (!conv_flag)
	{
	    RunTheModel();
	    calc_mrs();
	}
	StockCalib::end_iteration();
    }

    cout.precision(old_prec);
    
    if (write_evo()) LogMsg(L_Error, "Couldn't write EVO file.\n");
}

int Calibrator::is_stock_mon(StockCalib *s)
{
    if (stock_monitor < 0) return 0;
    return (s == &stock_calibs[stock_monitor]);
}


int Calibrator::init_files()
{
    extern int open_outfile(FILE *&fp, const char *fn);
    char fn[MAX_TOKEN_LEN];

    sprintf(fn, "%sevs.rec", file_prefix);
    if (open_outfile(ev_hist, fn))
	return 1;

    sprintf(fn, "%sclb.rec", file_prefix);
    if (open_outfile(calib_hist, fn))
	return 1;

    sprintf(fn, "%shis.rec", file_prefix);
    if (open_outfile(intermed_evs, fn))
	return 1;

    fprintf(ev_hist, "%d", first_ev_year);
//    for (int i = 0; i < ::Stocks.num(); i++)
//	fprintf(ev_hist, "%d\t%d", i + 1, stock_calibs[i].get_num_evy());
    fprintf(ev_hist, "\n");

    fprintf(intermed_evs, "Date of EV Calculations: %s", "foo");
    fprintf(intermed_evs, "Time of EV Calculations: %s\n", "bar");
    fprintf(intermed_evs, "name of this run\n");

    return 0;
}


int Calibrator::read_opt_data(FILE *fp)
{
    extern int SkipComment(FILE *);
    // fp is opened .OPT file positioned at line 6a.
    int erc = 0;

    if ((fscanf(fp, "%d", &calibration_test) != 1) || SkipComment(fp)
	|| (fscanf(fp, "%d, %d", &calibration_pattern, &calibration_cycles)!=2)
	|| SkipComment(fp)
	|| (fscanf(fp, "%d", &stock_monitor) != 1) || SkipComment(fp)
	|| (fscanf(fp, "%d", &adj_mat_rate) != 1))
	erc++;
    else if ((adj_mat_rate > 0) && (SkipComment(fp) || (fscanf(fp, "%f", &adj_mat_min) != 1)))
	erc++;
    else if (SkipComment(fp))
	erc++;
    else if ((fscanf(fp, " %[^,\n\t ]", evfcast_fn) != 1) || SkipComment(fp))
	erc++;
#if 0
    else if ((fscanf(fp, "%d", &num_stock_scalar) != 1) || SkipComment(fp))
	erc++;
    else if ((num_stock_scalar > 0) &&
	     ((fscanf(fp, " %[^,\n\t ]", ev_est_fn) != 1)
	      ||SkipComment(fp)))
	erc++;
#endif
    
    switch(calibration_pattern)
    {
      case 1:
	calibration_cycles *= 2;
	break;
      case 2: case 3:
	calibration_cycles *= 3;
	break;
      case 4:
	calibration_cycles *= 4;
	break;
    }

    stock_monitor--;
    return erc;
}

// Purpose:  Reads data file for calibrating model.         
// Reads first_ev_year and mat_fn and calls StockCalib::read_ev_data()
// for stock specific stuff.
int Calibrator::read_ev_data(IOCrud *psc_config)
{
    extern int SkipComment(FILE *);
    int erc = 0;
    FILE *fp;
    char tmps[MAX_TOKEN_LEN];

    if ( ! (fp = fopen(evfcast_fn, "r")))
    {
	::LogMsg(L_Error, "cannot open evfcast file %s\n", evfcast_fn);
	fclose(fp);
	return 1;
    }
    
    if ((fscanf(fp, "%d", &first_ev_year) != 1) || SkipComment(fp)
	|| (fscanf(fp, " %[^,\n\t ]", tmps) != 1) ||SkipComment(fp))
    {
	::LogMsg(L_Error, "Error reading ev file header.\n");
	erc++;
    }
    else if (strcasecmp(tmps, "NONE"))	// if there is a msc file
	if (psc_config->read_mat_file(tmps))
	{
	    ::LogMsg(L_Error, "cannot scan mat file %s\n", tmps);
	    fclose(fp);
	    return 1;
	}


    stock_calibs = new StockCalib[::Stocks.num()];
    assert(stock_calibs);
    for (int i = 0; i < ::Stocks.num(); i++)
	stock_calibs[i].set_stock(&::Stocks[i]);

    while ((fscanf(fp, " %[^,\n\t ]", tmps) == 1) && !SkipComment(fp))
	for (int s = 0; s < ::Stocks.num(); s++)
	    if (!strcmp(::Stocks[s].get_abbrv(), tmps))
		if (stock_calibs[s].read_ev_data(fp))
		{
		    ::LogMsg(L_Error, "Error reading ev data for stock %s.\n",
			     ::Stocks[s].get_abbrv());
		    erc++;
		}
    
    fclose(fp);

    // Convert first_ev_year to simulation year it if needs it.
    // %%% 
    if (first_ev_year >= ::Chronographer->base_year())
	first_ev_year -= ::Chronographer->base_year();
    else if (first_ev_year >= (::Chronographer->base_year() - 1900))
	first_ev_year -= (::Chronographer->base_year() - 1900);

    return erc;
}

// Given calibration pattern and iteration number,
// do we adjust ev's this yr?
int Calibrator::is_ev_estimate_year(int brd_yr, int iteration)
{
    iteration += 1;  // we use count from 0 to < n, they go one to n.

    if (calibration_cycles && (iteration >= calibration_cycles))
	return 1;
    
    switch(calibration_pattern)
    {
      case 0:
	return 1;
      case 1:		// ..... Odd-Even
	return ((brd_yr % 2) == (iteration %2));
      case 2:               //..... iteration % 3; brd_yr % 2
	switch(iteration % 3)
	{
	  case 0:
	    return 1;
	  case 1:
	    return ((brd_yr % 2) == 1);
	  case 2:
	    return ((brd_yr % 2) == 0);
	}
	break;
      case 3:		//..... iteration % 3; brd_yr % 3
	return ((!(iteration % 3)) || ((iteration % 3)  == (brd_yr % 3)));
      case 4:		//..... iteration % 4; brd_yr % 3
	switch(iteration % 4)
	{
	  case 0:
	    return 1;
	  case 1:
	    return ((brd_yr % 3) == 1);
	  case 2:
	    return ((brd_yr % 3) == 2);
	  case 3:
	    return ((brd_yr % 3) == 0);
	}
    }
    return 0;
}

void Calibrator::calc_evs(int iteration)
{
    // Begin by assuming we've already converged, until in calc_ev we learn
    // otherwise.
    set_converged(TRUE);
    
    for (int s = 0; s < ::Stocks.num(); s++)
	stock_calibs[s].calc_ev(iteration);
}

void Calibrator::calc_mrs()
{
    for (int s = 0; s < ::Stocks.num(); s++)
	stock_calibs[s].calc_mr();
}

int Calibrator::write_evo()
{
    extern int open_outfile(FILE *&fp, const char *fn);
    char fn[MAX_TOKEN_LEN];
    FILE *fp;

    sprintf(fn, "%s.evo", file_prefix);
    if (open_outfile(fp, fn))
	return 1;
    
    fprintf(fp, " %d\n %d\n", ::Chronographer->base_year(),
	    ::Chronographer->base_year() + ::Chronographer->nyears() - 1);
    for (int i = 0; i < ::Stocks.num(); i++)
    {
	fprintf(fp, " %d", i+1);
	stock_calibs[i].write_evo(fp);
	fprintf(fp, "\n");
    }
    
    fclose(fp);
    return 0;
}

StockCalib *Calibrator::find_stock_calib(char *abbrv)
{
    for (int i = 0; i < ::Stocks.num(); i++)
	if (!strcmp(abbrv, ::Stocks[i].get_abbrv()))
	    return &stock_calibs[i];

    return NULL;
}
//#endif
