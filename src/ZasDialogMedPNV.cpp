#ifdef _ZAPP_GUI_
#include <zapp.hpp>

#include "ZatCheckBoxGroup.h"
#include "ZatEditSliderDouble.h"
#include "ZasDialogMedPNV.h"

extern ZasDialogMedPNV *_zdmPNV;

extern int DefaultFishery;

ZasDialogMedPNV::ZasDialogMedPNV(idcPNV *idc, ZatDialogBase *dp)  : ZatDialogMedBase(idc,dp), df_(DefaultFishery), idcPNV_(idc) {
	
	RegisterEvents();
	Age age;
	dialog_->setNumItems(int(age.top())-int(AGE2));
	dialog_->addBoxName("A"); //Box name must be set AFTER the number of items has been set (numItems_).
	dialog_->addBoxName("Y");
	dialog_->addBoxName("F");

	dialog_->drawDialog(ZDefRowHeight);
	dialog_->drawStandardLayout(ZAT_DOUBLEEDITSLIDER);

	dialog_->addComboBox(0);
	dialog_->addComboBox(1);
	addListItems();
	
	lock_=1;
	listUpdate();
	lock_=0;
	
}

ZasDialogMedPNV::~ZasDialogMedPNV() {
	_zdmPNV = NULL;
}

/* When each edit slider is first registered, change it's range to 0-1 from
 *  the default value 0-2
 */
void ZasDialogMedPNV::cbControlRegistration(ZatItem *zi){

	ZatEditSliderBase *esb;
	ZatEditSliderDouble *esd;

	if(!lock_){	
		lock_=1;

		if(zi->groupId() == ZAT_CHECKBOXDELTA){  
			esb = (ZatEditSliderBase *)zi->w();
			if (esb->editSliderType() == ZAT_DOUBLEEDITSLIDER) {
				esd = (ZatEditSliderDouble *)zi->w();
				esd->setRange(0.0,1.0);
			}
		}
		ZatDialogMedBase::cbControlRegistration(zi);
		lock_=0;
	}
}

void ZasDialogMedPNV::cbEditSliderDoubleModified(const double delta, const int id){
	if(!lock_){	
		lock_=1;
		if(!dialog_->isBoxChecked(id,0)){
			idcPNV_->ModifyCache(id, dialog_->ZatDialogBase::isBoxChecked(id,1),dialog_->ZatDialogBase::isBoxChecked(id,2), delta, dialog_->selectComboBox(),dialog_->selectComboBox(-1,1),delta_);
		}
		else{
			for(size_t i=0;i<dialog_->numItems();i++)
				if(dialog_->ZatDialogBase::isBoxChecked(i,0))
					idcPNV_->ModifyCache(i, dialog_->ZatDialogBase::isBoxChecked(i,1),dialog_->ZatDialogBase::isBoxChecked(i,2), delta, dialog_->selectComboBox(),dialog_->selectComboBox(-1,1),delta_);
			listUpdate();
		}
		lock_=0;
	}
}


void ZasDialogMedPNV::addListItems(){
	if(!lock_){
		lock_=1;
		char year_str[80];
	    dialog_->clearComboBox(0);
		dialog_->clearComboBox(1);
		for (int year = 0; year < ::Chronographer->nyears(); year++){
			sprintf(year_str, "%d", ::Chronographer->base_year() + year);	
			dialog_->addComboBoxText(year_str,0);
		}
		for (int f = 0; f < ::Fisheries.num(); f++)
			dialog_->addComboBoxText(::Fisheries[f].get_name(),1);
		dialog_->selectComboBox(0,0);
		dialog_->selectComboBox(DefaultFishery,1);
		lock_=0;
	}
}

void ZasDialogMedPNV::listUpdate(){
	
	rwItemIterator *itr;
	ZatEditSliderDouble *es; 
	ZatCheckBoxGroup *cbg;
	ZatItem *item;
	datFisheryPNV *dat;

	if(!(itr = dialog_->getItemIterator()))return;
	if(dialog_->selectComboBox() < 0) return;
	if(dialog_->selectComboBox(-1,1) < 0) return;
	if(!(dat = idcPNV_->getDat(dialog_->selectComboBox(),dialog_->selectComboBox(-1,1))))
		return;
	while((*itr)()){
		item = itr->key(); 
		if(item->groupId() == ZAT_CHECKBOXDELTA){
			char year_str[40];
			es = (ZatEditSliderDouble *)(item->w());
			if(es->editSliderType() == ZAT_DOUBLEEDITSLIDER){
				es->setValue(dat->getDouble(item->id()));
				sprintf(year_str, "Age %d",AGE2+item->id());
				es->setText(year_str);
				if(dialog_->selectComboBox() < ::Chronographer->sim_start_year())
					es->disable();
				else 
					es->enable();
			}
		}
		else if(item->groupId() == ZAT_CHECKBOXALL){
			cbg = (ZatCheckBoxGroup *)(item->w());
			cbg->setItem(2,dialog_->isBoxChecked(item->id(),2));
			cbg->setItem(1,dialog_->isBoxChecked(item->id(),1));
			cbg->setItem(0,dialog_->isBoxChecked(item->id(),0));
		}
	}
}
#endif
