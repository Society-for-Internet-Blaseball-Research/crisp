#ifdef _ZAPP_GUI_
#ifndef _ZasGraphMedMonteCarlo_h_
#define _ZasGraphMedMonteCarlo_h_

#include "zcGM_YearGraph.h"
#include "MonteStockTracking.h"

class ZasGraphMedMonteCarlo : public zcGM_YearGraph {

	int numYears_, numGames_;
  public:

	ZasGraphMedMonteCarlo(ZatGraphDialog *gd);
	virtual void getData(void);
	virtual void drawLabels(void);
	virtual void drawLines(void);
	virtual void setTitle(int index);
};

#endif
#endif

