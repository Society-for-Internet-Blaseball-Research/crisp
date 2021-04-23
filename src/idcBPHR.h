#ifndef _idcBPHR_
#define _idcBPHR_

#include "interfaceDataControl.h"
#include "datHarvestBPHR.h"

class idcBPHR : public interfaceDataControl {  

	
public:

	datHarvestBPHR *getDat(int s, int f);
	Harvest *find(int s, int f);
	virtual void ModifyCache(const int sA, const int cStock, const int cFish, 
		const double delta, const unsigned int sS, const unsigned int sF, const int dv);

	virtual void ApplyCache();
	
};

#endif

