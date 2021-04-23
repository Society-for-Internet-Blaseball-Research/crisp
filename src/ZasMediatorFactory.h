#ifdef _ZAPP_GUI_
#ifndef _ZasMediatorFactory_
#define _ZasMediatorFactory_

#include <rw/tvordvec.h>
#include <rw/tpordvec.h>


#include "smart_ptr.h"
#include "ZatDialogMedBase.h"
#include "zcGraphMediator.h"

//typedef RWTValOrderedVector<zcSpDialogMed> rwSpDialogList;
//typedef RWTValOrderedVector<zcSpGraphMed> rwSpGraphList;

typedef RWTPtrOrderedVector<ZatDialogMedBase> rwDialogList;
typedef RWTPtrOrderedVector<zcGraphMediator> rwGraphList;

class ZasMediatorFactory {

	rwDialogList dlist;
	rwGraphList glist;
	zWindow *_w;
	long _ref;
	static ZasMediatorFactory *_instance;

  protected:
	ZasMediatorFactory(zWindow *w);

  public:
	~ZasMediatorFactory();
	
	static utSmartPtr<ZasMediatorFactory> Instance(zWindow *w);
	
	inline long ref(){ return ++_ref; }
	inline long unref(){ return --_ref; }

	int makeGraph(const int type);
	int makeDialog(const int type);

	int removeGraph(zcGraphMediator *med);
	int removeDialog(ZatDialogMedBase *med);

	static void _removeGraph(void *factory, zcGraphMediator *med);
	static void _removeDialog(void *factory, ZatDialogMedBase *med);
	
};

typedef utSmartPtr<ZasMediatorFactory> spZasMediatorFactory;
#endif
#endif





