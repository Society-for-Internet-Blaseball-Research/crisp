#ifdef _ZAPP_GUI_
#ifndef _ZatEditSliderBase_h_
#define _ZatEditSliderBase_h_

//This is an abstract base class for edit sliders.  An edit slider
//is a control with three windows: a static window box, a scrollbar/slider, and
//an edit window.  The derived base classes can then specify the type of
//data (long, double, unsigned, etc).

#include "ZatImConScroller.h"
#include "ZatDefines.h"

class ZatEditSliderBase : public zPane {

  protected:
    zScrollBarCtrl *sb_;
	ZatImConScroller *ics_;
    zStaticText *st_;
    zEditLine *el_;

    int baseId_;
    int lock_;
	int delta_;
	int editSliderType_; //type of edit slider, ZAT_LONGEDITSLIDER, ZAT_DOUBLEEDITSLIDER
    long divSize_;  //number of divisions across the range of the scroll bar.

  public:

	ZatEditSliderBase(zWindow *w, zSizer *siz, char *text, int baseId, int editSliderType); 	
	virtual ~ZatEditSliderBase();

	inline int baseId() const { return baseId_; }
	inline int delta() const { return delta_; }
	inline int editSliderType() const { return editSliderType_; }
	
	virtual void setText(char *str);
	virtual void disable(void);
	virtual void enable(void);

	virtual int cbEditLineChanged(zEvent *) = 0;
	virtual void cbScrollBarChanged(const int val) = 0;
	static void _cbScrollBarChanged(void *ptr, const int val);

	void setDelta(int delta){delta_ = delta;}
	void setActiveUpdates(int onOff){ ics_->setActiveTracking(onOff); }
};


#endif
#endif

