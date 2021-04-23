#ifdef _ZAPP_GUI_
#include <zapp.hpp>
#include <intpack/zip.hpp>
#include "zcGMF_CatchGraphs.h"
#include "globals.h"

extern int DefaultFishery;

zcGMF_CatchTotal::zcGMF_CatchTotal(ZatGraphDialog *gd) : zcGM_YearGraph(gd) {
	drawLabels();
}

void zcGMF_CatchTotal::drawLabels(void){

	setTitle(DefaultFishery);
	zcGM_YearGraph::drawLabels();

	_gd->addLegendLabel("Age 2", new zColor(RED));
	_gd->addLegendLabel("Age 3", new zColor(GREEN));
	_gd->addLegendLabel("Age 4", new zColor(BLUE));
	_gd->addLegendLabel("Age 5", new zColor(BLACK));
	_gd->addLegendLabel("Total", new zColor(GRAY));

	cbRedraw();

}
void zcGMF_CatchTotal::setTitle(int index){
	if(index < Fisheries.num()){
	    char title[80];
		DefaultSelection = index;
		sprintf(title, "Total Catch, %s Fishery", ::Fisheries[DefaultSelection].get_name());
		_gd->setTitleLabel(title);
	}
}

void zcGMF_CatchTotal::getData(void){

	maxVal=0.0;
	double tempVal;
	int ny = Chronographer->nyears();
	for (Age age = FIRST_HV_AGE; age <= age.top(); age++){
		for (int i = 0; i < ny; i++){
			tempVal=::Fisheries[DefaultSelection].get_total_catch(age, i);
			if(tempVal>maxVal)
				maxVal = tempVal;
			dataList.insert(tempVal);
		}
	}
	for (int i = 0; i < ny; i++){
		tempVal=::Fisheries[DefaultSelection].get_total_catch(i);
		if(tempVal>maxVal)
			maxVal = tempVal;
		dataList.insert(tempVal);
	}
	maxVal = maxVal*1.2;
	setYAxisRange(long(0),long(maxVal));
}

#endif
