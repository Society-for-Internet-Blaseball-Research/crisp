#ifdef _ZAPP_GUI_
#ifndef _ZatMapMediator_
#define _ZatMapMediator_

#include <math.h>
#include <rw/cstring.h>
#include "mapController.h"
#include "ZatMapPane.h"
#include "ZatMercatorTransform.h"
#include "implicit.h"

typedef utImplicit3<const char *, const int, const int> signalUpdate;


class ZatMapMediator { 

 protected:

    ZatMapPane *mp_;

	zPrinterDisplay *pd_;
	zDisplay *cd_;

	zPoint lastSelector_;
    zRect mr_;

    Stack mapStack_;

    mapCordset *defaultCord_;
    mapController *mc_;

    int lock_;
    int gridLines_;

	signalUpdate evStatus_;
	signalUpdate evSelected_;


	mapObject *intersectsIcon(const zPoint pos, const int zoneRadius);    
    virtual void registerEvents(void);
    virtual zPen *getPen(int type);
	virtual void drawBitmaps(zRect r);
	virtual void drawSelector(const zPoint pos);
	virtual void drawIcons(RWDlistCollectablesIterator *itr, ZatMercatorTransform *zpt, zRect r){}
	virtual void redrawCircles(){}
	virtual void drawCircleGraph(const int sourceType, const char *selection){}

	ZatPointTransform *getTransform(zRect &r);

	int buildBitmapDisplay();
	int buildBackupBitmapDisplay();
	int buildPrinterDisplay();
	int buildDisplay();

	void copyBitmapDisplay();
	void copyPrinterDisplay();
	void copyDisplay();
	void clipPoint( zPoint *pp );

  public:
    
    ZatMapMediator(ZatMapPane *mp, mapController *mc);
	virtual ~ZatMapMediator();
	virtual void setGridLines(int onOff){gridLines_ = onOff; }
	virtual void clearAndRedraw(){ redrawMap(); }
	virtual void clearAndRedrawCircles(){ mp_->canvas()->setDirty(); }
	virtual void drawCircles(const int sourceType, const char *selection){}
	virtual void redrawMap(const zPoint = 0);
    virtual void zoomSection(const zRect zr);
    virtual void deZoomSection();
    virtual void selectItem(const zPoint, const int button);
    virtual void getItemTag(const zPoint);
	
    static void _redrawMap(void *msg, const zPoint);
    static void _zoomSection(void *msg, const zRect);
    static void _selectItem(void *msg, const zPoint,const int button);
    static void _getItemTag(void *msg, const zPoint);
    static void _deZoomSection(void *msg, const zRect);

   	signalUpdate *evStatus(){ return &evStatus_;}
	signalUpdate *evSelected(){ return &evSelected_;}
    
};

#endif
#endif
