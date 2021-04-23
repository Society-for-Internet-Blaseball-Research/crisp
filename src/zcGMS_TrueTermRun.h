#ifdef _ZAPP_GUI_
#ifndef _zcGMS_TrueTermRun_h_
#define _zcGMS_TrueTermRun_h_

#include "zcGM_YearGraph.h"

class zcGMS_TrueTermRun : public zcGM_YearGraph {
  public:
	zcGMS_TrueTermRun(ZatGraphDialog *gd);
	virtual void getData(void);
	virtual void drawLabels(void);
	virtual void setTitle(int);
};

#endif
#endif
