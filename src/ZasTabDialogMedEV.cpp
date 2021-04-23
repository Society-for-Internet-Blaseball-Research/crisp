#ifdef _ZAPP_GUI_
#include <zapp.hpp>

#include "ZatCheckBoxGroup.h"
#include "ZatEditSliderDouble.h"
#include "ZasTabDialogMedEV.h"

extern ZasTabDialogMedEV *_ztdmEV;

extern int DefaultStock;

ZasTabDialogMedEV::ZasTabDialogMedEV(idcEV *idc, ZatTabDialog *dp)  : ZatTabDialogMed(idc,dp), df_(DefaultStock), idcEV_(idc) {
	
	RegisterEvents();

	//Set up the Dialog 
	addYearTabs(Chronographer->base_year(),Chronographer->nyears(),9);

	// The first few years are permanently disabled and not editable.
	dp_->setNumFixedItems( Chronographer->sim_start_year() );

	dp_->addBoxName("Y"); //Box name must be set AFTER the number of items has been set (numItems_).
	dp_->addBoxName("S");

	dp_->drawDialog(ZDefRowHeight);
	dp_->drawStandardLayout();

	dp_->addComboBox();
	addListItems();
	
	lock_=1;
	listUpdate();
	lock_=0;
	
}

ZasTabDialogMedEV::~ZasTabDialogMedEV() {
	_ztdmEV = NULL;
}

/* When each edit slider is first registered, change it's range to 0-10 from
 *  the default value 0-2
 */
void ZasTabDialogMedEV::cbControlRegistration(ZatItem *zi){

	ZatEditSliderBase *esb;
	ZatEditSliderDouble *esd;

	if(!lock_){	
		lock_=1;

		if(zi->groupId() == ZAT_CHECKBOXDELTA){  
			esb = (ZatEditSliderBase *)zi->w();
			if (esb->editSliderType() == ZAT_DOUBLEEDITSLIDER) {
				esd = (ZatEditSliderDouble *)zi->w();
				esd->setRange(0.0,10.0);
			}
		}
		ZatDialogMedBase::cbControlRegistration(zi);
		lock_=0;
	}
}

void ZasTabDialogMedEV::cbEditSliderDoubleModified(const double delta, const int id){
	if(!lock_){	
		lock_=1;
		if(!dp_->isBoxChecked(id,0)){
			idcEV_->ModifyCache(id+(dp_->numItemsPerTab()-1)*dp_->currentIndex(), dp_->isBoxChecked(id,1), delta, dp_->selectComboBox(),delta_);
		}
		else{
			for(size_t i=0;i<dp_->numItems();i++)
				if(dp_->ZatDialogBase::isBoxChecked(i,0))
					idcEV_->ModifyCache(i, dp_->ZatDialogBase::isBoxChecked(i,1), delta, dp_->selectComboBox(),delta_);
			listUpdate();
		}
		lock_=0;
	}
}


void ZasTabDialogMedEV::addListItems(){
	if(!lock_){
		lock_=1;
	    dp_->clearComboBox();
		for (int f = 0; f < ::Stocks.num(); f++)
			dp_->addComboBoxText(::Stocks[f].get_name());
		dp_->selectComboBox(df_);
		lock_=0;
	}
}

void ZasTabDialogMedEV::listUpdate(){
	
	rwItemIterator *itr;
	ZatEditSliderDouble *es; 
	ZatCheckBoxGroup *cbg;
	ZatItem *item;
	datStockEV *dat;
	int indexShift = (dp_->numItemsPerTab()-1)*dp_->currentIndex();
	if(!(itr = dp_->getItemIterator()))return;
	if(dp_->selectComboBox() < 0) return;
	if(!(dat = idcEV_->getDat(dp_->selectComboBox())))
		return;
	
	while((*itr)()){
		item = itr->key(); 
		if(item->groupId() == ZAT_CHECKBOXDELTA){
			char year_str[40];
			es = (ZatEditSliderDouble *)(item->w());
			if(es->editSliderType() == ZAT_DOUBLEEDITSLIDER){
				if((item->id()+indexShift) >= Chronographer->nyears())
					es->show(SW_HIDE);
				else{
					es->show(SW_SHOWNA);
					es->setValue(dat->getDouble(item->id()+indexShift));
					sprintf(year_str, "%d",::Chronographer->base_year()+item->id()+indexShift);
					es->setText(year_str);
					if((item->id()+indexShift) < ::Chronographer->sim_start_year())
						es->disable();
					else 
						es->enable();
				}
			}
		}
		else if(item->groupId() == ZAT_CHECKBOXALL){
			cbg = (ZatCheckBoxGroup *)(item->w());
			if((item->id()+indexShift) >= Chronographer->nyears())
				cbg->show(SW_HIDE);
			else{
				cbg->show(SW_SHOWNA);
				cbg->setItem(1,dp_->isBoxChecked(item->id(),1));
				cbg->setItem(0,dp_->isBoxChecked(item->id(),0));
				if((item->id()+indexShift) < ::Chronographer->sim_start_year())
					cbg->disable();
				else 
					cbg->enable();
			}
		}
	}
}
#endif


