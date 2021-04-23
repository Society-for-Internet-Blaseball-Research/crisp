#ifndef _idcMR_
#define _idcMR_

#include "interfaceDataControl.h"
#include "datStockMR.h"

class idcMR : public interfaceDataControl {  

	
public:

	datStockMR *getDat(int s, int a);
	virtual void ModifyCache(const int sY, const int cStock, const int cAge, 
		const double delta, const unsigned int sS, const unsigned int sA, const int dv);

	virtual void ApplyCache();
	
};



#endif

