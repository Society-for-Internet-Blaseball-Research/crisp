#ifdef _ZAPP_GUI_
#include <zapp.hpp>
#include <intpack/zip.hpp>

#include "zcGraphMediator.h"
#include "ZatGraphDialog.h"

zcGraphMediator::zcGraphMediator(ZatGraphDialog *gd)
    : _gd(gd), _lock(0), _isData(0),_ref(0){
	
    _gu = ZasGraphUpdateMed::instance();
    RegisterEvents();
	
}
 
zcGraphMediator::~zcGraphMediator(){

}

void
zcGraphMediator::RegisterEvents(void){
    _gu->evGraphUpdate()->attach(this, &zcGraphMediator::_cbGraphUpdate);
    _gd->evRedraw()->attach(this, &zcGraphMediator::_cbRedraw);
    _gd->evPosition()->attach(this, &zcGraphMediator::_cbPosition);
    _gd->evRemove()->attach(this, &zcGraphMediator::_cbRemove);
    _gd->evZoom()->attach(this, &zcGraphMediator::_cbZoomIn);
    _gd->evDezoom()->attach(this, &zcGraphMediator::_cbZoomOut);
}

void
zcGraphMediator::unRegisterEvents(void){
    _gu->evGraphUpdate()->detach(this, &zcGraphMediator::_cbGraphUpdate);
    _gd->evRedraw()->detach(this, &zcGraphMediator::_cbRedraw);
    _gd->evPosition()->detach(this, &zcGraphMediator::_cbPosition);
    _gd->evZoom()->detach(this, &zcGraphMediator::_cbZoomIn);
    _gd->evRemove()->detach(this, &zcGraphMediator::_cbRemove);
    _gd->evDezoom()->detach(this, &zcGraphMediator::_cbZoomOut);

}

void
zcGraphMediator::setTitle(int index){
    _gd->setTitleLabel(
	"Mediator needs to override: virtual void setTitle");
}

void
zcGraphMediator::cbGraphUpdate(const int index, const int type){
    if(_gd->isActive() && _graphType == type){
		setTitle(index);
		if(dataList.entries())dataList.clear();
		getData();
		_gd->setDirt();
		cbRedraw();
    }
}

void
zcGraphMediator::setYAxisRange(long min, long max){
    yAxisType_ = ZAT_LONG;
    lY_[0] = min;
    lY_[1] = max;
    char yText[40];
    _gd->clearYAxisDivLabels();
    int divY = _gd->getYDivisions();
    if((max-min) < divY) divY = max-min;
    for (int i = divY; i >= 0 ;i--){
	sprintf(yText, "%d",
		min+long(double(max-min)*double(i)/double(divY)));
	_gd->addYAxisDivLabel(yText);
    }
    maxVal = double(max);
}

void
zcGraphMediator::setXAxisRange(long min, long max, double xDottedLine){
    xAxisType_ = ZAT_LONG;

    lX_[0] = min;
    lX_[1] = max;
    char xText[80];

	_gd->setXDottedLine( xDottedLine );

    _gd->clearXAxisDivLabels();

    int divX = _gd->getXDivisions();
    if((max-min) < divX || divX == 0) divX = max-min;
    for (int i = 0; i <= divX;i++){
		sprintf(xText, "%d",
			min+long(double(max-min)*double(i)/double(divX)));
		_gd->addXAxisDivLabel(xText);
    }

}

void
zcGraphMediator::setYAxisRange(double min, double max){
    yAxisType_ = ZAT_DOUBLE;

    dY_[0] = min;
    dY_[1] = max;
    char yText[40];
    _gd->clearYAxisDivLabels();
    int divY = _gd->getYDivisions();
    for (int i = divY; i >= 0 ;i--){
	sprintf(yText, "%.0f",
		(min+(max-min))*double(i)/double(divY));
	_gd->addYAxisDivLabel(yText);
    }
    maxVal = double(max);
}

void
zcGraphMediator::setXAxisRange(double min, double max, double xDottedLine){
    xAxisType_ = ZAT_DOUBLE;
    dX_[0] = min;
    dX_[1] = max;
    char xText[40];
    _gd->clearXAxisDivLabels();

	_gd->setXDottedLine( xDottedLine );

    int divX = _gd->getXDivisions();
    for (int i = 0; i < divX;i++){
	sprintf(xText, "%.0f", (min+(max-min))*float(i)/float(divX));
	_gd->addXAxisDivLabel(xText);
    }
}

void
zcGraphMediator::cbRedraw(const zPoint pos){
    _gd->drawAxies();
}

void
zcGraphMediator::cbRemove(){
	unRegisterEvents();
    evRemove.notify(this);
}

void
zcGraphMediator::cbPosition(const zPoint pos){
	   if(!_lock){
	_lock=1;
	double ypos = _gd->getYpercent(pos.y());
	char str[40];
	if(yAxisType_ == ZAT_DOUBLE)
	    sprintf(str, "%.2f", ypos*maxVal);
	else
	    sprintf(str, "%d", long(ypos*maxVal));
	_gd->setPositionYLabel(str);
	if(xAxisType_ == ZAT_DOUBLE) {
		double xpos = _gd->getXpercent( pos.x() );
	    sprintf(str, "%.2f", xpos*maxVal);
	}
	else
	    sprintf(str, "%d", lX_[0] + _gd->getXinterval( pos.x() ) );

	_gd->setPositionXLabel(str);
	_lock=0;
    }
}

void
zcGraphMediator::cbZoomOut(const zRect r){
    if(yAxisType_ == ZAT_DOUBLE)
	setYAxisRange(dY_[0],(dY_[1]*1.20));
    if(yAxisType_ == ZAT_LONG)
	setYAxisRange(lY_[0],long(double(lY_[1])*1.20));
    cbRedraw();
}

void
zcGraphMediator::cbZoomIn(const zRect r){
    if(yAxisType_ == ZAT_DOUBLE)
	setYAxisRange(dY_[0],(dY_[1]*0.8));
    if(yAxisType_ == ZAT_LONG)
	setYAxisRange(lY_[0],long(double(lY_[1])*0.8));
    cbRedraw();
}

void
zcGraphMediator::_cbZoomIn(void *msg, const zRect r){
    zcGraphMediator *zcg = (zcGraphMediator *)msg;
    zcg->cbZoomIn(r);
}

void
zcGraphMediator::_cbZoomOut(void *msg, const zRect r){
    zcGraphMediator *zcg = (zcGraphMediator *)msg;
    zcg->cbZoomOut(r);
}

void
zcGraphMediator::_cbGraphUpdate(void *msg, const int index, const int type){
    zcGraphMediator *zcg = (zcGraphMediator *)msg;
    zcg->cbGraphUpdate(index,type);
}

void
zcGraphMediator::_cbRemove(void *msg){
    zcGraphMediator *zcg = (zcGraphMediator *)msg;
    zcg->cbRemove();
}

void
zcGraphMediator::_cbRedraw(void *msg, const zPoint pos){
    zcGraphMediator *zcg = (zcGraphMediator *)msg;
    zcg->cbRedraw(pos);
}

void
zcGraphMediator::_cbPosition(void *msg, const zPoint pos){
    zcGraphMediator *zcg = (zcGraphMediator *)msg;
    zcg->cbPosition(pos);
}







#endif
