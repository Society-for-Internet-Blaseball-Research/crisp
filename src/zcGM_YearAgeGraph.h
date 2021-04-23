#ifdef _ZAPP_GUI_
#ifndef _zcGM_YearAgeGraph_h_ 
#define _zcGM_YearAgeGraph_h_ 

#include "zcGraphMediator.h"
#include "Cohort.h"

class zcGM_YearAgeGraph : public zcGraphMediator {

  public:
	zcGM_YearAgeGraph(ZatGraphDialog *gd);
	virtual void getData(void);
	virtual double getDataItem(int year, Age age);
	virtual void drawLines(void);
	virtual void drawLabels(void);
	virtual void cbRedraw(const zPoint pos = 0);
	virtual void cbPosition(const zPoint pos);
};


#endif
#endif

