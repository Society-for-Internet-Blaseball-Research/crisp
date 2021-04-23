
#include "datTypes.h"
#include "datFisheryCeilings.h"

//datFisheryCeilings requires a special compareTo as the int vector
//is used to store the "forced" data as well.  So below, we only compare the
//first entry in the vector, which holds the fishery #.
int datFisheryCeilings::compareTo(const RWCollectable *rc) const {
	if(rc->isA() != isA()) return 1; 
	datIntDouble *df = (datIntDouble *)rc;
	if(df->itemsInt() == itemsInt()){
		for(int i=0;i<1;i++){
			if(getInt(i) < df->getInt(i))return -1;
			if(getInt(i) > df->getInt(i))return 1;
		}
		return 0;
	}
	else
		return -1;
}


