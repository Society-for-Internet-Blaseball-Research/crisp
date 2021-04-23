#include "idcENH.h"

void idcENH::ApplyCache(){
	RWBinaryTreeIterator iterate(bt);
	RWCollectable *rc;
	datStockENH *dat; 
	Production *pro;

	while(rc = iterate()){
		dat = (datStockENH *)rc;
		pro = ::Stocks[dat->getInt(0)].gui_get_production(); 	
		for(int y=0;y<Chronographer->nyears();y++){
			pro->set_smolt_prod(y,dat->getDouble(y+3));
		}
		pro->set_enh_parm(dat->getDouble(0)); //Enhancement Parameter
		pro->set_enh_prop(dat->getDouble(1)); //EnhProp
		pro->set_smolt_age1(dat->getDouble(2)); //getSmoltAge1
	}
}

void idcENH::ModifyCache(const int cYear, const int cStock, const double delta, const unsigned int sS, const int dv){
		
		int af=0, cf=0;
		datStockENH *dat =NULL; 
		if(cYear < ::Chronographer->sim_start_year()) return;		
		if(!(dat = getDat(sS))) return;
		if(!cStock){
			dat->setDouble(cYear+3,delta,dv);
			return;
		}
		
		for(int i=0;i<Stocks.num();i++){
			if(!(dat = getDat(i))) 
				return;
			dat->setDouble(cYear+3,delta,dv);
		}

}
void idcENH::ModifyCacheSmoltAge1(const int cStock, const double delta, const unsigned int sS, const int dv){
		int af=0, cf=0;
		datStockENH *dat =NULL; 
		if(!(dat = getDat(sS))) return;

		if(!cStock){ 
			dat->setDouble(2,delta,dv); return; 
		}
		for(int i=0;i<Stocks.num();i++){
			if(!(dat = getDat(i))) return;
			dat->setDouble(2,delta,dv);
		}
}
void idcENH::ModifyCacheEnhProp(const int cStock, const double delta, const unsigned int sS, const int dv){
		int af=0, cf=0;
		datStockENH *dat =NULL; 
		if(!(dat = getDat(sS))) return;

		if(!cStock){ 
			dat->setDouble(1,delta,dv); return; 
		}
		for(int i=0;i<Stocks.num();i++){
			if(!(dat = getDat(i))) return;
			dat->setDouble(1,delta,dv);
		}
}
void idcENH::ModifyCacheEnhParm(const int cStock, const double delta, const unsigned int sS, const int dv){
		int af=0, cf=0;
		datStockENH *dat =NULL; 
		if(!(dat = getDat(sS))) return;

		if(!cStock){ 
			dat->setDouble(0,delta,dv); return; 
		}
		for(int i=0;i<Stocks.num();i++){
			if(!(dat = getDat(i))) return;
			dat->setDouble(0,delta,dv); 
		}
}


datStockENH *idcENH::getDat(int f){
	
	datStockENH *target = new datStockENH(1,Chronographer->nyears()+3);
	target->setInt(0,f);
	RWCollectable *rc = NULL;
	Production *pro = ::Stocks[f].gui_get_production(); 	
	
	if(rc = bt.find((RWCollectable *)target)){
		delete target;
		return (datStockENH *)rc;
	}
	for(int y=0;y<Chronographer->nyears();y++)
		target->setDouble(y+3,pro->get_smolt_prod(y));
	target->setDouble(2,pro->get_smolt_age1());
	target->setDouble(0,pro->get_enh_parm());
	target->setDouble(1,pro->get_enh_prop());
	
	if(y < ::Chronographer->sim_start_year())
		target->lock(1);

	bt.insert((RWCollectable *)target);
	return target;

}


