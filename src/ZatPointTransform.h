// ZatPointTransform : abstract transform base class.
//
//   Given a set of screen coordinates (zRect) and a set of map coordinates (typically lat/lon),
//   an object derived from this class will convert back and forth between the two.
//   there are () operators to make these conversions a bit simpler.  revX takes a screen x coordinate
//   and returns a longitude.  If you notice in the ZatMercatorTransform class this doesn't work as
//   the x position is based on the y so you need both values(x and y) in order to calculate X, the longitude.

#ifdef _ZAPP_GUI_
#ifndef _ZatPointTransform_h_
#define _ZatPointTransform_h_

#include "mapPoint.h"
#include <math.h>

class ZatPointTransform {
    
  public:

	ZatPointTransform(zRect rv, mapCordset *mpc, int PO=0);
	ZatPointTransform(zRect rv, double x1, double y1, double x2, double y2, int PO=0);
    virtual ~ZatPointTransform(){}

    virtual double getScale()=0;
    virtual double getOffsetX()=0;
    virtual double getOffsetY()=0;
	virtual double revX(int x)=0;
	virtual double revY(int y)=0;

	virtual mapPoint revXY(int x, int y)=0;
	virtual mapPoint operator()(int x, int y)=0;

    virtual zPoint operator()(double x, double y)=0;
	virtual zPoint operator()(mapPoint &p)=0;
    
  protected:

    zRect _rv;  // screen space rectangle
    double _scale;  // default scale factor  (screen width)/(map width)
	double _centerLong, _centerScreen;  // map center coordinate (lon) and the screen center (x)
	double _latScale; // x scale factor.. based on y with Mercator
    double _ox, _oy;  // upper left hand coordinates of the map taken from _mpc
	mapCordset *_mpc; // map coordinates
    int _ProcessOrder; // Process order is here incase multiple transforms are used.  In such a case it
					  // is vital to process the transforms in proper order.
    
};
#endif
#endif
