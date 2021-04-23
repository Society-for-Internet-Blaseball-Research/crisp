#ifdef _ZAPP_GUI_
#include <zapp.hpp>
#include "ZatCheckBoxGroup.h"
#include "ZatEditSliderBase.h"
#include "ZatEditSliderDouble.h"
#include "ZatEditSliderLong.h"
#include "ZatDialogMedBase.h"


void ZatDialogMedBase::RegisterEvents(void){
	dialog_->evApply()->attach(this, &ZatDialogMedBase::_cbApply);
    dialog_->evCancel()->attach(this, &ZatDialogMedBase::_cbCancel);
    dialog_->evOK()->attach(this, &ZatDialogMedBase::_cbOK);
	dialog_->evReset()->attach(this, &ZatDialogMedBase::_cbReset);
	dialog_->evHelp()->attach(this, &ZatDialogMedBase::_cbHelp);
	dialog_->evControlRegistration()->attach(this, &ZatDialogMedBase::_cbControlRegistration);
	dialog_->evCmbStatic1()->attach(this, &ZatDialogMedBase::_cbStaticComboBox1);
	dialog_->evCmbStatic2()->attach(this, &ZatDialogMedBase::_cbStaticComboBox2);

}
void ZatDialogMedBase::unRegisterEvents(void){
	dialog_->evApply()->detach(this, &ZatDialogMedBase::_cbApply);
    dialog_->evCancel()->detach(this, &ZatDialogMedBase::_cbCancel);
    dialog_->evOK()->detach(this, &ZatDialogMedBase::_cbOK);
	dialog_->evReset()->detach(this, &ZatDialogMedBase::_cbReset);
	dialog_->evHelp()->detach(this, &ZatDialogMedBase::_cbHelp);
	dialog_->evControlRegistration()->detach(this, &ZatDialogMedBase::_cbControlRegistration);
	dialog_->evCmbStatic1()->detach(this, &ZatDialogMedBase::_cbStaticComboBox1);
	dialog_->evCmbStatic2()->detach(this, &ZatDialogMedBase::_cbStaticComboBox2);

}

void ZatDialogMedBase::cbCheckAllModified(const int box, const int checked, const int id){
	if(!lock_){	
		lock_=1;
		rwItemIterator *itr;
		ZatCheckBoxGroup *cbg;
		ZatItem *item;
		itr = dialog_->getItemIterator();
		while((*itr)()){
			item = itr->key();
			if(item->groupId() == ZAT_CHECKBOXALL){
				cbg = (ZatCheckBoxGroup *)(item->w());
				if(cbg->isEnabled())cbg->setItem(box,checked);
			}
		}
		for(size_t i=dialog_->numFixedItems();i<dialog_->numItems();i++)
			dialog_->ZatDialogBase::setCheckBox(box,checked,i);
		lock_=0;
	}
}

void ZatDialogMedBase::cbCheckBoxModified(const int box, const int checked, const int id){
	if(!lock_){	
		lock_=1;
		//Find out which tab is the current one and set the marker for this data as checked;
		dialog_->setCheckBox(box,checked,id);
		lock_=0;
	}
}

void ZatDialogMedBase::cbDeltaModified(const int box, const int checked, const int id){
	if(!lock_){	
		lock_=1;
		delta_ = checked;
		rwItemIterator *itr;
		ZatEditSliderBase *es;
		ZatItem *item;
		itr = dialog_->getItemIterator();
		while((*itr)()){
			item = itr->key();
			if(item->groupId() == ZAT_CHECKBOXDELTA){
				es = (ZatEditSliderBase *)(item->w());
				es->setDelta(checked);
			}
		}
		lock_=0;
	}
}
void ZatDialogMedBase::cbControlRegistration(ZatItem *zi){

	ZatCheckBoxGroup *cbg;
	ZatEditSliderBase *esb;
	ZatEditSliderLong *esl;
	ZatEditSliderDouble *esd;

	switch(zi->id()){
		case ZAT_CHECKBOXALL:
			cbg = (ZatCheckBoxGroup *)zi->w();
			cbg->cbgRegisterEvent()->attach(this, &ZatDialogMedBase::_cbCheckAllModified);
			break;
		case ZAT_CHECKBOXDELTA:
			cbg = (ZatCheckBoxGroup *)zi->w();
			cbg->cbgRegisterEvent()->attach(this, &ZatDialogMedBase::_cbDeltaModified);
			break;
	}
	//We're assuming that if the group type is ZAT_CHECKBOXDELTA, you're using a ZatEditSlider. If you use some 
	//other base class than ZatEditSliderBase you'll need to override this control registration 
	//function in your derived mediator.
	if(zi->groupId() == ZAT_CHECKBOXDELTA){  
		esb = (ZatEditSliderBase *)zi->w();
		switch(esb->editSliderType()){
			case ZAT_DOUBLEEDITSLIDER:
				esd = (ZatEditSliderDouble *)zi->w();
				esd->evDoubleChanged()->attach(this, &ZatDialogMedBase::_cbEditSliderDoubleModified);
				esd->setActiveUpdates(activeTracking_);
				break;
			case ZAT_LONGEDITSLIDER:
				esl = (ZatEditSliderLong *)zi->w();
				esl->evLongChanged()->attach(this, &ZatDialogMedBase::_cbEditSliderLongModified);
				esl->setActiveUpdates(activeTracking_);
				break;
		}
		return;
	}
	if(zi->groupId() == ZAT_CHECKBOXALL){
		cbg = (ZatCheckBoxGroup *)zi->w();
		cbg->cbgRegisterEvent()->attach(this, &ZatDialogMedBase::_cbCheckBoxModified);
	}
}

void ZatDialogMedBase::cbHelp(const int i){
    if(!lock_){
		lock_=1;
		helpWin_->show();
		lock_=0;
	}
}
void ZatDialogMedBase::cbApply(const int i){
	if(!lock_){
		lock_=1;
		idc_->ApplyCache();
		lock_=0;
	}
}
void ZatDialogMedBase::cbOK(const int i){
	if(!lock_){
		lock_=1;
		idc_->ApplyCache();
		idc_->ClearCache();
		unRegisterEvents();
		evRemove_.notify(this);
		lock_=0;
	}
}
void ZatDialogMedBase::cbCancel(const int i){
	if(!lock_){
		lock_=1;
		idc_->ClearCache();
		unRegisterEvents();
		evRemove_.notify(this);
		lock_=0;
	}
}
void ZatDialogMedBase::cbReset(const int i){
	if(!lock_){
		lock_=1;
		idc_->ClearCache();
		listUpdate();
		lock_=0;
	}
}
void ZatDialogMedBase::cbStaticComboBox1(const int i){
	if(!lock_){
		lock_=1;
	    listUpdate();
		lock_=0;
	}
}
void ZatDialogMedBase::cbStaticComboBox2(const int i){
	if(!lock_){
		lock_=1;
	    listUpdate();
		lock_=0;
	}
}

void ZatDialogMedBase::_cbDeltaModified(void *msg, const int box, const int checked, const int id){
	ZatDialogMedBase *dm = (ZatDialogMedBase *)msg;
	dm->cbDeltaModified(box, checked,id);
}
void ZatDialogMedBase::_cbCheckBoxModified(void *msg, const int box, const int checked, const int id){
	ZatDialogMedBase *dm = (ZatDialogMedBase *)msg;
	dm->cbCheckBoxModified(box, checked,id);
}
void ZatDialogMedBase::_cbCheckAllModified(void *msg, const int box, const int checked, const int id){
	ZatDialogMedBase *dm = (ZatDialogMedBase *)msg;
	dm->cbCheckAllModified(box, checked,id);
}
void ZatDialogMedBase::_cbEditSliderDoubleModified(void *msg, const double delta, const int id){
	ZatDialogMedBase *dm = (ZatDialogMedBase *)msg;
	dm->cbEditSliderDoubleModified(delta, id);
}
void ZatDialogMedBase::_cbEditSliderLongModified(void *msg, const long delta, const int id){
	ZatDialogMedBase *dm = (ZatDialogMedBase *)msg;
	dm->cbEditSliderLongModified(delta, id);
}
void ZatDialogMedBase::_cbStaticComboBox1(void *msg, const int i){
    ZatDialogMedBase *zm = (ZatDialogMedBase *)msg; 
    zm->cbStaticComboBox1(i);
}
void ZatDialogMedBase::_cbStaticComboBox2(void *msg, const int i){
    ZatDialogMedBase *zm = (ZatDialogMedBase *)msg; 
    zm->cbStaticComboBox2(i);
}
void ZatDialogMedBase::_cbApply(void *msg, const int i){
    ZatDialogMedBase *zm = (ZatDialogMedBase *)msg; 
    zm->cbApply(i);
}
void ZatDialogMedBase::_cbOK(void *msg, const int i){
    ZatDialogMedBase *zm = (ZatDialogMedBase *)msg;
    zm->cbOK(i);
}
void ZatDialogMedBase::_cbCancel(void *msg, const int i){
    ZatDialogMedBase *zm = (ZatDialogMedBase *)msg;
    zm->cbCancel(i);
}
void ZatDialogMedBase::_cbReset(void *msg, const int i){
    ZatDialogMedBase *zm = (ZatDialogMedBase *)msg;
    zm->cbReset(i);
}
void ZatDialogMedBase::_cbHelp(void *msg, const int i){
    ZatDialogMedBase *zm = (ZatDialogMedBase *)msg;
    zm->cbHelp(i);
}
void ZatDialogMedBase::_cbControlRegistration(void *msg, ZatItem *zi){
    ZatDialogMedBase *zm = (ZatDialogMedBase *)msg;
    zm->cbControlRegistration(zi);
}
#endif





