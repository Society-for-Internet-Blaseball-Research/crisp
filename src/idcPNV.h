#ifndef _idcPNV_
#define _idcPNV_

#include "interfaceDataControl.h"
#include "datFisheryPNV.h"

class idcPNV : public interfaceDataControl {  

	
public:

	datFisheryPNV *getDat(int y, int f);

	virtual void ModifyCache(const int cAge, const int cYear, const int cFish, 
		const double delta, const unsigned int sY, const unsigned int sF, const int dv);

	virtual void ApplyCache();
	
};



#endif

