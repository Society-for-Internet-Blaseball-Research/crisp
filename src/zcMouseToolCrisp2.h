#ifdef _ZAPP_GUI_
#ifndef _zcMouseToolCrisp2_
#define _zcMouseToolCrisp2_
#include "zcMouseTool.h"

class zcMouseToolCrisp2 : public zcMouseTool {


  protected:	
	zcMouseToolCrisp2(zWindow *w, zResId &res);

  public:

	virtual ~zcMouseToolCrisp2(){}
	static zcMouseToolCrisp2 *Instance(zWindow *w);

	virtual int executeCommand(int mouseButton, int type);
	
};

	

#endif
#endif
