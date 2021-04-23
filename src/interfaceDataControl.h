#ifndef _interfaceDataControl_h_
#define _interfaceDataControl_h_

#include "globals.h"	
#include <rw/bintree.h>

class interfaceDataControl {

protected:
	RWBinaryTree bt;

public:

	virtual void ApplyCache() = 0;
	virtual void ClearCache(){ bt.clear();}

};


#endif

