#ifdef _ZAPP_GUI_
#include <zapp.hpp>
#include <intpack/zip.hpp>
#include "zcGMF_InMortGraphs.h"
#include "globals.h"

extern int DefaultFishery;

zcGMF_InMortTotal::zcGMF_InMortTotal(ZatGraphDialog *gd) : zcGM_YearGraph(gd) {
	drawLabels();
}

void zcGMF_InMortTotal::drawLabels(void){

	setTitle(DefaultFishery);
	zcGM_YearGraph::drawLabels();

	_gd->addLegendLabel("Total", new zColor(RED)); // incidental mortality (shakers + CNRs)

	cbRedraw();

}

void zcGMF_InMortTotal::setTitle(int index){
	if(index < Fisheries.num()){
	    char title[80];
		DefaultSelection = index;
		sprintf(title, "Total Incidental Mortality (shakers + CNRs), %s Fishery", ::Fisheries[DefaultSelection].get_name());
		_gd->setTitleLabel(title);
	}
}
void zcGMF_InMortTotal::getData(void){

	maxVal=0.0;
	double tempVal;
	int ny = Chronographer->nyears();
	for (int i = 0; i < ny; i++){
		tempVal=::Fisheries[DefaultSelection].get_cnr_total(i)+::Fisheries[DefaultSelection].get_preterm_shakers(i);
		if(tempVal>maxVal)
			maxVal = tempVal;
		dataList.insert(tempVal);
	}
	maxVal = maxVal*1.2;
	setYAxisRange(long(0),long(maxVal));
}

#endif
