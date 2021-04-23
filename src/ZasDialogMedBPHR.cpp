#ifdef _ZAPP_GUI_
#include <zapp.hpp>

#include "ZatCheckBoxGroup.h"
#include "ZatEditSliderDouble.h"
#include "ZasDialogMedBPHR.h"

extern ZasDialogMedBPHR *_zdmBPHR;

extern int DefaultStock;
extern int DefaultFishery;

ZasDialogMedBPHR::ZasDialogMedBPHR(idcBPHR *idc, ZatDialogBase *dp)  : ZatDialogMedBase(idc,dp), df_(DefaultStock), idcBPHR_(idc) {
	
	RegisterEvents();
	Age age;
	dialog_->setNumItems(age.top()-AGE2+1);
	
	dialog_->addBoxName("A"); //Box name must be set AFTER the number of items has been set (numItems_).
	dialog_->addBoxName("F");
	dialog_->addBoxName("S");

	dialog_->drawDialog(ZDefRowHeight);
	dialog_->drawStandardLayout(ZAT_DOUBLEEDITSLIDER);

	dialog_->addComboBox(0);
	dialog_->addComboBox(1);
	addListItems();
	
	lock_=1;
	listUpdate();
	lock_=0;
	
}

ZasDialogMedBPHR::~ZasDialogMedBPHR() {
	_zdmBPHR = NULL;
}

void ZasDialogMedBPHR::cbEditSliderDoubleModified(const double delta, const int id){
	if(!lock_){	
		lock_=1;
		if(!dialog_->isBoxChecked(id,0)){
			idcBPHR_->ModifyCache(id, dialog_->isBoxChecked(id,2),dialog_->isBoxChecked(id,1), delta, dialog_->selectComboBox(-1,1),dialog_->selectComboBox(),delta_);
		}
		else{
			for(size_t i=0;i<dialog_->numItems();i++)
				if(dialog_->ZatDialogBase::isBoxChecked(i,0))
					idcBPHR_->ModifyCache(i, dialog_->ZatDialogBase::isBoxChecked(i,2),dialog_->ZatDialogBase::isBoxChecked(i,1), delta,dialog_->selectComboBox(-1,1), dialog_->selectComboBox(),delta_);
			listUpdate();
		}
		lock_=0;
	}
}


void ZasDialogMedBPHR::addListItems(){
	if(!lock_){
		lock_=1;
	    dialog_->clearComboBox(0);
		dialog_->clearComboBox(1);
		for (int f = 0; f < ::Fisheries.num(); f++)
			dialog_->addComboBoxText(::Fisheries[f].get_name(),0);
		for (int s = 0; s < ::Stocks.num(); s++)
			dialog_->addComboBoxText(::Stocks[s].get_name(),1);
		dialog_->selectComboBox(DefaultFishery,0);
		dialog_->selectComboBox(DefaultStock,1);
		lock_=0;
	}
}

void ZasDialogMedBPHR::listUpdate(){
	
	rwItemIterator *itr;
	ZatEditSliderDouble *es; 
	ZatCheckBoxGroup *cbg;
	ZatItem *item;
	datHarvestBPHR *dat;

	if(!(itr = dialog_->getItemIterator()))return;
	if(dialog_->selectComboBox() < 0) return;
	if(dialog_->selectComboBox(-1,1) < 0) return;
	if(!(dat = idcBPHR_->getDat(dialog_->selectComboBox(-1,1),dialog_->selectComboBox()))){
		while((*itr)()){
			item = itr->key(); 
			if(item->groupId() == ZAT_CHECKBOXDELTA){
				es = (ZatEditSliderDouble *)(item->w());
				es->show(SW_HIDE);
			}
			else if(item->groupId() == ZAT_CHECKBOXALL){
				cbg = (ZatCheckBoxGroup *)(item->w());
				cbg->show(SW_HIDE);
			}
		}
		return;
	}
	while((*itr)()){
		item = itr->key(); 
		if(item->groupId() == ZAT_CHECKBOXDELTA){
			char age_str[10];
			es = (ZatEditSliderDouble *)(item->w());
			if(es->editSliderType() == ZAT_DOUBLEEDITSLIDER){
				es->show(SW_SHOWNA);
				es->setValue(dat->getDouble(item->id()));
				sprintf(age_str, "Age %d",AGE2+item->id());
				es->setText(age_str);
			}
		}
		else if(item->groupId() == ZAT_CHECKBOXALL){
			cbg = (ZatCheckBoxGroup *)(item->w());
			cbg->show(SW_SHOWNA);
			cbg->setItem(2,dialog_->isBoxChecked(item->id(),2));
			cbg->setItem(1,dialog_->isBoxChecked(item->id(),1));
			cbg->setItem(0,dialog_->isBoxChecked(item->id(),0));
		}
	}
}
#endif
