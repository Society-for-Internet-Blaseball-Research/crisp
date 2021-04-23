#ifdef _ZAPP_GUI_
#include <zapp.hpp>
#include "ZasTabDialogENH.h"
#include "ZatEditSliderDouble.h"


ZasTabDialogENH::ZasTabDialogENH(zWindow *w, zResId &rid) : ZatTabDialog(w,rid) {
}

ZasTabDialogENH::ZasTabDialogENH(zWindow *w, zSizer *siz, DWORD dw, const char *nt) : ZatTabDialog(w,siz,dw,nt) {
}
ZasTabDialogENH::~ZasTabDialogENH(){
	
}

void ZasTabDialogENH::drawCustomControls(){
	
	
	zGravSizer *invis;
	zStaticText *st;
//	ZatCheckBoxGroup *cbg;
	new zGravSizer(ZGRAV_TOP,zDimension(0,ZDefRowHeight),cbgContainer_);
	rcCustom_ = new ZatRowColumnBox(this, new zGravSizer(ZGRAV_MIDDLE,0,cbgContainer_));	
	new zGravSizer(ZGRAV_TOP,zDimension(0,ZMargin*3),rcCustom_->sizer());
	new zGravSizer(ZGRAV_BOTTOM,zDimension(0,ZMargin),rcCustom_->sizer());
	new zGravSizer(ZGRAV_LEFT,zDimension(ZMargin,0),rcCustom_->sizer());
	new zGravSizer(ZGRAV_RIGHT,zDimension(ZMargin,0),rcCustom_->sizer());
	rcCustom_->show();

	new zGravSizer(ZGRAV_BOTTOM,zDimension(0, 2),rcCustom_->sizer());
	invis = new zGravSizer(ZGRAV_BOTTOM,zDimension(0, ZDefRowHeight-2),rcCustom_->sizer());
	st = new zStaticText((zWindow *)rcCustom_,new zPercentSizer(ZGRAV_LEFT,100,100,invis));
	evControlRegistration_.notify(rc_->insert(st,0,0,ZAS_PARM,0));
	st->show();

	new zGravSizer(ZGRAV_BOTTOM,zDimension(0, 2),rcCustom_->sizer());
	invis = new zGravSizer(ZGRAV_BOTTOM,zDimension(0, ZDefRowHeight-2),rcCustom_->sizer());
	st = new zStaticText((zWindow *)rcCustom_,new zPercentSizer(ZGRAV_LEFT,100,100,invis));
	evControlRegistration_.notify(rc_->insert(st,1,0,ZAS_SMTAGE,0));
	st->show();

	new zGravSizer(ZGRAV_BOTTOM,zDimension(0, 2),rcCustom_->sizer());
	invis = new zGravSizer(ZGRAV_BOTTOM,zDimension(0, ZDefRowHeight-2),rcCustom_->sizer());
	st = new zStaticText((zWindow *)rcCustom_,new zPercentSizer(ZGRAV_LEFT,100,100,invis));
	evControlRegistration_.notify(rc_->insert(st,2,0,ZAS_BROODSTOCK,0));
	st->show();

}
#endif

