#ifdef _ZAPP_GUI_
#include <zapp.hpp>

#include "ZatCheckBoxGroup.h"
#include "ZatEditSliderDouble.h"
#include "ZatEditSliderLong.h"
#include "ZasTabDialogMedCeilings.h"

extern ZasTabDialogMedCeilings *_ztdmCeilings;

extern int DefaultFishery;

ZasTabDialogMedCeilings::ZasTabDialogMedCeilings(idcCeilings *idc, ZasTabDialogCeilings *dp)  : ZatTabDialogMed(idc,dp), df_(DefaultFishery), idcCeilings_(idc) {
	
	RegisterEvents();

	//Set up the Dialog 
	addYearTabs(Chronographer->base_year()+idcCeilings_->fcy(),idcCeilings_->ny(),10);

	// The first few years are permanently disabled and not editable.
	if (idcCeilings_->fcy() <= Chronographer->sim_start_year())
		dp_->setNumFixedItems( 
		          Chronographer->sim_start_year() - idcCeilings_->fcy() );

	dp_->addBoxName("Y"); //Box name must be set AFTER the number of items has been set (numItems_).
	dp_->addBoxName("F");

	dp_->drawDialog(ZDefRowHeight);
	dp->drawCustomControls();
	dp_->addComboBox();
	addListItems();
	
	lock_=1;
	listUpdate();
	lock_=0;
	
}

ZasTabDialogMedCeilings::~ZasTabDialogMedCeilings() {
	_ztdmCeilings = NULL;
}

void ZasTabDialogMedCeilings::cbControlRegistration(ZatItem *zi){

	ZatEditSliderBase *esb;
	ZatEditSliderLong *esl;
	ZatCheckBoxGroup *cbg;

	if(zi->groupId() == ZAS_FORCED){  
		cbg = (ZatCheckBoxGroup *)zi->w();	
		cbg->cbgRegisterEvent()->attach(this, &ZasTabDialogMedCeilings::_cbForced);
		return;
	}
	if(zi->id() == ZAS_FORCED){  
		cbg = (ZatCheckBoxGroup *)zi->w();	
		cbg->cbgRegisterEvent()->attach(this, &ZasTabDialogMedCeilings::_cbForcedAll);
		return;
	}
	if(zi->groupId() == ZAT_CHECKBOXDELTA){  
		esb = (ZatEditSliderBase *)zi->w();
		switch(esb->editSliderType()){
			case ZAT_LONGEDITSLIDER:
				esl = (ZatEditSliderLong *)zi->w();
				esl->setRange(0,545000);
				break;
		}
	}
	ZatDialogMedBase::cbControlRegistration(zi);
}

void ZasTabDialogMedCeilings::cbEditSliderLongModified(const long delta, const int id){
	if(!lock_){	
		lock_=1;
		if(!dp_->isBoxChecked(id,0)){
			idcCeilings_->ModifyCache(id+(dp_->numItemsPerTab()-1)*dp_->currentIndex(), dp_->isBoxChecked(id,1), double(delta), dp_->selectComboBox(),delta_);
		}
		else{
			for(size_t i=0;i<dp_->numItems();i++)
				if(dp_->ZatDialogBase::isBoxChecked(i,0))
					idcCeilings_->ModifyCache(i, dp_->ZatDialogBase::isBoxChecked(i,1), double(delta), dp_->selectComboBox(),delta_);
			listUpdate();
		}
		lock_=0;
	}
}
void ZasTabDialogMedCeilings::_cbForced(void *ptr, const int box, const int checked, const int id){
	ZasTabDialogMedCeilings *zt = (ZasTabDialogMedCeilings *)ptr;
	zt->cbForced(box,checked,id);
}

void ZasTabDialogMedCeilings::cbForced(const int box, const int checked, const int id){
	if(!lock_){	
		lock_=1;
		datFisheryCeilings *dat;
		if(!(dat = idcCeilings_->getDat(dp_->selectComboBox())))
			return;
		dat->setInt(1+id+(dp_->numItemsPerTab()-1)*dp_->currentIndex(),checked);
		lock_=0;
	}
}
void ZasTabDialogMedCeilings::_cbForcedAll(void *ptr, const int box, const int checked, const int id){
	ZasTabDialogMedCeilings *zt = (ZasTabDialogMedCeilings *)ptr;
	zt->cbForcedAll(box,checked,id);
}

void ZasTabDialogMedCeilings::cbForcedAll(const int box, const int checked, const int id){
	if(!lock_){	
		lock_=1;
		datFisheryCeilings *dat;
		if(!(dat = idcCeilings_->getDat(dp_->selectComboBox())))
			return;
		for(size_t i=0;i<dp_->numItems();i++)
			if((int)i+idcCeilings_->fcy() >= ::Chronographer->sim_start_year())
				dat->setInt(i+1,checked);
		listUpdate();
		lock_=0;
	}
}

void ZasTabDialogMedCeilings::addListItems(){
	if(!lock_){
		lock_=1;
	    dp_->clearComboBox();
		for (int f = 0; f < ::Fisheries.num(); f++){
			if(::Fisheries[f].gui_get_tactics()->is_ceilinged()) 
				dp_->addComboBoxText(::Fisheries[f].get_name());
		}
		if(::Fisheries[df_].gui_get_tactics()->is_ceilinged())
			dp_->selectComboBox(df_); 
		else {
			char message[80];
			sprintf(message, "There are no catch ceilings set for %s fishery.", ::Fisheries[df_].get_name());
			zMessage *NoFish = new zMessage(dp_, message, "Ceilings Message", MB_OK);
			df_ = 0;
			dp_->selectComboBox(df_); 
		}
		lock_=0;
	}
}

void ZasTabDialogMedCeilings::listUpdate(){
	
	rwItemIterator *itr;
	ZatEditSliderLong *es; 
	ZatCheckBoxGroup *cbg;
	ZatItem *item;
	datFisheryCeilings *dat;
	int indexShift = (dp_->numItemsPerTab()-1)*dp_->currentIndex();
	if(!(itr = dp_->getItemIterator()))return;
	if(dp_->selectComboBox() < 0) return;
	if(!(dat = idcCeilings_->getDat(dp_->selectComboBox())))
		return;
	
	while((*itr)()){
		item = itr->key(); 
		if(item->groupId() == ZAT_CHECKBOXDELTA){
			char year_str[40];
			es = (ZatEditSliderLong *)(item->w());
			if(es->editSliderType() == ZAT_LONGEDITSLIDER){
				if((item->id()+indexShift) >= idcCeilings_->ny())
					es->show(SW_HIDE);
				else{
					es->show(SW_SHOWNA);
					es->setValue(long(dat->getDouble(item->id()+indexShift)));
					sprintf(year_str, "%d",::Chronographer->base_year()+idcCeilings_->fcy()+item->id()+indexShift);
					es->setText(year_str);
					if((item->id()+indexShift+idcCeilings_->fcy()) < ::Chronographer->sim_start_year())
						es->disable();
					else 
						es->enable();
				}
			}
		}
		else if(item->groupId() == ZAT_CHECKBOXALL){
			cbg = (ZatCheckBoxGroup *)(item->w());
			if((item->id()+indexShift) >= idcCeilings_->ny())
				cbg->show(SW_HIDE);
			else{
				cbg->show(SW_SHOWNA);
				cbg->setItem(1,dp_->isBoxChecked(item->id(),1));
				cbg->setItem(0,dp_->isBoxChecked(item->id(),0));
				if((item->id()+indexShift+idcCeilings_->fcy()) < ::Chronographer->sim_start_year())
					cbg->disable();
				else 
					cbg->enable();
			}
		}
		else if(item->groupId() == ZAS_FORCED){  
			cbg = (ZatCheckBoxGroup *)(item->w());
			if((item->id()+indexShift) >= idcCeilings_->ny())
				cbg->show(SW_HIDE);
			else{
				cbg->show(SW_SHOWNA);
				cbg->setItem(0,dat->getInt(item->id()+indexShift+1));
				if((item->id()+indexShift+idcCeilings_->fcy()) < ::Chronographer->sim_start_year())
					cbg->disable();
				else 
					cbg->enable();
			}
		}
	}
}
#endif


