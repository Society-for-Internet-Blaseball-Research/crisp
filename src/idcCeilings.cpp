#include "idcCeilings.h"

idcCeilings::idcCeilings() : df_(0), fcy_(0), lcy_(0){
	
	while(!(::Fisheries[df_].gui_get_tactics()->is_ceilinged()) && df_ < ::Fisheries.num())
		df_++;

    fcy_ = ::Fisheries[df_].gui_get_tactics()->get_first_ceilinged_year();
	lcy_ = ::Fisheries[df_].gui_get_tactics()->get_last_ceilinged_year();
	
}

void idcCeilings::ApplyCache(){
	RWBinaryTreeIterator iterate(bt);
	RWCollectable *rc;
	datFisheryCeilings *dat; 
	int af, cf;
	while(rc = iterate()){
		dat = (datFisheryCeilings *)rc;
		af=-1;
		cf=-1;
		while(cf != dat->getInt(0) && af < ::Fisheries.num())
			if(::Fisheries[++af].gui_get_tactics()->is_ceilinged())cf++;
		for(int y=fcy_;y<=lcy_;y++){
			::Fisheries[af].gui_get_tactics()->set_initial_ratio(y,dat->getDouble(y-fcy_)/::Fisheries[af].gui_get_tactics()->get_initial_base_catch());
			::Fisheries[af].gui_get_tactics()->set_forced(y,dat->getInt(y-fcy_+1));
		}
	}
}

void idcCeilings::ModifyCache(const int cYear, const int cFish, const double delta, const unsigned int sF, const int dv){
		
		int af=0, cf=0;
		datFisheryCeilings *dat =NULL; 
		
		if(!(dat = getDat(sF))) return; // If we can't find the data to modify.. return
		if(!cFish){ // it doesn't have the "modify all fisheries" tag marked so ..
			//cYear is the year, delta is the data, and dv tells us weather
			//this delta value is an amount by which to modify the data or if it's the new value for the data.
			dat->setDouble(cYear,delta,dv);  
			return;
		}
		while(af < ::Fisheries.num()) // it is marked so we're going to iterate through and get the number of ceilinged fisheries.
			if(::Fisheries[af++].gui_get_tactics()->is_ceilinged())cf++;
		for(int i=0;i<cf;i++){ // now we're iterating through those, modifying the data..
			if(!(dat = getDat(i))) 
				return;
			dat->setDouble(cYear,delta,dv);
		}
}



datFisheryCeilings *idcCeilings::getDat(int f){
	int af=-1, cf=-1;
	while(cf != f && af < ::Fisheries.num())if(::Fisheries[++af].gui_get_tactics()->is_ceilinged())cf++;
	datFisheryCeilings *target = new datFisheryCeilings(1+ny(),ny());

	// The first int is used to hold the fishery number.. the rest is used for telling
	// weather or not the ceiling is forced.
	target->setInt(0,f);  // setting fishery number for the target data...
	RWCollectable *rc = NULL;
	int i = 0;
	int e = bt.entries();
	if(rc = bt.find((RWCollectable *)target)){
		delete target; // we found some data that matched the target in the cache so we can toss the "target"
		return (datFisheryCeilings *)rc; // returning that data we found.
	}
	for(int y=fcy_;y<=lcy_;y++){ // didn't find any data in the cache, so we're filling in the data..
		double d = ::Fisheries[af].gui_get_tactics()->get_initial_ratio(y) * ::Fisheries[af].gui_get_tactics()->get_initial_base_catch();
		target->setDouble(i,d);
		d = ::Fisheries[af].gui_get_tactics()->get_forced(y);
		target->setInt(i+1,int(d));
		i++;
	}
	//if(y < ::Chronographer->sim_start_year()) // we need to lock the data if it's in the calibration range
	//	target->lock(1);
	bt.insert((RWCollectable *)target); // adding the data into the cache.
	return target;
}

