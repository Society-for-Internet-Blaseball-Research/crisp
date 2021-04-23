#ifdef _ZAPP_GUI_
#ifndef _ZasTabDialogMedMR_h_
#define _ZasTabDialogMedMR_h_

#include "ZatTabDialogMed.h"
#include "ZatTabDialog.h"
#include "idcMR.h"

class ZasTabDialogMedMR : public ZatTabDialogMed {
    

	int df_; // default Stock	
	idcMR *idcMR_;

  public:
    
    ZasTabDialogMedMR(idcMR *idc, ZatTabDialog *dp);
    virtual ~ZasTabDialogMedMR();

	void listUpdate();
	void addListItems();

	virtual void cbControlRegistration(ZatItem *zi);
	virtual void cbEditSliderDoubleModified(const double delta, const int id);
    
};


#endif
#endif

