#ifndef _idcCeilings_h_
#define _idcCeilings_h_

#include "interfaceDataControl.h"
#include "datFisheryCeilings.h"

class idcCeilings : public interfaceDataControl {  

protected:

	int fcy_, lcy_, df_; //first ceilinged year, last ceilinged year, _default ceilinged fishery
	
public:

	idcCeilings();
	~idcCeilings(){ ClearCache(); }
	datFisheryCeilings *getDat(int f);
	virtual void ModifyCache(const int cYear, const int cFish, const double delta, const unsigned int sF, const int dv);
	void ApplyCache();

	int fcy(){ return fcy_; }
	int lcy(){ return lcy_; }
	int ny() { return 1 + lcy_ - fcy_; }  // number of years in any datFiesheryCeilings container.
};

#endif

