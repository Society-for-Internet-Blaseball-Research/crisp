#include "Harvest.h"
#include "idcBPHR.h"

void idcBPHR::ApplyCache(){
	RWBinaryTreeIterator iterate(bt);
	RWCollectable *rc;
	datHarvestBPHR *dat; 
	while(rc = iterate()){
		dat = (datHarvestBPHR *)rc;
	 	for (Age age = AGE2; age <= age.top(); ++age)
			find(dat->getInt(0),dat->getInt(1))->set_base_harvest_rate(age, dat->getDouble(age-AGE2));
	}
}

void idcBPHR::ModifyCache(const int sA, const int cStock, const int cFish, const double delta, const unsigned int sS, const unsigned int sF, const int dv){

		datHarvestBPHR *dat =NULL; 
		if(!(dat = getDat(sS,sF))) return;
		if(!cStock && !cFish)
			dat->setDouble(sA,delta,dv);
		else if(!cStock && cFish){
			for (int f = 0; f < ::Fisheries.num(); f++){
				if(dat = getDat(sS,f))
					dat->setDouble(sA,delta,dv);
			}
		}
		else if(cStock && !cFish){
			for (int s = 0; s < ::Stocks.num(); s++){
				if(dat = getDat(s,sF))
					dat->setDouble(sA,delta,dv);
			}
		}
		else{
			for (int s = 0; s < ::Stocks.num(); s++){
				for (int f = 0; f < ::Fisheries.num(); f++){
					if(dat = getDat(s,f))
						dat->setDouble(sA,delta,dv);
				}	
			}
		}
}
Harvest *idcBPHR::find(int s, int f)
{
	HvIter itr(::Harvests);
    while(++itr) {
		if (::strcmp(itr.key()->get_stock()->get_name(),
			::Stocks[s].get_name()))
			continue;
		if (!::strcmp(itr.key()->get_fishery()->get_name(),
			    ::Fisheries[f].get_name()))
			return itr.key();
    }
    return (Harvest *) 0;
}
datHarvestBPHR *idcBPHR::getDat(int s, int f){
	Age ta;
	datHarvestBPHR *target = new datHarvestBPHR(2,ta.top()-AGE2+1);
	target->setInt(0,s);
	target->setInt(1,f);
	RWCollectable *rc = NULL;
	Harvest *h = NULL;
	if(rc = bt.find((RWCollectable *)target)){
		delete target;
		return (datHarvestBPHR *)rc;
	}
	if(h=find(s,f))
		for (Age age = AGE2; age <= age.top(); age++)
			target->setDouble(age-AGE2,h->get_base_harvest_rate(age));
	else {
		delete target;
		return NULL;
	}
	bt.insert((RWCollectable *)target);
	return target;
}

