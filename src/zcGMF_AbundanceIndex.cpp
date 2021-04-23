#ifdef _ZAPP_GUI_
#include <zapp.hpp>
#include <intpack/zip.hpp>
#include "zcGMF_AbundanceIndex.h"
#include "globals.h"

extern int DefaultFishery;

zcGMF_AbundanceIndex::zcGMF_AbundanceIndex(ZatGraphDialog *gd) : zcGM_YearGraph(gd) {
	_dataIndex[0] = DefaultFishery;
	drawLabels();
	
}

void zcGMF_AbundanceIndex::drawLabels(void){
	
	setTitle(DefaultFishery);
	zcGM_YearGraph::drawLabels();
	_gd->addLegendLabel("abundance index", new zColor(RED));
	
	cbRedraw();

}
void zcGMF_AbundanceIndex::setTitle(int index){
	if(index < Fisheries.num()){
	    char title[80];
		DefaultSelection = index;
		sprintf(title, "Abundance Index, %s Fishery", ::Fisheries[DefaultSelection].get_name());
		_gd->setTitleLabel(title);
	}
}

void zcGMF_AbundanceIndex::getData(void){

	maxVal=0.0;
	double tempVal = 0.0;

	for (int i = 0; i < Chronographer->nyears(); i++){
		tempVal=::Fisheries[DefaultSelection].get_abundance_index(i);
		if(tempVal>maxVal)
			maxVal = tempVal;
		dataList.insert(tempVal);
	}
	maxVal *= 1.2;
	setYAxisRange(long(0),long(maxVal));
}

#endif
