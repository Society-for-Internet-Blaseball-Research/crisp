#ifdef _ZAPP_GUI_
#ifndef _ZatMapPane_H_
#define _ZatMapPane_H_

#include "implicit.h"

typedef utImplicit1<const zPoint> signal_point;
typedef utImplicit2<const zPoint, const int> signal_select;
typedef utImplicit1<const zRect> signal_rect;

class ZatMapPane:public zPane {
  public:
    
    ZatMapPane(zWindow *p);
    
    virtual int draw(zDrawEvt *);
    virtual int size(zSizeEvt *);
    virtual int print(zPrinterDisplay *pr, zRect *r);
    virtual int printMap(zEvent*);

	signal_point *evPosition(){ return &evPosition_; }
    signal_point *evDraw(){ return &evDraw_; }
    signal_select *evSelect(){ return &evSelect_; }
    signal_rect *evZoom(){ return &evZoom_; }
    signal_rect *evDeZoom(){ return &evDeZoom_; }
    
    virtual int mouseButtonDown(zMouseClickEvt *ev);
    virtual int mouseButtonUp(zMouseClickEvt *ev);
    virtual int mouseMove(zMouseMoveEvt *ev);    

    void drawSelect();
	int isPrintMode(){ return isPrintMode_; }
		
  private:

    zPoint p1_, p2_, p0_;
    int mouseOn_, isPrintMode_;
    BinDrawOp bd_;

    signal_point evPosition_;
    signal_point evDraw_;
    signal_select evSelect_;
    signal_rect evZoom_;
    signal_rect evDeZoom_;
};


#endif
#endif
