#ifdef _ZAPP_GUI_
#ifndef _ZatEditSliderLong_h_
#define _ZatEditSliderLong_h_

#include "ZatEditSliderBase.h"
#include "implicit.h"

typedef utImplicit2<const long, const int> signalLongInt;

class ZatEditSliderLong : public ZatEditSliderBase {

	long rLongMin_, rLongMax_, longValue_;
	signalLongInt evLongChanged_;

	// internal conversion functions
	int getPos(long newPos);
	long getLongValue(int pos);

  public:

	ZatEditSliderLong(zWindow *w, zSizer *siz, char *text, int baseId, long rMin, long rMax); 
	~ZatEditSliderLong();

	inline long longValue() const { return longValue_; } 
	
	void setRange(long r1, long r2);
	void setValue(long val);

	//Events and event notifiers
	signalLongInt *evLongChanged() { return &evLongChanged_; }

	int cbEditLineChanged(zEvent *);
	void cbScrollBarChanged(const int val);

};


#endif    
#endif    
