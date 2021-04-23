#ifdef _ZAPP_GUI_
#include <zapp.hpp>
#include <intpack/zip.hpp>
#include "ZatCheckBoxGroup.h"
#include <rw/tvordvec.h>
#include <rw/cstring.h>

ZatCheckBoxGroup::ZatCheckBoxGroup(zWindow *w, zRect r, int baseId, char **itemStrings, int numStrings) 
		: zPane(w, new zSizer(r),WS_CHILD), _numStrings(numStrings), _itemStrings(itemStrings), _baseId(baseId), _status(1){

		backgroundColor(zColor(ZCTRL_FILLER));
		show();

		for(int i=0;i<numStrings;i++){
			incItem = new zCheckBox(this, new zPercentSizer(ZGRAV_LEFT,(float)100.0,(float)(100.0/numStrings),sizer()), WS_CHILD | BS_AUTOCHECKBOX | WS_VISIBLE, itemStrings[i], baseId+i);
			incItem->show();
			rwList.insert(new ZatItem((zPane *)incItem,0,i));
		}
}
ZatCheckBoxGroup::ZatCheckBoxGroup(zWindow *w, zSizer *siz, int baseId, char **itemStrings, int numStrings) 
		: zPane(w,siz,WS_CHILD), _numStrings(numStrings), _itemStrings(itemStrings), _baseId(baseId), _status(1){

		backgroundColor(zColor(ZCTRL_FILLER));
		show();
		for(int i=0;i<numStrings;i++){
			incItem = new zCheckBox(this, new zPercentSizer(ZGRAV_LEFT,(float)100.0,(float)(100.0/numStrings),sizer()), WS_CHILD | BS_AUTOCHECKBOX | WS_VISIBLE, itemStrings[i], baseId+i);
			incItem->show();
			rwList.insert(new ZatItem((zPane *)incItem,0,i));
		}
}

ZatCheckBoxGroup::ZatCheckBoxGroup(zWindow *w, zSizer *siz, int baseId, RWTValOrderedVector<RWCString> *stringVec) 
		: zPane(w,siz,WS_CHILD), _baseId(baseId), _status(1){
		_numStrings = stringVec->entries();
		backgroundColor(zColor(ZCTRL_FILLER));
		show();
		for(int i=0;i<_numStrings;i++){
			incItem = new zCheckBox(this, new zPercentSizer(ZGRAV_LEFT,(float)100.0,(float)(100.0/_numStrings),sizer()), WS_CHILD | BS_AUTOCHECKBOX | WS_VISIBLE, (*stringVec)[i].data(), baseId+i);
			incItem->show();
			rwList.insert(new ZatItem((zPane *)incItem,0,i));
		}
}

ZatCheckBoxGroup::~ZatCheckBoxGroup(){
//	rwList.clearAndDestroy();
//	delete _itemStrings;
}

int ZatCheckBoxGroup::setItem(int num, BOOL onOff){
	if(num < 0 || num >= _numStrings) return 0;
	rwItemIterator *itr = new rwItemIterator(rwList);
	(*itr)();
	for(int i=0;i<num;i++) 
		(*itr)();
	zCheckBox *cb = (zCheckBox *)(itr->key()->w());
	cb->check(onOff);
	return onOff;
}

int ZatCheckBoxGroup::checkItem(int num){
	if(num < 0 || num >= _numStrings) return 0;
	rwItemIterator *itr = new rwItemIterator(rwList);
	(*itr)();
	for(int i=0;i<num;i++) 
		(*itr)();
	zCheckBox *cb = (zCheckBox *)(itr->key()->w());
	return cb->check();
}

int ZatCheckBoxGroup::command(zCommandEvt *Ev){

	cbgEvent.notify(Ev->cmd()-_baseId,checkItem(Ev->cmd()-_baseId),_baseId);
	return 1;
}
#endif

