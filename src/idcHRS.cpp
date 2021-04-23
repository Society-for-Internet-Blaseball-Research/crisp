#include "Harvest.h"
#include "idcHRS.h"


void idcHRS::ApplyCache(){
	RWBinaryTreeIterator iterate(bt);
	RWCollectable *rc;
	datHarvestHRS *dat; 
	while(rc = iterate()){
		dat = (datHarvestHRS *)rc;
		for (int y=0; y<find(dat->getInt(0),dat->getInt(1))->gui_get_harvest_tactics()->nyears(); y++)
			find(dat->getInt(0),dat->getInt(1))->gui_get_harvest_tactics()->gui_set_fps(y, dat->getDouble(y));
	}
}

void idcHRS::ModifyCache(const int sA, const int cStock, const int cFish, const double delta, const unsigned int sS, const unsigned int sF, const int dv){

		datHarvestHRS *dat =NULL; 
		if(sA < ::Chronographer->sim_start_year()) return;
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
Harvest *idcHRS::find(int s, int f)
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
datHarvestHRS *idcHRS::getDat(int s, int f){
	Age ta;
	datHarvestHRS *target = new datHarvestHRS(2,find(s,f)->gui_get_harvest_tactics()->nyears());
	target->setInt(0,s);
	target->setInt(1,f);
	RWCollectable *rc = NULL;
	Harvest *h = NULL;
	if(rc = bt.find((RWCollectable *)target)){
		delete target;
		return (datHarvestHRS *)rc;
	}
	if(h=find(s,f))
		for (int y=0; y < h->gui_get_harvest_tactics()->nyears(); y++)
			target->setDouble(y,h->gui_get_harvest_tactics()->gui_get_fps(y));
	else {
		delete target;
		return NULL;
	}
	bt.insert((RWCollectable *)target);
	return target;
}

