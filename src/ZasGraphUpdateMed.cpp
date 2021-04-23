#ifdef _ZAPP_GUI_
#include "ZasGraphUpdateMed.h"

spZasGraphUpdateMed ZasGraphUpdateMed::_instance = 0;

void ZasGraphUpdateMed::updateGraphs(const int index, const int graphType){

		evGraphUpdate_.notify(index, graphType); 

}


const utSmartPtr<ZasGraphUpdateMed> &ZasGraphUpdateMed::instance(){

	if(!_instance.raw_ptr()){ 
		_instance = new ZasGraphUpdateMed();
	}
	return _instance;

}
#endif
