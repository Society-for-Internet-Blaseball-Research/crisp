#ifdef _ZAPP_GUI_
#ifndef _ZasTabDialogMedCeilings_h_
#define _ZasTabDialogMedCeilings_h_

#include "ZatTabDialogMed.h"
#include "ZasTabDialogCeilings.h"
#include "idcCeilings.h"

class ZasTabDialogMedCeilings : public ZatTabDialogMed {
    

	int df_; // default Stock	
	idcCeilings *idcCeilings_;

  public:
    
    ZasTabDialogMedCeilings(idcCeilings *idc, ZasTabDialogCeilings *dp);
    virtual ~ZasTabDialogMedCeilings();

	void listUpdate();
	void addListItems();
	virtual void cbControlRegistration(ZatItem *zi);
	virtual void cbEditSliderLongModified(const long delta, const int id);
	virtual void cbForced(const int box, const int checked, const int id);
	static void _cbForced(void *ptr, const int box, const int checked, const int id);
	virtual void cbForcedAll(const int box, const int checked, const int id);
	static void _cbForcedAll(void *ptr, const int box, const int checked, const int id);
    
};

#endif
#endif

