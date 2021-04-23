// CNR (Chinook Non-Retention) base class and subclasses.
//   these are used by the FisheryTactics class.

#ifndef CNR_H
#define CNR_H

//#include <cnrVisitor.h>
class cnrVisitor;
class Fishery;
class IOCrud;

// CNR abstract base class

class CNR {
    friend class cnrSliderVisitor;

  public:
    CNR(double lsel, double slsel) : legal_sel(lsel), sublegal_sel(slsel) {}
    virtual ~CNR() {}
    
    virtual double sublegal_ratio(const Fishery& f) const = 0;
    virtual double legal_ratio(const Fishery& f) const = 0;
    virtual void accept(cnrVisitor& v) = 0;

    // parsing functions, psc style
    virtual int read_cnr(IOCrud* psc) = 0;

  protected:

    double legal_sel;			// legal and sublegal selectivity
    double sublegal_sel;		
};

// CNR subclasses; one for each computation method

// Harvest Ratio (RT) method
class CNR_HarvestRatio : public CNR {
  public:
    CNR_HarvestRatio(double legal, double sublegal) : CNR(legal, sublegal)  {}

    virtual double sublegal_ratio(const Fishery& f) const;
    virtual double legal_ratio(const Fishery& f) const;
    virtual void accept(cnrVisitor& v);

    // parsing functions, psc style
    virtual int read_cnr(IOCrud* psc);
};    
// Wild Ass Guess method
/*

  When using this method, the operator guesses what the
  future encounter rates will be, rather than computing them from model
  outputs (as with the RT method) or observed data (as with the season length
  or encounter rate methods). 

 */


class CNR_WildAssGuess : public CNR {
    friend class cnrSliderVisitor;
    
  public:
    CNR_WildAssGuess(double legal, double sublegal) : CNR(legal, sublegal)  {}

    virtual double sublegal_ratio(const Fishery& f) const;
    virtual double legal_ratio(const Fishery& f) const;
    virtual void accept(cnrVisitor& v);
    inline double &get_season_frac(){return cnr_season_fraction;}
    
    // parsing functions, psc style
    virtual int read_cnr(IOCrud* psc);
    
  private:
    double cnr_season_fraction;    
    
};    

// Season Length method

class CNR_SeasonLength : public CNR {
    friend class cnrSliderVisitor;

  public:

    CNR_SeasonLength(double legal, double sublegal) : CNR(legal, sublegal){}

    virtual double sublegal_ratio(const Fishery& f) const;
    virtual double legal_ratio(const Fishery& f) const;
    virtual void accept(cnrVisitor& v);

    inline double &cnr_sn_len(){return cnr_season_len;}
    inline double &legal_sn_len(){return legal_season_len;}

    // parsing functions, psc style
    virtual int read_cnr(IOCrud* psc);

  private:

    double cnr_season_len;
    double legal_season_len;

};    

// Reported Encounter method

class CNR_ReportedEncounter : public CNR {
  public:
    CNR_ReportedEncounter(double legal, double sublegal)
    	: CNR(legal, sublegal)  {}

    virtual double sublegal_ratio(const Fishery& f) const;
    virtual double legal_ratio(const Fishery& f) const;
    virtual void accept(cnrVisitor& v);
    inline double &get_rsubleg_enc(){return rpt_sublegal_enc;}
    inline double &get_rleg_enc(){return rpt_legal_enc;}
    inline double &get_rcatch(){return rpt_catch;}
    
    // parsing functions, psc style
    virtual int read_cnr(IOCrud* psc);

  private:
    double rpt_sublegal_enc;
    double rpt_legal_enc;
    double rpt_catch;
};    

#endif
