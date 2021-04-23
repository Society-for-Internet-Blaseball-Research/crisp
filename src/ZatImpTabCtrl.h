#ifdef _ZAPP_GUI_
#ifndef _ZatImpTabCtrl_ 
#define _ZatImpTabCtrl_ 

#include <zapp.hpp>
#include "implicit.h"

typedef utImplicit2<const int, const int> signalIntInt;

class ZatImpTabCtrl : public zTabCtrl {
	
	signalIntInt evPageChange_;

  public:

	ZatImpTabCtrl(zWindow *w, zSizer *s, DWORD style_=0, const char* t=NULL, int ctrlId_=-1) 
			: zTabCtrl(w,s,style_,t,ctrlId_) {}
	signalIntInt *evPageChange(){ return &evPageChange_; }
	void onPageChange(int newIndex, int oldIndex) {	evPageChange_.notify(newIndex,oldIndex); }
};

#endif
#endif
