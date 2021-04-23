#ifndef STOCKCALIB_H
#define STOCKCALIB_H

#include "Calibrator.h"
#include "Cohort.h"
#include "Stock.h"

class ModelDat;
class EvDat;

class StockCalib
{
  friend class ModelDat;
  friend class EvDat;
    
  public:
    StockCalib(Stock *s = NULL);
    ~StockCalib();

    static void  set_Cal(Calibrator *c) { assert(!Cal); Cal = c; }

    void   set_stock(Stock *s) 		{ stock = s; }
    Stock  *get_stock()			{ return stock; }

    double model_data(Age age, int year);
    void   calc_ev(int num_iter);
    void   calc_mr();
    int	   read_ev_data(FILE *fp);

    ModelDat *get_model_dat()		{ return model_dat; }
    void set_model_dat(ModelDat *md)	{ model_dat = md; }

    EvDat *get_ev_dat()			{ return ev_dat; }
    void set_ev_dat(EvDat *evd)		{ ev_dat = evd; }
    void write_evo(FILE *fp);

    static void  end_iteration();
    static void  write_results();
    
  private:
    void   reset();
    double get_data(Age age, int year);
    void   compute_ratios();
    void   adjust_evs(int num_iter);
    void   adjust_ev(int brd_yr);
    void   set_average_evs();
    double average_ev();		// avg ev for brood years.

    double avg_ratio(Age);
    int    check_mat_rate(Age);
    void   compute_aeqs(Age);
    
    int    stock_mon()    		{ return Cal->is_stock_mon(this); }

    double get_ev(int year) const 	{ return stock->ev_scalar(year); }
    void   set_ev(int year, double val) { stock->calibrate_ev(year, val); }


    // The following data are culled from input.

    EvDat *ev_dat;  
    ModelDat *model_dat; 
    int stk_mat;
    int num_mat_sched;

    Stock *stock;

    // Storage for intermediate calculations.
    int *brd_yr_flg;
    double *ratios;
    double avg_ratios[AGE5 - FIRST_HV_AGE + 1];
    
    static Calibrator *Cal;

    // Stats on the stock farthest from convergence.
    static double big_prob;		// Stats on the stock farthest
    static double biggest_prob;		// from convergence.
    static StockCalib *prob_stock;
    static int prob_by;
};

#endif

