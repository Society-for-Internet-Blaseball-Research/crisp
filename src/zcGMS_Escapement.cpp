#ifdef _ZAPP_GUI_
#include <zapp.hpp>
#include <intpack/zip.hpp>
#include "zcGMS_Escapement.h"
#include "globals.h"

extern int DefaultStock;

zcGMS_Escapement::zcGMS_Escapement(ZatGraphDialog *gd) : zcGM_YearGraph(gd) {
	drawLabels();
}

void zcGMS_Escapement::drawLabels(void){

	setTitle(DefaultStock);
	zcGM_YearGraph::drawLabels();
	_gd->addLegendLabel("Age 2 (jacks)", new zColor(RED));
	_gd->addLegendLabel("Age 3", new zColor(GREEN));
	_gd->addLegendLabel("Age 4", new zColor(BLUE));
	_gd->addLegendLabel("Age 5", new zColor(BLACK));
	_gd->addLegendLabel("Total Adult Esc (Age 3-5)", new zColor(GRAY));

	cbRedraw();

}
void zcGMS_Escapement::setTitle(int index){
	if(index < Stocks.num()){
	    char title[80];
		DefaultSelection = index;
		sprintf(title, "Escapement, %s Stock", ::Stocks[DefaultSelection].get_name());
		_gd->setTitleLabel(title);
	}
}
void zcGMS_Escapement::getData(void){

	maxVal=0.0;
	double tempVal;
	int i,j;
	int ny = Chronographer->nyears();
	for (Age age = FIRST_HV_AGE; age <= age.top(); age++){
		for (i = 0; i < ny; i++){
					tempVal=::Stocks[DefaultSelection].get_escapement(age,i);
			if(tempVal>maxVal)
				maxVal = tempVal;
			dataList.insert(tempVal);
		}
	}
	int deny = dataList.entries()/ny;
	for (i = 0; i < ny; i++){
		tempVal = 0.0;
		for(j=0;j<deny;j++)
			tempVal += dataList[i+j*ny];
		if(tempVal>maxVal)
			maxVal = tempVal;
		dataList.insert(tempVal);
	}
	maxVal = maxVal*1.2;
	setYAxisRange(long(0),long(maxVal));
}

#endif
