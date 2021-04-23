#ifdef _ZAPP_GUI_
#include <string.h>
#include <zapp.hpp>
#include "ZatTabDialogMed.h"


ZatTabDialogMed::ZatTabDialogMed(interfaceDataControl *idc, ZatTabDialog *dp)  : ZatDialogMedBase(idc,dp), dp_(dp) {
	
}

void ZatTabDialogMed::addYearTabs(int baseYear, int numYears, int yearsPerTab){
	char year_str[20];
	char tem[10];

	int numTabs = numYears/yearsPerTab;
	if(numYears%yearsPerTab)numTabs++;

	for(int i=0;i<numTabs;i++){
		sprintf(year_str, "%d",baseYear+i*yearsPerTab);
		if(i == numTabs-1)
			strcpy(tem, "-");
		else
			sprintf(tem, "-%d",((baseYear+((i+1)*yearsPerTab)-1)%100));
		strcat(year_str, tem);
		dp_->addTabName(year_str);
	}
	dp_->setNumItems(numYears);
	dp_->setNumItemsPerTab(yearsPerTab+1);

}

void ZatTabDialogMed::RegisterEvents(void){
	dp_->evTabSelected()->attach(this, &ZatTabDialogMed::_cbTabSelected);
	ZatDialogMedBase::RegisterEvents();
}

void ZatTabDialogMed::cbTabSelected(const int newIndex){
	if(!lock_){	
		lock_=1;
		dp_->setCurrentIndex(newIndex);
		listUpdate();
		lock_=0;
	}
}
void ZatTabDialogMed::_cbTabSelected(void *ptr, const int newIndex){
	ZatTabDialogMed *zid  = (ZatTabDialogMed *)ptr;
	zid->cbTabSelected(newIndex);
}


#endif
