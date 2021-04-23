#ifndef _idcENH_
#define _idcENH_

#include "interfaceDataControl.h"
#include "datStockENH.h"

class idcENH: public interfaceDataControl {  

	
public:

	datStockENH *getDat(int f);
	virtual void ModifyCache(const int cYear, const int cStock, const double delta, const unsigned int sS, const int dv);
	void ModifyCacheEnhProp(const int cStock, const double delta, const unsigned int sS, const int dv);
	void ModifyCacheEnhParm(const int cStock, const double delta, const unsigned int sS, const int dv);
	void ModifyCacheSmoltAge1(const int cStock, const double delta, const unsigned int sS, const int dv);

	void ApplyCache();
	
};

#endif



