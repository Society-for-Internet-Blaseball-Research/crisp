#ifdef _ZAPP_GUI_
#ifndef _ZasMapMedCrispHarvest_h_
#define _ZasMapMedCrispHarvest_h_

#include "ZatMercatorTransform.h"
#include "ZatMapMediator.h"
 
class ZasMapMedCrispHarvest : public ZatMapMediator {


	zBitmap *bmFish_,*bmBoat_,*bmFishPrinter_,*bmBoatPrinter_,*bmGoob_;
	zBitmapDisplay *bdFish_,*bdBoat_,*bdFishPrinter_,*bdBoatPrinter_,*bdGoob_;

	int lastCircleSourceType_[2];
	RWCString lastCircleFisherySelection_;
	RWCString lastCircleStockSelection_;

    virtual void redrawCircles();
	virtual zBrush *getBrush(int type, BrushHatch style);
    virtual zPen *getPen(int type);
	virtual void drawIcons(RWDlistCollectablesIterator *itr, ZatMercatorTransform *zpt, zRect r);
	virtual void drawCircleGraph(const int sourceType, const char *selection);
	

	double getHarvestRateMagnitude(int sourceType, const char *sourceName);
	int getHarvestRateRadius(const char *stockName, const char *fisheryName, double mag, double maxRadius);
	
  public:

	ZasMapMedCrispHarvest(ZatMapPane *mp, mapController *mc);
	virtual ~ZasMapMedCrispHarvest();

	virtual void drawCircles(const int sourceType, const char *selection);
	void clearFisheryCircles(){ lastCircleSourceType_[0]=0; clearAndRedrawCircles();}
	void clearStockCircles(){ lastCircleSourceType_[1]=0; clearAndRedrawCircles();}
	
};



#endif
#endif
