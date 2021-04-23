#ifdef _ZAPP_GUI_
#ifndef _ZatImConScroller_
#define _ZatImConScroller_

#include <zapp.hpp>
#include "implicit.h"
typedef utImplicit1<const int> signalInt;

class ZatImConScroller : public zControlScroller {
	
	signalInt evScrollBar_;
	int lock_;
	int activeTracking_;
	zScrollBarCtrl *sbc_;

  public:

	ZatImConScroller(zScrollBarCtrl *sbc, int activeTracking = 0) : zControlScroller(sbc), activeTracking_(activeTracking), sbc_(sbc), lock_(0) {
		sbc->scroller(this);
	}
	signalInt *evScrollBar(){ return &evScrollBar_; }

	int activeTracking(){return activeTracking_;}
	void setActiveTracking(int at){ activeTracking_ = at; }

	virtual int horzThumbPos(){
		if(!lock_){	
			lock_=1;
			evScrollBar_.notify(sbc_->info()->pos());
			lock_=0;
		}
		return 1;
	}

	virtual int horzThumbTrack(){
		if(!lock_){	
			lock_=1;
			if(activeTracking_)
				evScrollBar_.notify(sbc_->info()->pos());
			lock_=0;
		}
		return 1;
	}
	

};


#endif
#endif


