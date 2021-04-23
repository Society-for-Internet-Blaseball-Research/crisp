#ifndef _datStockEV_
#define _datStockEV_

#include "datIntDouble.h"

class datStockEV : public datIntDouble {

	public:
		datStockEV(int is, int ds) : datIntDouble(is,ds) {}
		virtual RWClassID isA() const {	return _RWC_EV; }
	
};

#endif

