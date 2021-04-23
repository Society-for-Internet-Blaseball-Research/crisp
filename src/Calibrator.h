#ifndef CALIBRATOR_H
#define CALIBRATOR_H

#include <stdio.h>
#include "tokens.h"
#include "Bool.h"

class StockCalib;
class IOCrud;

class Calibrator
{
  public:
    Calibrator();
    void set_file_prefix(const char *prefix);
    void calibrate();

    // PreCondition: fp is .opt file open at line 6a.
    int read_opt_data(FILE *fp);
    int read_ev_data(IOCrud *psc_config);	// reads file evfcast_fn.

    void set_converged(Bool c) 	{ conv_flag = c; }

    int is_ev_estimate_year(int year, int interation);  // est ev's this it,yr?
    int is_stock_mon(StockCalib *);	// Is parameter the stock monitor?

    int get_max_iter()		{ return max_iter; }
    void set_max_iter(int m)    { max_iter = m; }
    
    int get_first_ev_year() 	{ return first_ev_year; }
    int get_adj_mat_rate() 	{ return adj_mat_rate; }
    int get_calibration_test() 	{ return calibration_test; }

    double get_conv_tolerance() { return conv_tolerance; }
    double get_min_ev() 	{ return min_ev; }
    void set_conv_tolerance(double t) { conv_tolerance = t; }
    void set_min_ev(double m)	{ min_ev = m; }
    
    StockCalib *find_stock_calib(char *abbrv);
    
  private:
    int init_files();
    
    void calc_evs(int iteration);
    void calc_mrs();
    int write_evo();
    void write_results();
    
    Bool conv_flag;
    int calibration_test;
    int calibration_pattern;
    int calibration_cycles;
    double conv_tolerance;	// Asks user for this somewhere.  default .05
    int max_iter;

    double min_ev;	   	// same.  default .01
    int stock_monitor;
    int adj_mat_rate;
    double adj_mat_min;
    int num_stock_scalar;
    int first_ev_year;
    StockCalib *stock_calibs;

    char *file_prefix;
    char evfcast_fn[MAX_TOKEN_LEN];
    char ev_est_fn[MAX_TOKEN_LEN];
    
    FILE *ev_hist;
    FILE *intermed_evs;
    FILE *calib_hist;
};

#endif
