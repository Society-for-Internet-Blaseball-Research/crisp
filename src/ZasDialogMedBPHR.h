#ifdef _ZAPP_GUI_

#ifndef _ZasDialogMedBPHR_h_
#define _ZasDialogMedBPHR_h_

#include "ZatDialogMedBase.h"
#include "ZatDialogBase.h"
#include "idcBPHR.h"

class ZasDialogMedBPHR : public ZatDialogMedBase {
    

	int df_; // default Stock	
	idcBPHR *idcBPHR_;

  public:
    
    ZasDialogMedBPHR(idcBPHR *idc, ZatDialogBase *dp);
    virtual ~ZasDialogMedBPHR();

	void listUpdate();
	void addListItems();

	virtual void cbEditSliderDoubleModified(const double delta, const int id);
    
};


#endif
#endif
