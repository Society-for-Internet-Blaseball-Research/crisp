#ifdef _ZAPP_GUI_
#ifndef _ZatGraphicPane_h_
#define _ZatGraphicPane_h_

#include "implicit.h"
#include "ZatDialogConstants.h"

typedef utImplicit0 signalNull;
typedef utImplicit1<const zPoint> signalPoint;
typedef utImplicit1<const zRect> signalRect;

class ZatGraphicPane : public zPane {

	signalPoint evDraw_;
	BinDrawOp bd;
	int mouseOn;
	zWindow *w_;
	int isPrintMode_;

  public:

	ZatGraphicPane(zWindow *w, zSizer *szr) 
		: zPane(w, szr), w_(w), isPrintMode_(0) {}
	
	virtual int size(zSizeEvt *) { canvas()->setDirty(); return 1; }
	virtual int draw(zDrawEvt *de) { evDraw_.notify(zPoint(0,0)); return 1; }
	signalPoint *evDraw(){ return &evDraw_; }
	int print(zPrinterDisplay *pd, zRect *);
	int isPrintMode(){ return isPrintMode_; }
	void setPrintMode(int mode){ isPrintMode_ = mode; }
};

#endif
#endif

