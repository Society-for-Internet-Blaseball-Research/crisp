#ifdef _ZAPP_GUI_
#include <zapp.hpp>
#include <intpack/zip.hpp>
#include "ZatDefines.h"
#include "ZatDialogConstants.h"
#include "ZatRowColumnBox.h"
#include "ZatEditSliderLong.h"
#include "ZatEditSliderDouble.h"
#include "ZatCheckBoxGroup.h"
#include "ZatDialogBase.h"

ZatDialogBase::ZatDialogBase(zWindow *w, zResId &rid) : zDialogFrame(w,rid), rc_(NULL) {
	deleteOnClose(TRUE);
    backgroundColor(zColor(ZCTRL_FILLER));
	cmbStatic_[0]=NULL; 
	cmbStatic_[1]=NULL; 
	cbgContainer_=NULL;
	numFixedItems_ = 0;
}

ZatDialogBase::ZatDialogBase(zWindow *w, zSizer *siz, DWORD dw, const char *nt) : zDialogFrame(w,siz,dw,nt), rc_(NULL) {
	deleteOnClose(TRUE);
    backgroundColor(zColor(ZCTRL_FILLER));
	cmbStatic_[0]=NULL; 
	cmbStatic_[1]=NULL;
	cbgContainer_=NULL;
	numFixedItems_ = 0;
}

ZatDialogBase::~ZatDialogBase(){ 
}
void ZatDialogBase::addComboBoxText(const char *text, unsigned box){
	cmbStatic_[box]->add(text);
}
void ZatDialogBase::addComboBox(unsigned box){
	if(box)
		cmbStatic_[1] = new zComboBoxStatic(this, IDC_COMBOBOX2); //= new zComboBoxStatic(this, new zPercentSizer(ZGRAV_RIGHT,100,45,cbgContainer_),WS_VSCROLL | WS_CHILD | WS_TABSTOP | CBS_DROPDOWN,NULL,IDC_COMBOBOX2);
	else
		cmbStatic_[0] = new zComboBoxStatic(this, IDC_COMBOBOX1); //= new zComboBoxStatic(this, new zPercentSizer(ZGRAV_LEFT,100,45,cbgContainer_),WS_VSCROLL | WS_CHILD | WS_TABSTOP | CBS_DROPDOWN,NULL,IDC_COMBOBOX1);
}
	
int ZatDialogBase::selectComboBox(int i, unsigned box){ 
	if((i!=-1) && (!cmbStatic_[box]->count() || (i >= cmbStatic_[box]->count()))) return 0;
	if(i!=-1)return cmbStatic_[box]->selection(i);
	return cmbStatic_[box]->selection();
}

int ZatDialogBase::buildRowColumnControl(zSizer *szr){
	rc_ = new ZatRowColumnBox(this,szr);
	new zGravSizer(ZGRAV_TOP,zDimension(0,ZMargin*3),rc_->sizer());
	new zGravSizer(ZGRAV_BOTTOM,zDimension(0,ZMargin),rc_->sizer());
	new zGravSizer(ZGRAV_LEFT,zDimension(ZMargin,0),rc_->sizer());
	new zGravSizer(ZGRAV_RIGHT,zDimension(ZMargin,0),rc_->sizer());
	return 1;
}
	
int ZatDialogBase::drawDialog(unsigned topMargin){
	
	if(topMargin)topMargin_ = topMargin;
	
	zRect parentRect, parentIntRect;
	parent()->getExterior(parentRect);
	getInterior(parentIntRect);
	move(ZDefDialogOffSet+parentRect.left(),ZDefDialogOffSet+parentRect.top(),parentIntRect.width()+ZMargin*2,ZDefRowHeight*numItems_+ZMarginBottom+ZMarginTop+topMargin_+8*ZMargin);
	show();
	buildDefaultButtons();
	buildRowColumnControl(new zGravSizer(ZGRAV_MIDDLE,0,sizer()));
	return 1;
}

void ZatDialogBase::drawStandardLayout(int sliderType){
	char *deltaValue[1] = {"Delta"};
	ZatEditSliderDouble *esd;
	ZatEditSliderLong *esl;
	ZatCheckBoxGroup *cbg;
	zGravSizer *invis;
	invis = new zGravSizer(ZGRAV_TOP,zDimension(0, ZDefRowHeight-ZMargin),rc_->sizer());
	cbg = new ZatCheckBoxGroup((zWindow *)rc_,new zPercentSizer(ZGRAV_LEFT,100,50,invis), ZAT_CHECKBOXDELTA, deltaValue,1);
	evControlRegistration_.notify(rc_->insert(cbg,0,0,ZAT_CHECKBOXDELTA));
	if(cbgBoxName_.entries()){
		cbg = new ZatCheckBoxGroup((zWindow *)rc_,new zPercentSizer(ZGRAV_RIGHT,(float)100,(float)(10*cbgBoxName_.entries()),invis), ZAT_CHECKBOXALL, &cbgBoxName_);
		evControlRegistration_.notify(rc_->insert(cbg,0,1,ZAT_CHECKBOXALL));
	}
	for(size_t i=0;i<numItems_;i++){
		new zGravSizer(ZGRAV_TOP,zDimension(0, 2),rc_->sizer());
		invis = new zGravSizer(ZGRAV_TOP,zDimension(0, ZDefRowHeight-2),rc_->sizer());
		if(sliderType == ZAT_DOUBLEEDITSLIDER){
			esd = new ZatEditSliderDouble((zWindow *)rc_,new zPercentSizer(ZGRAV_LEFT,(float)100,(float)(95-10*cbgBoxName_.entries()),invis)," ",i,0.0,2.0);
			evControlRegistration_.notify(rc_->insert(esd,i+1,0,i,ZAT_CHECKBOXDELTA));
		}
		else if(sliderType == ZAT_LONGEDITSLIDER){
			esl = new ZatEditSliderLong((zWindow *)rc_,new zPercentSizer(ZGRAV_LEFT,(float)100,(float)(95-10*cbgBoxName_.entries()),invis)," ",i,0,2);
			evControlRegistration_.notify(rc_->insert(esl,i+1,0,i,ZAT_CHECKBOXDELTA));
		}
		if(cbgBoxName_.entries()){
			cbg = new ZatCheckBoxGroup((zWindow *)rc_,new zPercentSizer(ZGRAV_RIGHT,(float)100,(float)(10*cbgBoxName_.entries()),invis),i, &cbgBoxName_);
			evControlRegistration_.notify(rc_->insert(cbg,i+1,1,i,ZAT_CHECKBOXALL));
		}
	}
}

void ZatDialogBase::buildDefaultButtons(){

	new zGravSizer(ZGRAV_TOP,zDimension(0,ZMargin),sizer());
	new zGravSizer(ZGRAV_BOTTOM,zDimension(0,ZMargin),sizer());
	new zGravSizer(ZGRAV_RIGHT,zDimension(ZMargin,0),sizer());
	new zGravSizer(ZGRAV_LEFT,zDimension(ZMargin,0),sizer());
	zGravSizer *invis = new zGravSizer(ZGRAV_BOTTOM,zDimension(0,ZDefRowHeight),sizer());
	new zGravSizer(ZGRAV_BOTTOM,zDimension(0,ZMargin),sizer());
	cbgContainer_ = new zGravSizer(ZGRAV_TOP,zDimension(0,topMargin_),sizer());	
	pbOK_ = new zPushButton(this, new zGravSizer(ZGRAV_RIGHT,50,invis),WS_CHILD | BS_PUSHBUTTON | WS_TABSTOP | WS_VISIBLE, "OK", IDC_OK);
	pbCancel_ = new zPushButton(this, new zGravSizer(ZGRAV_RIGHT,50,invis),WS_CHILD | BS_PUSHBUTTON | WS_TABSTOP | WS_VISIBLE, "Cancel", IDC_CANCEL);//new zSizer(rcDefControls_->getRect(0,2))
	pbApply_ = new zPushButton(this, new zGravSizer(ZGRAV_RIGHT,50,invis),WS_CHILD | BS_PUSHBUTTON | WS_TABSTOP | WS_VISIBLE, "Apply", IDC_APPLY);
	pbReset_ = new zPushButton(this, new zGravSizer(ZGRAV_RIGHT,50,invis),WS_CHILD | BS_PUSHBUTTON | WS_TABSTOP | WS_VISIBLE, "Reset", IDC_RESET);
	pbHelp_ = new zPushButton(this, new zGravSizer(ZGRAV_RIGHT,50,invis),WS_CHILD | BS_PUSHBUTTON | WS_TABSTOP | WS_VISIBLE, "Help", IDC_DHELP);

	pbOK_->setNotifyClicked(this, (NotifyProc)&ZatDialogBase::cbOK);
	pbApply_->setNotifyClicked(this, (NotifyProc)&ZatDialogBase::cbApply);
	pbReset_->setNotifyClicked(this, (NotifyProc)&ZatDialogBase::cbReset);
	pbHelp_->setNotifyClicked(this, (NotifyProc)&ZatDialogBase::cbHelp);
	pbCancel_->setNotifyClicked(this, (NotifyProc)&ZatDialogBase::cbCancel);

	pbOK_->show();
	pbApply_->show();
	pbReset_->show();
	pbHelp_->show();
	pbCancel_->show();	

}
void ZatDialogBase::addBoxName(const char *tag){
	cbgBoxName_.insert(tag);	
	cbgTags_.reshape(numItems_*cbgBoxName_.entries());
	for(size_t l=0;l<cbgTags_.length();l++)
		cbgTags_[l]=0;
}	

void ZatDialogBase::setCheckBox(unsigned box, unsigned checked, unsigned id){
	size_t item = id+box*numItems_;
	if(item < cbgTags_.length())
		cbgTags_[item] = checked;
}

int ZatDialogBase::isBoxChecked(unsigned item, unsigned box){
	if((item+box*numItems_) < cbgTags_.length())
		return cbgTags_[item+box*numItems_];
	return -1;
}

int ZatDialogBase::cbCancel(zEvent *){
	evCancel_.notify(1);
	shutdown();
	return 1;
}
int ZatDialogBase::cbOK(zEvent *){
	evOK_.notify(1);
	shutdown();
	return 1;
}
int ZatDialogBase::cbApply(zEvent *){
	evApply_.notify(1);
	return 1;
}
int ZatDialogBase::cbReset(zEvent *){
	evReset_.notify(1);
	return 1;
}
int ZatDialogBase::cbHelp(zEvent *){
	evHelp_.notify(1);
	return 1;
}

int ZatDialogBase::command(zCommandEvt *Ev){
    if(Ev->cmd() == IDC_COMBOBOX1){
		if(cmbStatic_[0])
			evCmbStatic1_.notify(cmbStatic_[0]->selection());
		return 1;
    }
    if(Ev->cmd() == IDC_COMBOBOX2){
		if(cmbStatic_[1])
			evCmbStatic2_.notify(cmbStatic_[1]->selection());
		return 1;
    }

	return 0;
}
#endif

