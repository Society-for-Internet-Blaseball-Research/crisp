// RandNorm.h

// class to select a value from a normal distribution, with the given
// mean and standard deviation.  uses single stream generator if no pod
// is specified, otherwise uses multi stream generator.

#ifndef RANDNORM_H
#define RANDNORM_H

#include "RandGen.h"

class RandNorm : public RandGen {
  public:
    RandNorm() : mu(0.0), sigma(1.0), iset(0) {}
    RandNorm(double mean, double dev) : mu(mean), sigma(dev), iset(0) {}
    RandNorm(double mean, double dev, SeedPod *spod)
	: RandGen(spod), mu(mean), sigma(dev), iset(0) {}
    
    double sample() const { return (mu + sigma*normal()); }

  private:
    double normal() const;
    
    const double mu;
    const double sigma;

    int iset;
    double gset;
};

#endif
