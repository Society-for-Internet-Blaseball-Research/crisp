#ifndef _datStockMR_
#define _datStockMR_


#include "datIntDouble.h"

class datStockMR : public datIntDouble {

	public:
		datStockMR(int is, int ds) : datIntDouble(is,ds) {}

		virtual RWClassID isA() const {	return _RWC_MR; }
	
};

#endif


