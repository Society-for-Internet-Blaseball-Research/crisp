#ifdef _ZAPP_GUI_
#ifndef _ZasTabDialogMedIDL_h_
#define _ZasTabDialogMedIDL_h_

#include "ZatTabDialogMed.h"
#include "ZatTabDialog.h"
#include "idcIDL.h"

class ZasTabDialogMedIDL : public ZatTabDialogMed {
    

	int df_; // default Stock	
	idcIDL *idcIDL_;

  public:
    
    ZasTabDialogMedIDL(idcIDL *idc, ZatTabDialog *dp);
    virtual ~ZasTabDialogMedIDL();

	void listUpdate();
	void addListItems();

	virtual void cbEditSliderDoubleModified(const double delta, const int id);
    
};


#endif
#endif

