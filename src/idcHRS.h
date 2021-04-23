#ifndef _idcHRS_
#define _idcHRS_

#include "interfaceDataControl.h"
#include "datHarvestHRS.h"

class idcHRS : public interfaceDataControl {  

	
public:

	datHarvestHRS *getDat(int s, int f);
	Harvest *find(int s, int f);
	virtual void ModifyCache(const int sA, const int cStock, const int cFish, 
		const double delta, const unsigned int sS, const unsigned int sF, const int dv);

	virtual void ApplyCache();
	
};



#endif

