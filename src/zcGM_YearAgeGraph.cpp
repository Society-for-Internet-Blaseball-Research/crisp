#ifdef _ZAPP_GUI_
#include <zapp.hpp>
#include <intpack/zip.hpp>
#include "globals.h"
#include "zcGM_YearAgeGraph.h"


zcGM_YearAgeGraph::zcGM_YearAgeGraph(ZatGraphDialog *gd) : zcGraphMediator(gd) {
}

void zcGM_YearAgeGraph::drawLabels(void){

	maxVal=0.0;	
	getData();
	_isData = 1;
	setXAxisRange(long(::Chronographer->base_year()),
		long(::Chronographer->base_year()+Chronographer->nyears()-1),
		(::Chronographer->sim_start_year() - 0.5)
		                                / (::Chronographer->nyears()-1));
	
	_gd->addLegendLabel("Age 2", new zColor(RED));
	_gd->addLegendLabel("Age 3", new zColor(GREEN));
	_gd->addLegendLabel("Age 4", new zColor(BLUE));
	_gd->addLegendLabel("Age 5", new zColor(BLACK));
	_gd->addLegendLabel("Total", new zColor(GRAY));
}

void zcGM_YearAgeGraph::drawLines(void){
	if(maxVal == 0.0 || !_isData){
//		zMessage *NoData = new zMessage(_gd, "I don't have any data, have you run the model yet?", "Graph Message", MB_OK);
		return;
	}
		
	zRect r = _gd->getGraphRegion();
	
	int ny = Chronographer->nyears();
	double incr = double(r.right()-r.left())/(ny-1);
	int i;
	size_t j;

	_gd->lockCanvas();
	for(j = 0; j < dataList.entries()/ny; j++){
		_gd->setCurrentPen(j);
		for (i = 0; i < ny-1; i++){
		//	if((dataList[i+ny*j] < maxVal) && (dataList[1+i+ny*j] < maxVal))
				_gd->drawLineSegment(
				zPoint(r.left()+(int)(i*incr),
				       int(double(1.0-dataList[i+ny*j]/maxVal)*double(r.bottom()-r.top()))+r.top()),
				zPoint(r.left()+(int)((i+1)*incr),
				       int(double(1.0-dataList[i+1+ny*j]/maxVal)*double(r.bottom()-r.top()))+r.top()));
		}
	}
	_gd->unlockCanvas();
}

void zcGM_YearAgeGraph::getData(void){
	
	maxVal=0.0;
	double tempVal;
	int i,j;
	int ny = Chronographer->nyears();
	for (Age age = FIRST_HV_AGE; age <= age.top(); age++){
		for (i = 0; i < ny; i++){
					tempVal=getDataItem(i,age);
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

double zcGM_YearAgeGraph::getDataItem(int year, Age age){
	return 0.0;
}

void zcGM_YearAgeGraph::cbPosition(const zPoint pos){
	if(!_lock){
		_lock=1;
		double ypos = _gd->getYpercent(pos.y());
		char str[40];
		sprintf(str, "%.2f", ypos*maxVal);
		_gd->setPositionYLabel(str);
		_lock=0;
	}
}

void zcGM_YearAgeGraph::cbRedraw(const zPoint pos){
	if(!_lock){
		_lock=1;
		_gd->buildDisplay();
		_gd->drawGraphDialog();
		drawLines();
		_gd->copyDisplay();
		_lock=0;
	}
}
#endif
