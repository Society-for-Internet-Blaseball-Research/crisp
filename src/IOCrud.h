/* IOCrud class construct for PSC style IO.  this will be trashed later.
 * see implementation file for more comments.
 */

#ifndef IOCRUD_H
#define IOCRUD_H

#include <stdio.h>
#include <string.h>
#include "tokens.h"

class psc_output;			// helper class, declared in IOCrud.cc

class IOCrud {
public:
    IOCrud(char *fn)
	: num_pnv_fnames(0), pnv_fnames(0), enh_density_dep(0),
        sim_start_year(0), num_ev_stocks(0)

    	{ strcpy(config_fn, fn); }
    ~IOCrud();
    int read_config();
    int read_data();
    int read_mat_file (const char * m_fn);
    FILE *b_fp() const { return base_fp; }
    FILE *s_fp() const { return stock_fp; }
    FILE *pnv_fp() const { return cur_pnv_fp; }
    FILE *fp_fp() const { return opt_fp_fp; }
    FILE *cnr_fp() const { return opt_cnr_fp; }
    FILE *idl_fp() const { return opt_idl_fp; }
    FILE *clng_fp() const { return opt_clng_fp; }
    FILE *mat_fp() const { return opt_mat_fp; }
    int get_num_years() const { return num_years; }
    int get_base_year() const { return base_year; }
    int get_sim_start_year() const { return sim_start_year; }
    int get_num_stocks() const { return num_stocks; }
    int get_num_fisheries() const { return num_fish; }
    int get_term_net_age() const { return term_net_age; }
    int get_term_stats_age() const { return term_stats_age; }
    int get_enh_dens_dep() const { return enh_density_dep; }

    int write_output_files();
    
private:
    char config_fn[MAX_TOKEN_LEN];
    char base_fn[MAX_TOKEN_LEN];
    char stock_fn[MAX_TOKEN_LEN];
    char fp_fn[MAX_TOKEN_LEN];
    char mat_fn[MAX_TOKEN_LEN];
    char idl_fn[MAX_TOKEN_LEN];
    char cnr_fn[MAX_TOKEN_LEN];
    char run_name[MAX_TOKEN_LEN];
    char clng_fn[MAX_TOKEN_LEN];
    char enh_fn[MAX_TOKEN_LEN];
    char ev_fn[MAX_TOKEN_LEN];
    char monte_fn[MAX_TOKEN_LEN];
    char policy_fn[MAX_TOKEN_LEN];
    
    char **pnv_fnames;
    FILE *config_fp, *base_fp, *stock_fp, *cur_pnv_fp, *opt_fp_fp, *opt_cnr_fp;
    FILE *opt_idl_fp, *opt_clng_fp, *opt_mat_fp, *opt_monte_fp, *opt_policy_fp;

    int num_mat_stocks;
    int num_ev_stocks;
    int num_cnr_fisheries;
    int num_pnv_fnames;
    int base_year_opt, base_year, sim_start_year, num_years;
    int num_stocks, num_fish, term_net_age;
    int term_stats_age;
    int num_enh_stocks;
    int enh_density_dep;
    
    static psc_output psc_out;
    
    int read_save_stats();
    int read_additional_save_stats();
    int read_mat_data();
    int read_msc_file(const char *msc_fn);
    int read_pnv_fnames();
    int read_ev_data();
    int read_idl_data();
    int read_enh_data();
    int read_pnv_data();
    int read_fp_data();
    int read_cnr_data();
    int read_ceiling_data();
    int read_monte_data();
    int read_policy_data();
};
    
// dtor
inline IOCrud::~IOCrud()
{
    if (pnv_fnames)
    {
	for (int i=0; i < num_pnv_fnames; ++i)
	    delete pnv_fnames[i];
	delete [] pnv_fnames;
    }
}

// internal helper class for saving output configuration info

class Stock;
class psc_output {
    friend IOCrud;

  public:
    psc_output() : stat_flags(0), fishery_flags(0)
	, stock_flags(0), ohr_opt(0), thr_opt(0), mrt_opt(0), mrt_stocks(0)
	{ file_prefix[0] = 0; }

  private:
    // fns; IOCrud use only	Line from .OPT file:
    int write_cat() const;   // 9b  (CATCH)
    int write_trm() const;   //	9c  (TERM)
    int write_esc() const;   //	9d  (ESC)
    int write_ohr() const;   //	9e
    int write_thr() const;   //	9f
    int write_mrt() const;   //	9g
    int write_tim() const;   // 9h  (I_MORT)
    int write_lim() const;   // 9h  (I_MORT)
    int write_sim() const;   // 9h  (I_MORT)
    int write_abd() const;   // 9i
    int write_coh() const;   //	9i
    int write_rt() const;    // 12  (HV_RT)
    int write_stock_ocn() const;    
    
    int write_stock_mrt(Stock *) const;

    // data
    char file_prefix[MAX_TOKEN_LEN];

    enum s_flags
    {
	CATCH = 0x01, TERM = 0x02, ESC = 0x04, I_MORT = 0x08, HV_RT = 0x10,
	OCN_CAT = 0x20
    };
    int ohr_opt;
    int thr_opt;
    int mrt_opt;
    char *mrt_stocks;
    
    unsigned int stat_flags;
    unsigned long fishery_flags;
    unsigned long stock_flags;
};
    
#endif
