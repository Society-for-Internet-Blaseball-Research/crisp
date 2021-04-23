#ifdef _ZAPP_GUI_
#include <zapp.hpp>
#include <intpack/zip.hpp>
#include "zcGMS_TrueTermRun.h"
#include "globals.h"

extern int DefaultStock;

zcGMS_TrueTermRun::zcGMS_TrueTermRun(ZatGraphDialog *gd) : zcGM_YearGraph(gd) {
	drawLabels();
}

void zcGMS_TrueTermRun::drawLabels(void){

	setTitle(DefaultStock);
    zcGM_YearGraph::drawLabels();

	_gd->addLegendLabel("Age 3", new zColor(GREEN));
	_gd->addLegendLabel("Age 4", new zColor(BLUE));
	_gd->addLegendLabel("Age 5", new zColor(BLACK));
	_gd->addLegendLabel("Total", new zColor(GRAY));

	cbRedraw();

}
void zcGMS_TrueTermRun::setTitle(int index){
	if(index < Stocks.num()){
	    char title[80];
		DefaultSelection = index;
		sprintf(title, "True Term Run, %s Stock", ::Stocks[DefaultSelection].get_name());
		_gd->setTitleLabel(title);
	}
}
void zcGMS_TrueTermRun::getData(void){

	maxVal=0.0;
	double tempVal;
	int i,j;
	int ny = Chronographer->nyears();
	for (Age age = AGE3; age <= age.top(); age++){
		for (i = 0; i < ny; i++){
					tempVal=::Stocks[DefaultSelection].get_true_term_run(age,i);
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
