#ifdef _ZAPP_GUI_
#ifndef _zcGMF_InMortGraphs_h_
#define _zcGMF_InMortGraphs_h_

#include "zcGM_YearGraph.h"

class zcGMF_InMortTotal : public zcGM_YearGraph {

  public:
	zcGMF_InMortTotal(ZatGraphDialog *gd);
	virtual void getData(void);
	virtual void drawLabels(void);
	virtual void setTitle(int index);
};

class zcGMF_InMortLegal : public zcGM_YearGraph {

  public:
	zcGMF_InMortLegal(ZatGraphDialog *gd);
	virtual void getData(void);
	virtual void drawLabels(void);
	virtual void setTitle(int index);
};

class zcGMF_InMortSublegal : public zcGM_YearGraph {

  public:
	zcGMF_InMortSublegal(ZatGraphDialog *gd);
	virtual void getData(void);
	virtual void drawLabels(void);
	virtual void setTitle(int index);
};

#endif
#endif

