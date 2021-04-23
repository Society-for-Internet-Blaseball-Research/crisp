#ifdef _ZAPP_GUI_
#ifndef _zcGMF_CatchGraphs_h_
#define _zcGMF_CatchGraphs_h_

#include "zcGM_YearGraph.h"


class zcGMF_CatchTotal : public zcGM_YearGraph {

  public:
	zcGMF_CatchTotal(ZatGraphDialog *gd);
	virtual void drawLabels(void);
	virtual void getData(void);
	virtual void setTitle(int index);

};

class zcGMF_CatchPreterm : public zcGM_YearGraph {

  public:
	zcGMF_CatchPreterm(ZatGraphDialog *gd);
	virtual void drawLabels(void);
	virtual void getData(void);
	virtual void setTitle(int index);
};

class zcGMF_CatchTerminal : public zcGM_YearGraph {

  public:
	zcGMF_CatchTerminal(ZatGraphDialog *gd);
	virtual void drawLabels(void);
	virtual void getData(void);
	virtual void setTitle(int index);

};

#endif
#endif

