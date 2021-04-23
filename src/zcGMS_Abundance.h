#ifdef _ZAPP_GUI_
#ifndef _zcGMS_Abundance_h_
#define _zcGMS_Abundance_h_

#include "zcGM_YearGraph.h"

class zcGMS_Abundance : public zcGM_YearGraph {
  public:
	zcGMS_Abundance(ZatGraphDialog *gd);
	virtual void getData(void);
	virtual void drawLabels(void);
	virtual void setTitle(int index);
};

#endif
#endif
