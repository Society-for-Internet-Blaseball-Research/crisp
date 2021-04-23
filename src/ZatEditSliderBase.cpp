#ifdef _ZAPP_GUI_
#include <zapp.hpp>
#include <intpack/zip.hpp>
#include <rw/cstring.h>
#include "ZatEditSliderBase.h"


ZatEditSliderBase::ZatEditSliderBase(zWindow *w, zSizer *siz, char *text, int baseId, int editSliderType) 
		: zPane(w,siz,WS_CHILD), lock_(0), baseId_(baseId), el_(NULL), editSliderType_(editSliderType), delta_(0){
		
		backgroundColor(zColor(ZCTRL_FILLER));
		st_ = new zStaticText(this, new zPercentSizer(ZGRAV_LEFT,100.0,25.0,sizer()), WS_CHILD | WS_VISIBLE | SS_CENTER, text,baseId);
		sb_ = new zScrollBarCtrl(this, new zPercentSizer(ZGRAV_MIDDLE,100.0,47.0,sizer()), SBS_HORZ | WS_CHILD | WS_VISIBLE ,NULL,baseId);
		sb_->info()->pos(0);
		ics_ = new ZatImConScroller(sb_,0);
		ics_->evScrollBar()->attach(this, &ZatEditSliderBase::_cbScrollBarChanged);
}

ZatEditSliderBase::~ZatEditSliderBase(){
	delete st_;
	delete sb_;
	delete ics_;
	if(el_)delete el_;

}

void ZatEditSliderBase::_cbScrollBarChanged(void *ptr, const int val){
	ZatEditSliderBase *zes = (ZatEditSliderBase *)ptr;
	zes->cbScrollBarChanged(val);
}

void ZatEditSliderBase::disable(void){
	sb_->disable();
	st_->disable();
	el_->disable();
}

void ZatEditSliderBase::enable(void){
	sb_->enable();
	st_->enable();
	el_->enable();
}

void ZatEditSliderBase::setText(char *str){
	if(!lock_){
		lock_=1;
		st_->text(str);
		lock_=0;
	}
}
#endif


