#ifdef _ZAPP_GUI_
#ifndef _ZatTabDialogMed_h_
#define _ZatTabDialogMed_h_

#include "ZatDialogMedBase.h"
#include "ZatTabDialog.h"
#include "idcIDL.h"

class ZatTabDialogMed : public ZatDialogMedBase {
   
  protected:

    ZatTabDialog *dp_;

  public:
    
    ZatTabDialogMed(interfaceDataControl *idc, ZatTabDialog *dp);
    virtual ~ZatTabDialogMed(){}

	virtual void RegisterEvents();
	
	virtual void addYearTabs(int baseYear, int numYears, int yearsPerTab);
	virtual void cbTabSelected(const int newIndex);
	static void _cbTabSelected(void *ptr, const int newIndex);

   
    
};

#endif
#endif
