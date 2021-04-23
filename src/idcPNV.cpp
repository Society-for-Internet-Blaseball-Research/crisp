#include "idcPNV.h"


void idcPNV::ApplyCache(){
	RWBinaryTreeIterator iterate(bt);
	RWCollectable *rc;
	datFisheryPNV *dat; 
	while(rc = iterate()){
		dat = (datFisheryPNV *)rc;
	 	for (Age age = FIRST_HV_AGE; age < age.top(); ++age)
			::Fisheries[dat->getInt(0)].set_pnv(age, dat->getInt(1),dat->getDouble(age-FIRST_HV_AGE));
	}
}
void idcPNV::ModifyCache(const int cAge, const int cYear, const int cFish, const double delta, const unsigned int sY, const unsigned int sF, const int dv){
		datFisheryPNV *dat =NULL; 
		if(!(dat = getDat(sY,sF))) return;
		if(!cYear && !cFish)
			dat->setDouble(cAge,delta,dv);
		if(!cYear && cFish){
			for (int f = 0; f < ::Fisheries.num(); f++){
				if(!(dat = getDat(sY,f))) return;
				dat->setDouble(cAge,delta,dv);
			}
		}
		if(cYear && !cFish){
			for (int year = 0; year < ::Chronographer->nyears(); year++){
				if(!(dat = getDat(year,sF))) return;
				dat->setDouble(cAge,delta,dv);
			}
		}
		if(cYear && cFish){
			for (int year = 0; year < ::Chronographer->nyears(); year++){
				for (int f = 0; f < ::Fisheries.num(); f++){
					if(!(dat = getDat(year,f))) return;
					dat->setDouble(cAge,delta,dv);
				}	
			}
		}
}

datFisheryPNV *idcPNV::getDat(int y, int f){
	Age age;
	datFisheryPNV *target = new datFisheryPNV(2,age.top()-FIRST_HV_AGE);
	target->setInt(0,f);
	target->setInt(1,y);

	RWCollectable *rc = NULL;
	int i = 0;
	if(rc = bt.find((RWCollectable *)target)){
		delete target;
		return (datFisheryPNV *)rc;
	}
	for (age = FIRST_HV_AGE; age < age.top(); ++age){
		target->setDouble(i,::Fisheries[f].pnv(age, y));
		i++;
	}
	if(y < ::Chronographer->sim_start_year())
		target->lock(1);

	bt.insert((RWCollectable *)target);
	return target;
}

