#ifdef _ZAPP_GUI_
#ifndef _zcGMS_Escapement_h_
#define _zcGMS_Escapement_h_

#include "zcGM_YearGraph.h"

class zcGMS_Escapement : public zcGM_YearGraph {
  public:
	zcGMS_Escapement(ZatGraphDialog *gd);
	virtual void getData(void);
	virtual void drawLabels(void);
	virtual void setTitle(int);
};

#endif
#endif
