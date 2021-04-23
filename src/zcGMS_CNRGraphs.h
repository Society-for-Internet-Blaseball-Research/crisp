#ifdef _ZAPP_GUI_
#ifndef _zcGMS_CNRGraphs_h_
#define _zcGMS_CNRGraphs_h_

#include "zcGM_YearAgeGraph.h"


class zcGMS_CNRLegal : public zcGM_YearAgeGraph {

  public:
	zcGMS_CNRLegal(ZatGraphDialog *gd);
	virtual void drawLabels(void);
	virtual double getDataItem(int year, Age age);
	virtual void setTitle(int index);
};

class zcGMS_CNRSublegal : public zcGM_YearAgeGraph {

  public:
	zcGMS_CNRSublegal(ZatGraphDialog *gd);
	virtual void drawLabels(void);
	virtual double getDataItem(int year, Age age);
	virtual void setTitle(int index);
};

#endif
#endif
