#ifdef _ZAPP_GUI_
#ifndef _zcGMS_CatchGraphs_h_
#define _zcGMS_CatchGraphs_h_

#include "zcGM_YearAgeGraph.h"


class zcGMS_CatchTotal : public zcGM_YearAgeGraph {

  public:
	zcGMS_CatchTotal(ZatGraphDialog *gd);
	virtual void drawLabels(void);
	virtual double getDataItem(int year, Age age);
	virtual void setTitle(int index);
};

class zcGMS_CatchPreterminal : public zcGM_YearAgeGraph {

  public:
	zcGMS_CatchPreterminal(ZatGraphDialog *gd);
	virtual void drawLabels(void);
	virtual double getDataItem(int year, Age age);
	virtual void setTitle(int index);
};

class zcGMS_CatchTerminal : public zcGM_YearAgeGraph {

  public:
	zcGMS_CatchTerminal(ZatGraphDialog *gd);
	virtual void drawLabels(void);
	virtual double getDataItem(int year, Age age);
	virtual void setTitle(int index);

};





#endif
#endif

