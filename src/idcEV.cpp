#include "idcEV.h"

void idcEV::ApplyCache(){
	RWBinaryTreeIterator iterate(bt);
	RWCollectable *rc;
	datStockEV *dat; 
		
	while(rc = iterate()){
		dat = (datStockEV *)rc;
		for(int y=0;y<Chronographer->nyears();y++){
			dat = (datStockEV *)rc;
	 		::Stocks[dat->getInt(0)].calibrate_ev(y,dat->getDouble(y));
		}
	}
}

void idcEV::ModifyCache(const int cYear, const int cStock, const double delta, const unsigned int sS, const int dv){
		
		int af=0, cf=0;
		datStockEV *dat =NULL; 
		if(cYear < ::Chronographer->sim_start_year()) return;				
		if(!(dat = getDat(sS))) return;
		if(!cStock){
			dat->setDouble(cYear,delta,dv);
			return;
		}
		
		for(int i=0;i<Stocks.num();i++){
			if(!(dat = getDat(i))) 
				return;
			dat->setDouble(cYear,delta,dv);
		}

}



datStockEV *idcEV::getDat(int f){
	
	datStockEV *target = new datStockEV(1,Chronographer->nyears());
	target->setInt(0,f);
	RWCollectable *rc = NULL;
	
	
	if(rc = bt.find((RWCollectable *)target)){
		delete target;
		return (datStockEV *)rc;
	}
	for(int y=0;y<Chronographer->nyears();y++)
		target->setDouble(y,::Stocks[f].get_ev_scalars(y));
		
	if(y < ::Chronographer->sim_start_year())
		target->lock(1);
	bt.insert((RWCollectable *)target);
	return target;

}


