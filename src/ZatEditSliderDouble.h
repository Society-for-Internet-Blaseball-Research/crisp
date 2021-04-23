#ifdef _ZAPP_GUI_
#ifndef _ZatEditSliderDouble_h_
#define _ZatEditSliderDouble_h_

#include "ZatEditSliderBase.h"
#include "implicit.h"

typedef utImplicit2<const double, const int> signalDoubleInt;

class ZatEditSliderDouble : public ZatEditSliderBase {
	
	double rDoubleMin_, rDoubleMax_, doubleValue_;
	signalDoubleInt evDoubleChanged_;

	// internal conversion functions
	int getPos(double newPos);
	double getDoubleValue(int pos);

  public:

	ZatEditSliderDouble(zWindow *w, zSizer *siz, char *text, int baseId, double rMin, double rMax); 	
	~ZatEditSliderDouble();

	inline double doubleValue() const { return doubleValue_; }
	
	void setRange(double r1, double r2);
    void setValue(double val);

	//Events and event notifiers
    signalDoubleInt *evDoubleChanged() { return &evDoubleChanged_; }

	int cbEditLineChanged(zEvent *);
	void cbScrollBarChanged(const int val);

};


#endif    
#endif    
