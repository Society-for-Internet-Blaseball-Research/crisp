#ifndef _mapPoint_h_
#define _mapPoint_h_

#include <rw/stackcol.h>

typedef RWSlistCollectablesStack Stack;

class mapPoint : public RWCollectable {
    
  public:

    mapPoint(double _lon, double _lat) : latitude(_lat), longitude(_lon) { }
    ~mapPoint() { }
    inline double lat() const {	return latitude; }
    inline double lon() const {	return longitude; }
    inline void lat(const double new_lat){ latitude=new_lat; }
    inline void lon(const double new_lon){ longitude=new_lon; }
	inline mapPoint &operator=(const mapPoint &p){
		if(this != &p){
			latitude = p.lat();
			longitude = p.lon();
		}
		return *this;
	}
    int compareTo(const RWCollectable*) const;
    
  private:
    
    double latitude, longitude;
    
};

class mapCordset : public RWCollectable {

  public:
    mapCordset(double x1, double y1, double x2, double y2) : _x1(x1),_x2(x2),_y1(y1),_y2(y2) {}
    mapCordset(const mapCordset& mp) : _x1(mp.X1()),_x2(mp.X2()),_y1(mp.Y1()),_y2(mp.Y2()) {}

    inline double X1(void) const {return _x1;}
    inline double X2(void) const {return _x2;}
    inline double Y1(void) const {return _y1;}
    inline double Y2(void) const {return _y2;}
    
  private:
    
    const double _x1, _y2, _y1, _x2;

};

#endif

