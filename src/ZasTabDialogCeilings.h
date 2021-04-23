#ifdef _ZAPP_GUI_
#ifndef _ZasTabDialogCeilings_h_
#define _ZasTabDialogCeilings_h_

#include "ZatTabDialog.h"

#define ZAS_FORCED 501

class ZasTabDialogCeilings : public ZatTabDialog {

  protected:

  public:

    ZasTabDialogCeilings(zWindow *w, zResId & rid);
    ZasTabDialogCeilings(zWindow *w, zSizer *siz, DWORD dw=0, const char *nt=NULL);
	virtual ~ZasTabDialogCeilings();

	void drawCustomControls();	

};


#endif
#endif
