#ifdef _ZAPP_GUI_
#ifndef _zcGMH_HavestGraphs_h_
#define _zcGMH_HavestGraphs_h_

#include "zcGM_YearAgeGraph.h"
#include "zcGM_YearGraph.h"
#include "Harvest.h"

class zcGMH_TotalMort : public zcGM_YearGraph {
	Harvest *defHarvest;
  public:
	zcGMH_TotalMort(ZatGraphDialog *gd);
	virtual void drawLabels(void);
	virtual void getData(void);
	virtual void cbGraphUpdate(const int index, const int type);
	virtual void setTitle(int);
};

class zcGMH_InMort : public zcGM_YearAgeGraph {
	Harvest *defHarvest;
  public:
	zcGMH_InMort(ZatGraphDialog *gd);
	virtual void drawLabels(void);
	virtual double getDataItem(int year, Age age);
	virtual void cbGraphUpdate(const int index, const int type);
	virtual void setTitle(int);
};

#endif
#endif
