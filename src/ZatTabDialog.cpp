#ifdef _ZAPP_GUI_
#include <zapp.hpp>
#include <intpack/zip.hpp>
#include "ZatDefines.h"
#include "ZatDialogConstants.h"
#include "ZatRowColumnBox.h"
#include "ZatCheckBoxGroup.h"
#include "ZatEditSliderDouble.h"
#include "ZatEditSliderLong.h"
#include "ZatTabDialog.h"

ZatTabDialog::ZatTabDialog(zWindow *w, zResId &rid) : ZatDialogBase(w,rid), tc_(NULL) {
}

ZatTabDialog::ZatTabDialog(zWindow *w, zSizer *siz, DWORD dw, const char *nt) : ZatDialogBase(w,siz,dw,nt), tc_(NULL) {
}

ZatTabDialog::~ZatTabDialog(){ }
	
int ZatTabDialog::drawDialog(unsigned topMargin){
	
	if(topMargin)topMargin_ = topMargin;
	//Resizes the window to fit the tab control, default buttons, and a top margin for custom dialog controls.
	zRect parentRect, parentIntRect;
	parent()->getExterior(parentRect);
	getInterior(parentIntRect);
	move(ZDefDialogOffSet+parentRect.left(),ZDefDialogOffSet+parentRect.top(),parentIntRect.width()+ZMargin*2,ZDefRowHeight*numItemsPerTab_+ZMarginBottom+ZMarginTop+10+topMargin_+8*ZMargin);
	numTabs_ = numItems_/(numItemsPerTab_-1);
	if(numItems_%(numItemsPerTab_-1))numTabs_++;
	show();
	buildDefaultButtons();
	buildTabControl(new zGravSizer(ZGRAV_MIDDLE,0,sizer()));
	buildRowColumnControl(new zGravSizer(ZGRAV_MIDDLE,0,tc_->sizer()));
	return 1;
}

int ZatTabDialog::buildRowColumnControl(zSizer *szr){
	rc_ = new ZatRowColumnBox((zWindow *)tc_,szr);
	new zGravSizer(ZGRAV_TOP,zDimension(0,ZMargin*3),rc_->sizer());
	new zGravSizer(ZGRAV_LEFT,zDimension(ZMargin,0),rc_->sizer());
	new zGravSizer(ZGRAV_RIGHT,zDimension(ZMargin,0),rc_->sizer());
	return 1;
}

int ZatTabDialog::buildTabControl(zSizer *szr){

	tc_ = new ZatImpTabCtrl(this, szr);
	new zGravSizer(ZGRAV_BOTTOM,zDimension(0, ZMargin),tc_->sizer());
	new zGravSizer(ZGRAV_TOP,zDimension(0, ZMargin),tc_->sizer());
	new zGravSizer(ZGRAV_RIGHT,zDimension(ZMargin,0),tc_->sizer());
	new zGravSizer(ZGRAV_LEFT,zDimension(ZMargin,0),tc_->sizer());
	tc_->evPageChange()->attach(this, &ZatTabDialog::_cbTabSelected);
	for(size_t i=0;i<tabNames_.entries();i++)
		appendTab(i,tabNames_[i].data());
	if(tabNames_.entries())tc_->select(0);
	tc_->show();
	return 1;
}

void ZatTabDialog::drawStandardLayout(int sliderType){
	char *deltaValue[1] = {"Delta"};
	ZatEditSliderDouble *esd;
	ZatEditSliderLong *esl;
	ZatCheckBoxGroup *cbg;
	zGravSizer *invis;
	invis = new zGravSizer(ZGRAV_TOP,zDimension(0, ZDefRowHeight-ZMargin),rc_->sizer());
	cbg = new ZatCheckBoxGroup((zWindow *)rc_,new zPercentSizer(ZGRAV_LEFT,100,50,invis), ZAT_CHECKBOXDELTA, deltaValue,1);
	evControlRegistration_.notify(rc_->insert(cbg,0,0,ZAT_CHECKBOXDELTA));
	cbg = new ZatCheckBoxGroup((zWindow *)rc_,new zPercentSizer(ZGRAV_RIGHT,(float)100,(float)(10*cbgBoxName_.entries()),invis), ZAT_CHECKBOXALL, &cbgBoxName_);
	evControlRegistration_.notify(rc_->insert(cbg,0,1,ZAT_CHECKBOXALL));
	for(size_t i=1;i<numItemsPerTab_;i++){
		new zGravSizer(ZGRAV_TOP,zDimension(0, 2),rc_->sizer());
		invis = new zGravSizer(ZGRAV_TOP,zDimension(0, ZDefRowHeight-2),rc_->sizer());
		if(sliderType == ZAT_DOUBLEEDITSLIDER){
			esd = new ZatEditSliderDouble((zWindow *)rc_,new zPercentSizer(ZGRAV_LEFT,(float)100,(float)(95-10*cbgBoxName_.entries()),invis)," ",i-1,0.0,2.0);
			evControlRegistration_.notify(rc_->insert(esd,i,0,i-1,ZAT_CHECKBOXDELTA));
		}
		else if(sliderType == ZAT_LONGEDITSLIDER){
			esl = new ZatEditSliderLong((zWindow *)rc_,new zPercentSizer(ZGRAV_LEFT,(float)100,(float)(95-10*cbgBoxName_.entries()),invis)," ",i-1,0,2);
			evControlRegistration_.notify(rc_->insert(esl,i,0,i-1,ZAT_CHECKBOXDELTA));
		}
		cbg = new ZatCheckBoxGroup((zWindow *)rc_,new zPercentSizer(ZGRAV_RIGHT,(float)100,(float)(10*cbgBoxName_.entries()),invis),i-1, &cbgBoxName_);
		evControlRegistration_.notify(rc_->insert(cbg,i,1,i-1,ZAT_CHECKBOXALL));
	}
}

void ZatTabDialog::appendTab(int tabIndex, const char *tabName){
	if(tabIndex < (int)numTabs_){
		tc_->appendTab(new zTab(tc_,tabIndex, RWCString(tabName)));
	}
}


void ZatTabDialog::setCheckBox(unsigned box, unsigned checked, unsigned id){
	size_t item = ((id+((numItemsPerTab_-1)*currentIndex_))+box*numItems_);
	if(item < cbgTags_.length())
		cbgTags_[item] = checked;
}

int ZatTabDialog::isBoxChecked(unsigned item, unsigned box=0){
	size_t i = (item+((numItemsPerTab_-1)*currentIndex_))+box*numItems_;
	if(i < cbgTags_.length())
		return cbgTags_[i];
	return -1;
}


void ZatTabDialog::cbTabSelected(const int newIndex, const int oldIndex){
	currentIndex_ = newIndex;
	evTabSelected_.notify(newIndex);
}

void ZatTabDialog::_cbTabSelected(void *vp, const int newIndex, const int oldIndex){

	ZatTabDialog *ztd = (ZatTabDialog *)vp;
	ztd->cbTabSelected(newIndex, oldIndex);

}
#endif
