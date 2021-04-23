#ifdef _ZAPP_GUI_
#ifndef _ZasTabDialogMedHRS_h_
#define _ZasTabDialogMedHRS_h_

#include "ZatTabDialogMed.h"
#include "ZatTabDialog.h"
#include "idcHRS.h"

class ZasTabDialogMedHRS : public ZatTabDialogMed {
    

	int df_; // default Stock	
	idcHRS *idcHRS_;

  public:
    
    ZasTabDialogMedHRS(idcHRS *idc, ZatTabDialog *dp);
    virtual ~ZasTabDialogMedHRS();

	void listUpdate();
	void addListItems();

	virtual void cbEditSliderDoubleModified(const double delta, const int id);
    
};


#endif
#endif

