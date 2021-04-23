/* monte_tokens.cc
 *
 * Tokens for implementing the sun.monte file read.
 */
#include "MonteControl.h"
#include "MonteDataItem.h"
#include "MonteStockIntrfc.h"
#include "StockList.h"
#include "base_tokens.h"
#include "monte_tokens.h"
// #include <iostream.h>

class MonteMapping : public KeywordMapping {
  public:
    MonteMapping();
    virtual ~MonteMapping();
};

String str;
int val;

class MonteReadBase : public virtual ReadToken {
  public:
    MonteReadBase()		{}
    virtual ~MonteReadBase()	{}
    void reseed(long l)		{ mc->reseed(l); }
    void set_start_year(int i)	{ mc->set_start_year(i); }
    void set_ngames(int i)	{ mc->set_ngames(i); }
    void add_track(MonteDataItem *mdi)	{ mc->add_track(mdi); }
  private:
    static MonteControl *mc;
};

class MonteSeedReadToken : public LongReadBase, public MonteReadBase {
  public:
    MonteSeedReadToken()	{}
    ~MonteSeedReadToken()	{}
    int read();
};

int MonteSeedReadToken::read()
{
    int status;
    long seed;

//    cout << "Seed read\n";
    status = read_long(seed);
    reseed(seed);
    return status;
}

class MonteGamesReadToken : public IntReadBase, public MonteReadBase {
  public:
    MonteGamesReadToken()	{}
    ~MonteGamesReadToken()	{}
    int read();
};

int MonteGamesReadToken::read()
{
    int status;
    int games;

//    cout << "Games read\n";
    status = read_int(games);
    set_ngames(games);
    return status;
}

class MonteYearReadToken : public IntReadBase, public MonteReadBase {
  public:
    MonteYearReadToken()	{}
    ~MonteYearReadToken()	{}
    int read();
};

int MonteYearReadToken::read()
{
    int status;
    int year;

//    cout << "Year read\n";
    status = read_int(year);
    set_start_year(year);
    return status;
}

class MonteTrackReadToken : public StringValueReadBase, public MonteReadBase {
  public:
    MonteTrackReadToken()	{}
    ~MonteTrackReadToken()	{}
    int read();
};

int MonteTrackReadToken::read()
{
    int status;
    String s;

    extern StockList Stocks;

//    cerr << "Track read\n";
    status = read_string(s);
    if (s == "escapement") {
	for (int i = 0 ; i < Stocks.num() ; ++i) {
	    MonteDataItem *monte_esc = Stocks[i].get_monte()->
		make_MonteTrackingItem(MonteStockTracking::ESCAPEMENT);
	    add_track(monte_esc);
	}
    } else {
    }
    return status;
}

MonteMapping::MonteMapping()
{
    append(new KeywordContainer("seed", new MonteSeedReadToken));
    append(new KeywordContainer("games", new MonteGamesReadToken));
    append(new KeywordContainer("year", new MonteYearReadToken));
    append(new KeywordContainer("track", new MonteTrackReadToken));
    append(new KeywordContainer("end", ::ReadEnd));
}

MonteMapping::~MonteMapping()
{
}

// Essentially a one use class.
class MonteStateClass : public State {
  public:
    MonteStateClass();
    ~MonteStateClass();
};

MonteStateClass::MonteStateClass()
{
    append(::ReadDiscardLine);
    append(new MonteMapping);
}

MonteStateClass::~MonteStateClass()
{
    list_iter.reset();
}

extern MonteControl *MonteCarlo;

MonteControl *MonteReadBase::mc = ::MonteCarlo;

State *MonteState = new MonteStateClass;
