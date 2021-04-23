#ifdef _ZAPP_GUI_

#include "ZatImplicitScroller.h"

ZatImplicitScroller::ZatImplicitScroller(zScrollBarCtrl *sbc, zEditLine *el, double rMin, double rMax, int divisions) 
		: zControlScroller(sbc), rangeMax(rMax), rangeMin(rMin), _el(el), _sbc(sbc), _lock(0),_delta(0), _divisions(divisions){

	_sbc->info()->limits(zRange(0,_divisions));
	_sbc->info()->pos(0);
	_sbc->info()->pageDelta(_divisions/10);
	_sbc->scroller(this);
	_el->show();
	_sbc->show();

}

int ZatImplicitScroller::setSliderPosition(const double newPosition){	
	if(!_lock){	
		_lock=1;
		double newpos;
		char fpstr[60];
		if(newPosition < rangeMin)
			newpos = rangeMin;
		else if(newPosition > rangeMax)
			newpos = rangeMax;
		else 
			newpos = newPosition;

		double p = newpos-rangeMin;
		double rm = rangeMax-rangeMin;
		double val = p/rm;
		_sbc->info()->pos(int(val*double(_divisions)));
		sprintf(fpstr, "%2f",newpos);
		dvalue = newpos - value;
		value = newpos;
		if(_delta){
			sbEvent.notify(dvalue,_sbc->ctrlId());
		}
		else{
			sbEvent.notify(value,_sbc->ctrlId());
		}
		_el->text(fpstr);
		_sbc->setDirty();
		_sbc->update();
		_lock=0;
	}
	return 0;
}
int ZatImplicitScroller::horzThumbPos(){
	if(!_lock){	
		_lock=1;
		number = (double(_sbc->info()->pos())/double(_divisions));   
		nvalue = rangeMin + (rangeMax-rangeMin)*number;
		sprintf(buf,"%2f",nvalue);
		_el->text(buf);
		dvalue = nvalue - value;
		value = nvalue;
		if(_delta){
			sbEvent.notify(dvalue,_sbc->ctrlId());
		}
		else{
			sbEvent.notify(value,_sbc->ctrlId());
		}
		_lock=0;
	}
	return 1;
}

int ZatImplicitScroller::horzThumbTrack(){ 
	return 1;
}
#endif


