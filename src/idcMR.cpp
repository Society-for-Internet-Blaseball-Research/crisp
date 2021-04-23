#include "idcMR.h"


void idcMR::ApplyCache(){
	RWBinaryTreeIterator iterate(bt);
	RWCollectable *rc;
	datStockMR *dat; 
	Age age;
	while(rc = iterate()){
		dat = (datStockMR *)rc;
		age = AGE2;
		for(int k=0;k<dat->getInt(1);k++)
			age++;
		for(int y=0;y<Chronographer->nyears();y++){
			dat = (datStockMR *)rc;
	 		::Stocks[dat->getInt(0)].set_maturation_rate(y,age,dat->getDouble(y));
		}
	}
}


void idcMR::ModifyCache(const int sA, const int cStock, const int cAge, const double delta, const unsigned int sS, const unsigned int sAge, const int dv){

	datStockMR *dat =NULL; 
	if(sA < ::Chronographer->sim_start_year()) return;
	if(!(dat = getDat(sS,sAge))) return;
	if(!cStock && !cAge)
		dat->setDouble(sA,delta,dv);
	else if(!cStock && cAge){
		for (int a = 0; a < 4; a++){
			if(dat = getDat(sS,a))
				dat->setDouble(sA,delta,dv);
		}
	}
	else if(cStock && !cAge){
		for (int s = 0; s < ::Stocks.num(); s++){
			if(dat = getDat(s,sAge))
				dat->setDouble(sA,delta,dv);
		}
	}
	else{
		for (int s = 0; s < ::Stocks.num(); s++){
			for (int a = 0; a < 4; a++){
				if(dat = getDat(s,a))
					dat->setDouble(sA,delta,dv);
			}	
		}
	}
}

datStockMR *idcMR::getDat(int s, int a){
	datStockMR *target = new datStockMR(2,Chronographer->nyears());
	Age age = AGE2;
	for(int j=0;j<a;j++)
		age++;
	target->setInt(0,s);
	target->setInt(1,a);
	RWCollectable *rc = NULL;
	double dt;
	if(rc = bt.find((RWCollectable *)target)){
		delete target;
		return (datStockMR *)rc;
	}
	for(int y=0;y<Chronographer->nyears();y++){
		dt = ::Stocks[s].maturation_rate(y,age);
		target->setDouble(y,dt);
	}	
	if(y < ::Chronographer->sim_start_year())
		target->lock(1);
	bt.insert((RWCollectable *)target);
	return target;
}

