#ifndef _mapObject_h_
#define _mapObject_h_
#include <rw/cstring.h>

enum objGeometry {mLINE, mPOINT, mPOLYGON, mPOLYLINE, mICON};
typedef RWDlistCollectablesIterator mapPointListItr;
typedef RWDlistCollectables mapPointList;

class mapObject : public RWCollectable {

  public:
    
    mapObject(int objType=0, const char *objLabel=NULL, objGeometry geo=mLINE);
    ~mapObject();
    int entries(){ 
			return pointList.entries();
	}
    int clear(){
		pointList.clear();
		return pointList.entries();
    }
    mapPoint *at(int i){
		return (mapPoint *)pointList.at(i);
    }
	RWCString getLabel(){	
		return _objLabel; 
	}
	void setLabel(const RWCString label){
		_objLabel = label;
	}
    mapPointListItr *getIterator(){ 
		return new mapPointListItr(pointList); 
	}
    inline int objType(){
		return _objType;
	}

    int insert(double x, double y);
    int insert(mapPoint *mp);
    void setMinMax(double x, double y);
    int intersects(double x1, double y1, double x2, double y2);
	int intersects(mapPoint p1, mapPoint p2);    
    
  private:
    
    double MX,MY,mx,my; // max and min points in the object;
    mapPointList pointList;   
	objGeometry _geo;
    int   _objType;
    RWCString _objLabel;
    int init_;
    int refresh;
    
};




#endif
