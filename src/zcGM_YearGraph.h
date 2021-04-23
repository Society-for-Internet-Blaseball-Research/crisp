#ifdef _ZAPP_GUI_
#ifndef _zcGM_YearGraph_h_ 
#define _zcGM_YearGraph_h_ 

#include "zcGraphMediator.h"

class zcGM_YearGraph : public zcGraphMediator {

  public:
	zcGM_YearGraph(ZatGraphDialog *gd);
	virtual void getData(void);
	virtual void drawLines(void);
	virtual void drawLabels(void);
	virtual void cbRedraw(const zPoint pos = 0);
//	virtual void cbPosition(const zPoint pos);
};


#endif
#endif

