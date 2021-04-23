#ifdef _ZAPP_GUI_
#include <zapp.hpp>
#include <intpack/zip.hpp>
#include <intpack/ziph/statline.hpp>
#include <iostream.h>
#include "ZatMapPane.h"


ZatMapPane::ZatMapPane(zWindow *p) 
	: zPane(p,new zGravSizer(ZGRAV_MIDDLE,0,p->sizer())), mouseOn_(0), isPrintMode_(0) {
   
}

int ZatMapPane::draw(zDrawEvt *de) {
    evDraw_.notify(zPoint(0,0));
    return 1;
}


int ZatMapPane::printMap(zEvent *) {

#ifdef WIN32    
    isPrintMode_ = 1;
    draw(0);
    isPrintMode_ = 0;
#else
    zMessage *zm=NULL;
    zm = new zMessage(this, "Printing not supported under SUNOS",
		      "Print Message", MB_OK);
    delete zm;
#endif
    
    return 0;
}

int ZatMapPane::print(zPrinterDisplay *pd, zRect *) {
    return 0;
}

int ZatMapPane::mouseButtonDown(zMouseClickEvt *ev){

    if(ev->isButtonDown(1)){
		mouseOn_=1;
		p0_ = p1_ = p2_ = ev->pos();
		bd_ = canvas()->drawMode(R2XorPen);
		captureMouse();
    }
    return 1;
}
int ZatMapPane::mouseButtonUp(zMouseClickEvt *ev){
	const int minZoomSize = 10;
    if(ev->isButton(1) && mouseOn_){
		if(p0_ == p1_){
			releaseMouse();
			evSelect_.notify(ev->pos(),1);
			return 1;
		}
		drawSelect();
		p0_ = p2_ = ev->pos();
		canvas()->drawMode(bd_);
		mouseOn_=0;
		if(p1_.x() == p0_.x() || p1_.y() == p0_.y()){
			return 1;
		}
		else if(p1_.x()+minZoomSize < p0_.x()){
		    if(p1_.y()+minZoomSize < p0_.y()) 
				evZoom_.notify(zRect(p1_,p0_));
			else if(p1_.y() > p0_.y()+minZoomSize) 
				evZoom_.notify(zRect(p1_.x(),p0_.y(),p0_.x(),p1_.y()));
		}
		else if(p1_.x() > p0_.x()+minZoomSize){
		    if(p1_.y() > p0_.y()+minZoomSize) 
				evZoom_.notify(zRect(p0_,p1_));
			else if(p1_.y()+minZoomSize < p0_.y())   
				evZoom_.notify(zRect(p0_.x(),p1_.y(),p1_.x(),p0_.y()));
		}
    }
    else if(ev->isButton(2)){
		releaseMouse();
		evSelect_.notify(ev->pos(),2);
		return 1;
	}
	releaseMouse();
    return 1;
}


int ZatMapPane::mouseMove(zMouseMoveEvt *ev){

    if(ev->isButtonDown(1) && mouseOn_){
		drawSelect();
		p0_ = ev->pos();
		drawSelect();
    }
	else{
		evPosition_.notify(ev->pos());
	}
    return 1;
}

void ZatMapPane::drawSelect(){
	
	canvas()->lock();
    canvas()->pushPen(new zPen(zColor(BLACK),Solid,0));
  
    if(p1_.x() == p0_.x() || p1_.y() == p0_.y()){
		canvas()->moveTo(p1_);
		canvas()->lineTo(p0_);
	}
    else if(p1_.x() < p0_.x()){
		if(p1_.y()<p0_.y())   
			canvas()->rectangle(p1_,p0_);
		else    
			canvas()->rectangle(p1_.x(),p0_.y(),p0_.x(),p1_.y());
    }
    else{
		if(p1_.y() > p0_.y())    canvas()->rectangle(p0_,p1_);
		else    canvas()->rectangle(p0_.x(),p1_.y(),p1_.x(),p0_.y());
    }
	
	
	delete canvas()->popPen();
	canvas()->unlock();

}

int ZatMapPane::size(zSizeEvt *) {
	canvas()->setDirty();
	return 1;
}









#endif
