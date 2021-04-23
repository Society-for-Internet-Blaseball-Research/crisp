#ifndef _datFisheryCeilings_
#define _datFisheryCeilings_

#include "datIntDouble.h"

class datFisheryCeilings : public datIntDouble {

	public:
		datFisheryCeilings(int is, int ds) : datIntDouble(is,ds) {}
		virtual RWClassID isA() const {	return _RWC_Ceilings; }
		virtual int compareTo(const RWCollectable *rc) const;
};

#endif

