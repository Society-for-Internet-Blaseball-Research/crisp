#ifndef _datHarvestBPHR_
#define _datHarvestBPHR_

#include "datIntDouble.h"

class datHarvestBPHR : public datIntDouble {

	public:
		datHarvestBPHR(int is, int ds) : datIntDouble(is,ds) {}

		virtual RWClassID isA() const {	return _RWC_BPHR; }
	
};

#endif
