#ifndef _datHarvestHRS_
#define _datHarvestHRS_

#include "datIntDouble.h"

class datHarvestHRS : public datIntDouble {

	public:
		datHarvestHRS(int is, int ds) : datIntDouble(is,ds) {}

		virtual RWClassID isA() const {	return _RWC_HRS; }
	
};

#endif

