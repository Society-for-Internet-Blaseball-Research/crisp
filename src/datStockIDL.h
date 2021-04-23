#ifndef _datStockIDL_
#define _datStockIDL_

#include "datIntDouble.h"

class datStockIDL : public datIntDouble {

	public:
		datStockIDL(int is, int ds) : datIntDouble(is,ds) {}
		virtual RWClassID isA() const {	return _RWC_IDL; }
	
};

#endif
