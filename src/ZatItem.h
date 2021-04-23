#ifdef _ZAPP_GUI_
#ifndef _ZatItem_h_
#define _ZatItem_h_

#include <rw/tpdlist.h>
//typedefs for iterator and list types are at the bottom...
class ZatItem { 

private:

	zWindow *win_;
	ZatItem *nextItem_;
	ZatItem *prevItem_;
	int r_;
	int c_;
	int id_;
	int groupId_;

public:

	ZatItem(zWindow *win, int r=0 , int c=0, int id=0, int groupId=0) 
		: win_(win), r_(r), c_(c), id_(id), groupId_(groupId), nextItem_(NULL), prevItem_(NULL) {}

	virtual ~ZatItem(){ delete win_; }

	ZatItem *next(){ return nextItem_; }
	ZatItem *prev(){ return prevItem_; }

	zWindow *w(){ return win_; }
	int r(void) const { return r_; }
	int c(void) const { return c_; }
	int id(void) const{ return id_;	}
	int groupId(){return groupId_;}

};

typedef RWTPtrDlistIterator<ZatItem> rwItemIterator;
typedef RWTPtrDlist<ZatItem> rwItemList;


#endif
#endif
