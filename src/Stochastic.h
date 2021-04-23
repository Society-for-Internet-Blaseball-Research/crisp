// Stochastic.h
//     subclasses of MonteDataItem which uses a stochastic sampling techniques.

#ifndef STOCHASTIC_H
#define STOCHASTIC_H

#include <math.h>
#include "MonteDataItem.h"
#include "RandNorm.h"

// a stochastic monte data item using a standard normal sampling technique.
// default operation is to use the global random number stream.

class StochasticNorm : public MonteDataItem {
  public:
    StochasticNorm(double * d, double mu, double sigma)
	: data(d), stream(mu, sigma) {}
    virtual ~StochasticNorm() {}

    virtual void game_action(int);

  protected:
    RandNorm stream;
    double * const data;
};

inline void StochasticNorm::game_action(int)
{
    for (int i = monte_start_year; i < nyears; ++i)
	data[i] = stream.sample();
}


// stochastic log normal.  subclass of above.  just overrides the game_action().

class StochasticLogNorm : public StochasticNorm {
  public:
    StochasticLogNorm(double * d, double mu, double sigma)
	: StochasticNorm(d, mu, sigma) {}
    virtual ~StochasticLogNorm() {}

    virtual void game_action(int);
};

inline void StochasticLogNorm::game_action(int)
{
    for (int i = monte_start_year; i < nyears; ++i)
	data[i] = exp(stream.sample());
}

#endif
