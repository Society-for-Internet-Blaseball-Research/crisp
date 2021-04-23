#ifdef _ZAPP_GUI_
#include <zapp.hpp>

#include "ZatCheckBoxGroup.h"
#include "ZatEditSliderDouble.h"
#include "ZatEditSliderLong.h"
#include "ZasTabDialogMedENH.h"

extern ZasTabDialogMedENH *_ztdmENH;

extern int DefaultStock;

ZasTabDialogMedENH::ZasTabDialogMedENH(idcENH *idc, ZasTabDialogENH *dp)  : ZatTabDialogMed(idc,dp), df_(DefaultStock), idcENH_(idc) {
	
	RegisterEvents();

	//Set up the Dialog 
	addYearTabs(Chronographer->base_year(),Chronographer->nyears(),7);

	// The first few years are permanently disabled and not editable.
	dp_->setNumFixedItems( Chronographer->sim_start_year() );

	dp_->addBoxName("Y"); //Box name must be set AFTER the number of items has been set (numItems_).
	dp_->addBoxName("S");

	dp_->drawDialog(ZDefRowHeight*5);
	dp_->drawStandardLayout(ZAT_LONGEDITSLIDER);
	dp->drawCustomControls();

	dp_->addComboBox();
	lock_=0;
	addListItems();
	lock_=1;
	listUpdate();
	lock_=0;
	
}

ZasTabDialogMedENH::~ZasTabDialogMedENH() {
	_ztdmENH = NULL;
}

void ZasTabDialogMedENH::cbControlRegistration(ZatItem *zi){

	ZatEditSliderBase *esb;
	ZatEditSliderLong *esl;

	if(!lock_){	
		lock_=1;

		if(zi->groupId() == ZAT_CHECKBOXDELTA){  
			esb = (ZatEditSliderBase *)zi->w();
			switch(esb->editSliderType()){
				case ZAT_LONGEDITSLIDER:
					esl = (ZatEditSliderLong *)zi->w();
					esl->setRange(-50000000,50000000);
					break;
			}
		}
		ZatDialogMedBase::cbControlRegistration(zi);
		lock_=0;
	}
}

void ZasTabDialogMedENH::cbEditSliderLongModified(const long delta, const int id){
	if(!lock_){	
		lock_=1;
		if(!dp_->isBoxChecked(id,0)){
			idcENH_->ModifyCache(id+(dp_->numItemsPerTab()-1)*dp_->currentIndex(), dp_->isBoxChecked(id,1), double(delta), dp_->selectComboBox(),delta_);
		}
		else{
			for(size_t i=0;i<dp_->numItems();i++)
				if(dp_->ZatDialogBase::isBoxChecked(i,0))
					idcENH_->ModifyCache(i, dp_->ZatDialogBase::isBoxChecked(i,1), double(delta), dp_->selectComboBox(),delta_);
			listUpdate();
		}
		lock_=0;
	}
}

void ZasTabDialogMedENH::addListItems(){
	if(!lock_){
		lock_=1;
	    dp_->clearComboBox();
		for (int f = 0; f < ::Stocks.num(); f++)
			dp_->addComboBoxText(::Stocks[f].get_name());
		dp_->selectComboBox(df_);
		lock_=0;
	}
}

void ZasTabDialogMedENH::listUpdate(){
	
	rwItemIterator *itr;
	zStaticText *st; 
	ZatEditSliderLong *es; 
	ZatCheckBoxGroup *cbg;
	ZatItem *item;
	datStockENH *dat;
	char cBuf[50];

	int indexShift = (dp_->numItemsPerTab()-1)*dp_->currentIndex();
	if(!(itr = dp_->getItemIterator()))return;
	if(dp_->selectComboBox() < 0) return;
	if(!(dat = idcENH_->getDat(dp_->selectComboBox())))
		return;
	
	while((*itr)()){
		item = itr->key(); 
		if(item->groupId() == ZAT_CHECKBOXDELTA){
			char year_str[40];
			es = (ZatEditSliderLong *)(item->w());
			if(es->editSliderType() == ZAT_LONGEDITSLIDER){
				if((item->id()+indexShift) >= Chronographer->nyears())
					es->show(SW_HIDE);
				else{
					es->show(SW_SHOWNA);
					es->setValue(long(dat->getDouble(item->id()+indexShift+3)));
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
		else if(item->id() == ZAS_BROODSTOCK) {
			st = (zStaticText *)(item->w());
			sprintf( cBuf, "Fraction Broodstock: %g", dat->getDouble(1) );
			st->text( cBuf );
		}
		else if (item->id() == ZAS_PARM) {
			st = (zStaticText *)(item->w());
			sprintf( cBuf, "Production Param: %g", dat->getDouble(0) );
			st->text( cBuf );
		}
		else if (item->id() == ZAS_SMTAGE) {  
			st = (zStaticText *)(item->w());
			sprintf( cBuf, "Smolt - Age1: %g", dat->getDouble(2) );
			st->text( cBuf );
		}
	}
}
#endif


