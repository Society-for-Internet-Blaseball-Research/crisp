#ifdef _ZAPP_GUI_
#include <zapp.hpp>
#include "ZasTabDialogCeilings.h"
#include "ZatEditSliderLong.h"
#include "ZatCheckBoxGroup.h" 

ZasTabDialogCeilings::ZasTabDialogCeilings(zWindow *w, zResId &rid) : ZatTabDialog(w,rid) {
}
ZasTabDialogCeilings::ZasTabDialogCeilings(zWindow *w, zSizer *siz, DWORD dw, const char *nt) : ZatTabDialog(w,siz,dw,nt) {
}
ZasTabDialogCeilings::~ZasTabDialogCeilings(){
}

void ZasTabDialogCeilings::drawCustomControls(){
	char *deltaValue[1] = {"Delta"};
	char *forced[1] = {"Forced"};
	
	ZatEditSliderLong *esl;
	ZatCheckBoxGroup *cbg;
	zGravSizer *invis;

	invis = new zGravSizer(ZGRAV_TOP,zDimension(0, ZDefRowHeight-ZMargin),rc_->sizer());
	cbg = new ZatCheckBoxGroup((zWindow *)rc_,new zPercentSizer(ZGRAV_LEFT,100,50,invis), ZAT_CHECKBOXDELTA, deltaValue,1);
	evControlRegistration_.notify(rc_->insert(cbg,0,0,ZAT_CHECKBOXDELTA));
	cbg = new ZatCheckBoxGroup((zWindow *)rc_,new zPercentSizer(ZGRAV_RIGHT,100,20,invis),ZAS_FORCED, forced, 1);
	evControlRegistration_.notify(rc_->insert(cbg,0,2,ZAS_FORCED));
	cbg = new ZatCheckBoxGroup((zWindow *)rc_,new zPercentSizer(ZGRAV_RIGHT,100,20,invis), ZAT_CHECKBOXALL, &cbgBoxName_);
	evControlRegistration_.notify(rc_->insert(cbg,0,1,ZAT_CHECKBOXALL));

	for(size_t i=1;i<numItemsPerTab_;i++){
		new zGravSizer(ZGRAV_TOP,zDimension(0, 2),rc_->sizer());
		invis = new zGravSizer(ZGRAV_TOP,zDimension(0, ZDefRowHeight-2),rc_->sizer());
		esl = new ZatEditSliderLong((zWindow *)rc_,new zPercentSizer(ZGRAV_LEFT,(float)100,(float)(78-10*cbgBoxName_.entries()),invis)," ",i-1,0,2);
		evControlRegistration_.notify(rc_->insert(esl,i,0,i-1,ZAT_CHECKBOXDELTA));
		cbg = new ZatCheckBoxGroup((zWindow *)rc_,new zPercentSizer(ZGRAV_RIGHT,100,20,invis),i-1, forced, 1);
		evControlRegistration_.notify(rc_->insert(cbg,i,2,i-1,ZAS_FORCED));
		cbg = new ZatCheckBoxGroup((zWindow *)rc_,new zPercentSizer(ZGRAV_RIGHT,(float)100,(float)(10*cbgBoxName_.entries()),invis),i-1, &cbgBoxName_);
		evControlRegistration_.notify(rc_->insert(cbg,i,1,i-1,ZAT_CHECKBOXALL));
	}
}
#endif

