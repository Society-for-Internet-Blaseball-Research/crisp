#include "datIntDouble.h"

int datIntDouble::compareTo(const RWCollectable *rc) const {
	if(rc->isA() != isA()) return 1; 
	datIntDouble *df = (datIntDouble *)rc;
	if(df->itemsInt() == itemsInt()){
		for(int i=0;i<itemsInt();i++){
			if(getInt(i) < df->getInt(i))return -1;
			if(getInt(i) > df->getInt(i))return 1;
		}
		return 0;
	}
	else
		return -1;
}

RWClassID datIntDouble::isA() const {
	return _RWC_INTDOUBLE;	
}
void datIntDouble::setDouble(int i, double val, int delta){ 
	if(_lock)
		return;
	if(delta)
		dvec[i] += val; 
	else
		dvec[i] = val; 
}
