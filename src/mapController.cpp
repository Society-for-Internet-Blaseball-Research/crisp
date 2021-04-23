// mapController.cc
//
//      Loads and stores the map into a mapList(RWDlistCollection) of mapObjects(RWCollectable) which contains 
//      a list of mapPoints(RWCollectable) in a RWDlistCollection.  mapObjects represent islands, coastlines, etc. and
//      mapPoints are the actual latitude longitude points that make up the mapObject.  The mapContoller maintains
//      and builds the mapList from the map.dat file.  The mapController may export events in the future but as it
//      sits, an event will never be triggered by the data segment as new data is never added at runtime.


#include <iostream.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <rw/cstring.h>
#include "implicit.h"
#include "mapController.h"


int mapPoint::compareTo(const RWCollectable *rwc) const {
    
    mapPoint *p1 = (mapPoint *)rwc;
    if((p1->latitude == latitude) && (p1->longitude == longitude)) return 0;
    else if((p1->latitude+p1->longitude) > (longitude+latitude)) return 1;
    else return -1;
    
}

mapController::mapController(char *filename) : _filename(filename){

    ReadMap();
     
}

mapController::~mapController(){
    
}

// Builds an iterator for object list mapList.. object lists in turn have iterators for their data.
// Note: you must handle the cleanup of the iterator and should you cycle to NULL, it's position
// is undefinded and must be nuked.
// -Steve

RWDlistCollectablesIterator *mapController::getIterator(){
    return new RWDlistCollectablesIterator(mapList);
}

RWDlistCollectablesIterator *mapController::getIconIterator(){
    return new RWDlistCollectablesIterator(iconList);
}

int mapController::ZoomMap(mapPoint ul, mapPoint lr){
    return 0;
}

int mapController::BuildObject(int type, char *label, FILE *input){

    char inbuf[100], dirlat, dirlon, tag[30], name[40];
    int deglat,minlat,seclat,deglon,minlon,seclon;
    int is_icon=0;
    double lat, lon;
    
    RWCString objlabel;
    mapObject *mo = new mapObject(type);
    
    while(!feof(input)){
	lat = 0.0; lon = 0.0;
	fgets(inbuf, 100, input);
	if(inbuf[0] == 'e'){
		int i=0,j=0;
		while(inbuf[i] != '\0'){
			if(inbuf[i++] == '('){
				while(inbuf[i] != ')' && j < 40 && i < 100)
					name[j++]=inbuf[i++];
				name[j]='\0';
			}
		}
		objlabel = name;
		mo->setLabel(objlabel);
	    if(!is_icon)
			mapList.insert(mo);
	    else 
			iconList.insert(mo);
	    
	    return 0;
	}
	sscanf(inbuf,"%s %d %d %d %c %d %d %d %c", tag,
	       &deglat, &minlat, &seclat, &dirlat,
	       &deglon, &minlon, &seclon, &dirlon);
	
	lat = (double)deglat + (double)minlat/60.0 + (double)seclat/3600.0;
	lon = (double)deglon + (double)minlon/60.0 + (double)seclon/3600.0;

	if(lat && lon){
	    if(tag[0] == 'l') 
		mo->insert(lon, lat);
	    if(tag[0] == 'i'){
		is_icon = 1;
		mo->insert(lon, lat);
	    }
	}
	else cout << "ERROR: Invalid data from map file." << endl;
    }
    return 1;
}

int mapController::ReadMap(char *filename){

    FILE *md = NULL;  //Map Datafile
    char inbuf[100], buf[100], *p;
    char *types[6] = {"island","coastline","river", "stock", "fishery", "boundary"};
    const int numtypes = 6;
    int j=0;
    
    if(!filename) filename = _filename;
    if((md = fopen(filename, "r"))==NULL){
	printf("ERROR: mapController::ReadMap -> Unable to open map file\n");
	return 0;
    }

    while(!feof(md)){
	
	inbuf[0] = '\0'; buf[0] = '\0';	p=NULL;
	fgets(inbuf, 100, md);
	strcpy(buf, inbuf);
	for(j=0;j<numtypes;j++){ 
	    if((p = strstr(buf, types[j]))){
		BuildObject(j*10+10, buf, md);
	    }
	}
    }
    fclose(md);
	return 1;
}
