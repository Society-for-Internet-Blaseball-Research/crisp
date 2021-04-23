#ifndef _idcIDL_
#define _idcIDL_

#include "interfaceDataControl.h"
#include "datStockIDL.h"

class idcIDL: public interfaceDataControl {  

	
public:
	idcIDL(){}
	datStockIDL *getDat(int f);
	virtual void ModifyCache(const int cYear, const int cStock, const double delta, const unsigned int sS, const int dv);
	void ApplyCache();
	
};

#endif
