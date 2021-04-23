#ifdef _ZAPP_GUI_
#ifndef _ZasTabDialogENH_h_
#define _ZasTabDialogENH_h_

#include "ZatTabDialog.h"
#include "ZatRowColumnBox.h"

#define ZAS_BROODSTOCK 501
#define ZAS_SMTAGE 502
#define ZAS_PARM 503

class ZasTabDialogENH : public ZatTabDialog {

  protected:

	ZatRowColumnBox *rcCustom_;

  public:

    ZasTabDialogENH(zWindow *w, zResId & rid);
    ZasTabDialogENH(zWindow *w, zSizer *siz, DWORD dw=0, const char *nt=NULL);
	virtual ~ZasTabDialogENH();

	void drawCustomControls();	

};

#endif
#endif
