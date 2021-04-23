#ifdef _ZAPP_GUI_
#ifndef _ZatRowColumnBox_
#define _ZatRowColumnBox_

#include "ZatItem.h"
#include "ZatDefines.h"
#include "ZatConstants.h"


class ZatRowColumnBox : public zGroupBox {
	
	char *title;
	int numRows, numCols;
	float *rowPercent, *colPercent;
	zRect winPosition;
	int lastRow, lastCol;
	rwItemList rwList;
	zSizer *rSizer_;

public:
 
	ZatRowColumnBox(zWindow *w, zRect r, char *text=NULL, int baseId=0);
	ZatRowColumnBox(zWindow *w, zSizer *szr, char *text=NULL, int baseId=0);
	virtual ~ZatRowColumnBox();
	virtual rwItemIterator *getItemIterator(){return new rwItemIterator(rwList);}
	zSizer *rSizer(){ return rSizer_; }
	void setRows(int r, float *rp);
	void setCols(int c, float *cp);
	ZatItem *insert(zWindow *w, int r=-1, int c=-1, int id=0, int groupId=0); 		

	zRect getRect(int r, int c);	
};
#endif
#endif


