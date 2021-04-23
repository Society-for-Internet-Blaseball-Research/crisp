#include <iostream.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <rw/collect.h>
#include <rw/dlistcol.h>
#include "mapPoint.h"
#include "mapObject.h"

mapObject::mapObject(int objType, const char *objLabel, objGeometry geo)	
	: _objType(objType), init_(0), refresh(1), _geo(geo){
    
    if(objLabel)_objLabel = objLabel;
    
}
    
mapObject::~mapObject(){
    
}

int mapObject::insert(double x, double y){
    setMinMax(x,y);
    mapPoint *mp = new mapPoint(x,y);
    pointList.insert(mp);
    return pointList.entries();
}

int mapObject::insert(mapPoint *mp){
    setMinMax(mp->lon(),mp->lat());
    pointList.insert(mp);
    return pointList.entries();
}

void mapObject::setMinMax(double x, double y){
    if(!init_){
	mx=x;
	MX=x;
	my=y;
	MY=y;
	init_++;
    }
    else{
	if(x<mx)mx=x;
	if(x>MX)MX=x;
	if(y<my)my=y;
	if(y>MY)MY=y;
    }
}

int mapObject::intersects(mapPoint p1, mapPoint p2){
	return intersects(p1.lon(),p1.lat(),p2.lon(),p2.lat());
}
int mapObject::intersects(double x1, double y1, double x2, double y2){
    double X, Y;
    if(x1>x2){X=x2;x2=x1;x1=X;}
    if(y1>y2){Y=y2;y2=y1;y1=Y;}
	if(x1>=mx && x1<=MX && y1>=my && y1<=MY) return 1; //x1,y1
	if(x2>=mx && x2<=MX && y2>=my && y2<=MY) return 1; //x2,y2
    if(x1<=mx && x2>=mx && y1<=my && y2>=my) return 1; //mx,my
    if(x1<=MX && x2>=MX && y1<=MY && y2>=MY) return 1; //MX,MY

	if(x1>=mx && x1<=MX && y2>=my && y2<=MY) return 1; //x1,y2
	if(x2>=mx && x2<=MX && y1>=my && y1<=MY) return 1; //x2,y1
    if(x1<=mx && x2>=mx && y1<=MY && y2>=MY) return 1; //mx,MY
    if(x1<=MX && x2>=MX && y1<=my && y2>=my) return 1; //MX,my

	if(x1>=mx && x2<=MX && y1<=my && y2>=MY) return 1; // No verticies, just center sections.
	if(x1<=mx && x2>=MX && y1>=my && y2<=MY) return 1;
    return 0;
}

