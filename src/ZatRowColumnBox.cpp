#ifdef _ZAPP_GUI_
#include <zapp.hpp>
#include "ZatRowColumnBox.h"



ZatRowColumnBox::ZatRowColumnBox(zWindow *w, zRect r, char *text, int baseId) 
	: zGroupBox(w, new zExpandSizer(r,ZEXPAND_DEFAULT,w->sizer()) ,WS_CHILD | BS_GROUPBOX, text), rowPercent(NULL), colPercent(NULL) 
{
	show();
}

ZatRowColumnBox::ZatRowColumnBox(zWindow *w, zSizer *szr, char *text, int baseId) 
	: zGroupBox(w, szr, WS_CHILD | BS_GROUPBOX, text) 
{
	show();
}

ZatRowColumnBox::~ZatRowColumnBox(){
//	if(numRows)
//		delete rowPercent;
//	if(numCols)
//
}

void ZatRowColumnBox::setRows(int r, float *rp){
	rowPercent = rp;
	numRows = r;
}
void ZatRowColumnBox::setCols(int c, float *cp){
	colPercent = cp;
	numCols = c;
}
ZatItem *ZatRowColumnBox::insert(zWindow *w, int r, int c, int id, int groupId){ 
	ZatItem *zi = new ZatItem(w,r,c,id,groupId);
	rwList.insert(zi);
	return zi;
}

zRect ZatRowColumnBox::getRect(int r, int c){
	zRect par, tem;
	getInterior(par);
	int i;
	float w = float(par.width()-(numCols+1)*ZMargin)/float(numCols);
	float h = float(par.height()-(numRows+3)*ZMargin)/float(numRows);
	float tw = w*numCols;
	float th = h*numRows;
	float cpt=0.0, rpt=0.0, cpt2=0.0, rpt2=0.0;

	if(colPercent){
		cpt = colPercent[c];
		if(c<numCols) 
				cpt2 = colPercent[c+1];
		else
			cpt2 = 1.0;
		cpt *= tw;
		cpt2 *= tw;
	}
	else {
		cpt = (float)(c*w);
		cpt2 = (float)((c+1)*w);
	}
	if(rowPercent){
		for(i=0;i<r;i++)
			rpt += rowPercent[i];
		if(i<numRows) rpt2 = rpt+rowPercent[i];
		else rpt2 = 1.0;
		rpt *= th;
		rpt2 *= th;
	}
	else {
		rpt = (float)(r*h);
		rpt2 = (float)((r+1)*h);
	}
	
	return zRect((int)((c+1)*ZMargin+cpt),(int)((r+3)*ZMargin+rpt),
		         (int)((c+1)*ZMargin+cpt2),(int)((r+3)*ZMargin+rpt2));

}

#endif
