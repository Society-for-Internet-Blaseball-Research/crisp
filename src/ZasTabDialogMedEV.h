#ifdef _ZAPP_GUI_
#ifndef _ZasTabDialogMedEV_h_
#define _ZasTabDialogMedEV_h_

#include "ZatTabDialogMed.h"
#include "ZatTabDialog.h"
#include "idcEV.h"

class ZasTabDialogMedEV : public ZatTabDialogMed {
    

	int df_; // default Stock	
	idcEV *idcEV_;

  public:
    
    ZasTabDialogMedEV(idcEV *idc, ZatTabDialog *dp);
    virtual ~ZasTabDialogMedEV();

	void listUpdate();
	void addListItems();

	virtual void cbControlRegistration(ZatItem *zi);
	virtual void cbEditSliderDoubleModified(const double delta, const int id);
    
};


#endif
#endif

