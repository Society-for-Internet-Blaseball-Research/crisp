#ifdef _ZAPP_GUI_
#ifndef _ZatImplicitScroller_
#define _ZatImplicitScroller_

#include <zapp.hpp>
#include "string.h"
#include "implicit.h"
typedef utImplicit2<const double, const int> signal_doubleInt;

class ZatImplicitScroller : public zControlScroller {
	
	zScrollBarCtrl *_sbc;
	zEditLine *_el;
	double value, nvalue, dvalue, number, rangeMax, rangeMin;
	int _delta,_divisions;
	char buf[20];
	signal_doubleInt sbEvent;
	int _lock;

  public:
   	ZatImplicitScroller(zScrollBarCtrl *sbc, zEditLine *el, double rMin, double rMax, int divisions=10000);
	
	int setSliderPosition(const double newpos);
	void setDelta(int delta){_delta = delta;}
	signal_doubleInt *isRegisterEvent(){ return &sbEvent; }
	virtual int horzThumbPos();
	virtual int horzThumbTrack();
	

};

#endif
#endif
