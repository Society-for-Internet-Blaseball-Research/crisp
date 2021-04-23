#ifndef _idcEV_
#define _idcEV_

#include "interfaceDataControl.h"
#include "datStockEV.h"

class idcEV: public interfaceDataControl {  

	
public:

	datStockEV *getDat(int f);
	virtual void ModifyCache(const int cYear, const int cStock, const double delta, const unsigned int sS, const int dv);
	void ApplyCache();
	
};

#endif
