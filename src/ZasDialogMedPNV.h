#ifdef _ZAPP_GUI_
#ifndef _ZasDialogMedPNV_h_
#define _ZasDialogMedPNV_h_

#include "ZatDialogMedBase.h"
#include "ZatDialogBase.h"
#include "idcPNV.h"

class ZasDialogMedPNV : public ZatDialogMedBase {
    

	int df_; // default Stock	
	idcPNV *idcPNV_;

  public:
    
    ZasDialogMedPNV(idcPNV *idc, ZatDialogBase *dp);
    virtual ~ZasDialogMedPNV();

	void listUpdate();
	void addListItems();

	virtual void cbControlRegistration(ZatItem *zi);
	virtual void cbEditSliderDoubleModified(const double delta, const int id);
    
};


#endif
#endif
