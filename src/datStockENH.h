#ifndef _datStockENH_
#define _datStockENH_

#include "datIntDouble.h"

class datStockENH : public datIntDouble {

	public:
		datStockENH(int is, int ds) : datIntDouble(is,ds) {}
		virtual RWClassID isA() const {	return _RWC_INTDOUBLE; }
	
};


#endif
