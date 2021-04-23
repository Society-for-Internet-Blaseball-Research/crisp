#ifndef _mapController_
#define _mapController_

#include <rw/collect.h>
#include <rw/dlistcol.h>
#include "mapPoint.h"
#include "mapObject.h"
#include "mapConstants.h"

class mapController {
    
  public:
    
    mapController(char *filename);
    ~mapController();
    
    inline int mapEntries(void){return mapList.entries();}
	inline int iconEntries(void){return iconList.entries();}
    inline mapObject *at(int i){return (mapObject *)mapList.at(i);}
	inline mapObject *iconAt(int i){return (mapObject *)iconList.at(i);}
    RWDlistCollectablesIterator *getIterator();
    RWDlistCollectablesIterator *getIconIterator();

    int ReadMap(char *filename = NULL);
    int ZoomMap(mapPoint ul, mapPoint lr);

    int BuildObject(int type, char *label, FILE *input);
    
  private:
    
    RWDlistCollectables mapList;
    RWDlistCollectables iconList;
    char *_filename;  //map input file
    
};

#endif
