#ifdef _ZAPP_GUI_
#ifndef _ZasTabDialogMedENH_h_
#define _ZasTabDialogMedENH_h_

#include "ZatTabDialogMed.h"
#include "ZasTabDialogENH.h"
#include "idcENH.h"

class ZasTabDialogMedENH : public ZatTabDialogMed {
    

	int df_; // default Stock	
	idcENH *idcENH_;

  public:
    
    ZasTabDialogMedENH(idcENH *idc, ZasTabDialogENH *dp);
    virtual ~ZasTabDialogMedENH();

	void listUpdate();
	void addListItems();
	virtual void cbControlRegistration(ZatItem *zi);
	virtual void cbEditSliderLongModified(const long delta, const int id);
    
};


#endif
#endif

