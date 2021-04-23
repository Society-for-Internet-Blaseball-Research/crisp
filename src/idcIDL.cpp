#include "idcIDL.h"

void idcIDL::ApplyCache(){
	RWBinaryTreeIterator iterate(bt);
	RWCollectable *rc;
	datStockIDL *dat; 
		
	while(rc = iterate()){
		dat = (datStockIDL *)rc;
		for(int y=0;y<Chronographer->nyears();y++){
			dat = (datStockIDL *)rc;
	 		::Stocks[dat->getInt(0)].gui_set_idl(y,dat->getDouble(y));
		}
	}
}

void idcIDL::ModifyCache(const int cYear, const int cStock, const double delta, const unsigned int sS, const int dv){
		
		int af=0, cf=0;
		datStockIDL *dat =NULL; 

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



datStockIDL *idcIDL::getDat(int f){
	
	datStockIDL *target = new datStockIDL(1,Chronographer->nyears());
	target->setInt(0,f);
	RWCollectable *rc = NULL;
	
	
	if(rc = bt.find((RWCollectable *)target)){
		delete target;
		return (datStockIDL *)rc;
	}
	for(int y=0;y<Chronographer->nyears();y++)
		target->setDouble(y,::Stocks[f].inter_dam_loss(y));
		
	if(y < ::Chronographer->sim_start_year())
		target->lock(1);
	bt.insert((RWCollectable *)target);
	return target;

}


