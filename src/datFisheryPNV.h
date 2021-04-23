#ifndef _datFisheryPNV_
#define _datFisheryPNV_

#include "datIntDouble.h"

class datFisheryPNV : public datIntDouble {

	public:
		datFisheryPNV(int is, int ds) : datIntDouble(is,ds) {}

		virtual RWClassID isA() const {	return _RWC_PNV; }
	
};

#endif

