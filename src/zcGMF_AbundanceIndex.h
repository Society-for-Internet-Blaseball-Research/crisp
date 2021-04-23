#ifdef _ZAPP_GUI_
#ifndef _zcGMF_AbundanceIndex_h_
#define _zcGMF_AbundanceIndex_h_

#include "zcGM_YearGraph.h"

class zcGMF_AbundanceIndex : public zcGM_YearGraph {
  public:
	zcGMF_AbundanceIndex(ZatGraphDialog *gd);
	virtual void getData(void);
	virtual void drawLabels(void);
	virtual void setTitle(int index);
};

#endif
#endif
