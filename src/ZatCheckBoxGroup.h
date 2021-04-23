#ifdef _ZAPP_GUI_
#ifndef _ZatCheckBoxGroup_h_
#define _ZatCheckBoxGroup_h_

#include "implicit.h"
#include "ZatItem.h"
#include "ZatDefines.h"
#include <rw/tvordvec.h>

typedef utImplicit3<const int, const int, const int> signal_iii;

class ZatCheckBoxGroup : public zPane {

	zCheckBox *incItem;
	rwItemList rwList;
	int _baseId;
	int _numStrings;
	char **_itemStrings;
	signal_iii cbgEvent;
	int _status;

  public:
	ZatCheckBoxGroup(zWindow *w, zSizer *siz, int baseId, RWTValOrderedVector<RWCString> *stringVec); 
	ZatCheckBoxGroup(zWindow *w, zSizer *siz, int baseId, char **itemStrings, int numStrings);
	ZatCheckBoxGroup(zWindow *w, zRect r, int baseId, char **itemStrings, int numStrings);
	virtual ~ZatCheckBoxGroup();
	virtual int command(zCommandEvt *Ev);

	int setItem(int num, BOOL onOff);
	int checkItem(int num);
	inline int numItems(){return _numStrings;}

	signal_iii *cbgRegisterEvent(){ return &cbgEvent; }
	int getStatus(){ return _status; }
	int isEnabled(){ return _status; }

	void enable(){ 
		_status = 1;
		rwItemIterator *itr = new rwItemIterator(rwList);
		while((*itr)()){
			zCheckBox *cbt = (zCheckBox *)(itr->key()->w());
			cbt->enable();
		}
	}

	void disable(){ 
		_status = 0;
		rwItemIterator *itr = new rwItemIterator(rwList);
		while((*itr)()){
			zCheckBox *cbt = (zCheckBox *)(itr->key()->w());
			cbt->disable();
		}
	}

	void setText(char **itemStr, int num){
		rwItemIterator *itr = new rwItemIterator(rwList);
		int i=0;
		while((*itr)() && (i < num)){
			zCheckBox *cbt = (zCheckBox *)(itr->key()->w());
			cbt->text(itemStr[i]);	
			i++;
		}
	}
};

#endif
#endif

