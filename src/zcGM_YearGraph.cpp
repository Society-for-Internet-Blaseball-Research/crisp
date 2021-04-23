#ifdef _ZAPP_GUI_
#include <zapp.hpp>
#include <intpack/zip.hpp>
#include "zcGM_YearGraph.h"
#include "globals.h"

zcGM_YearGraph::zcGM_YearGraph(ZatGraphDialog *gd) : zcGraphMediator(gd) {
}

void
zcGM_YearGraph::drawLabels(void){

    maxVal=0.0;	
    getData();
    _isData = 1;
	setXAxisRange(long(::Chronographer->base_year()),
		long(::Chronographer->base_year()+Chronographer->nyears()-1),
		(::Chronographer->sim_start_year() - 0.5)
		                                    / (::Chronographer->nyears()-1));
}

void
zcGM_YearGraph::drawLines(void){
    if(maxVal == 0.0 || !_isData){
	//	zMessage *NoData = new zMessage(_gd, "I don't have any data, have you run the model yet?", "Graph Message", MB_OK);
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
	    //if((dataList[i+ny*j] < maxVal) && (dataList[1+i+ny*j] < maxVal))
		_gd->drawLineSegment(
		    zPoint(r.left()+(int)(i*incr),
			   int(double(1.0-dataList[i+ny*j]/maxVal)*
			       double(r.bottom()-r.top()))+r.top()),
		    zPoint(r.left()+(int)((i+1)*incr),
			   int(double(1.0-dataList[i+1+ny*j]/maxVal)*
			       double(r.bottom()-r.top()))+r.top()));
	}
    }
    _gd->unlockCanvas();
}

void
zcGM_YearGraph::getData(void){

}
/*
void
zcGM_YearGraph::cbPosition(const zPoint pos){
    if(!_lock){
	_lock=1;
	double ypos = _gd->getYpercent(pos.y());
	double xpos = _gd->getXpercent(pos.x());
	char str[40];
	if(yAxisType_ == ZAT_DOUBLE)
	    sprintf(str, "%.2f", ypos*maxVal);
	else
	    sprintf(str, "%d", long(ypos*maxVal));
	_gd->setPositionYLabel(str);
	if(xAxisType_ == ZAT_DOUBLE)
	    sprintf(str, "%.2f", xpos*maxVal);
	else
	    sprintf(str, "%d", long(xpos*maxVal));
	_gd->setPositionXLabel(str);
	_lock=0;
    }
}
*/
void
zcGM_YearGraph::cbRedraw(const zPoint pos){
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



