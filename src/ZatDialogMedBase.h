#ifdef _ZAPP_GUI_
#ifndef _ZatDialogMedBase_h_
#define _ZatDialogMedBase_h_

#include <help/zhelp.hpp>
#include "interfaceDataControl.h"
#include "ZatDialogBase.h"
#include "smart_ptr.h"

class ZatDialogMedBase;

typedef utImplicit1<ZatDialogMedBase *> signalDialog;

class ZatDialogMedBase {
    
  protected:

	signalDialog evRemove_;
    ZatDialogBase *dialog_;
	zHelp *helpWin_;
	int lock_, ref_, helpPage_, delta_, cbColumn_, activeTracking_;
	interfaceDataControl *idc_;

  public:
    
    ZatDialogMedBase(interfaceDataControl *idc, ZatDialogBase *dialog) : dialog_(dialog), idc_(idc), lock_(0), delta_(0), cbColumn_(1), activeTracking_(0){
		helpWin_ = new zHelp("crisp2.zhp");
	}
    virtual ~ZatDialogMedBase(){
		delete helpWin_;
	}

	void show( int sw = SW_SHOWNORMAL ) { dialog_->show( sw ); };

	signalDialog *evRemove(){ return &evRemove_; }
	inline int ref(){ return ++ref_; }
	inline int unref(){ return --ref_; }

	virtual void listUpdate()=0;
    virtual void RegisterEvents(void);
	void unRegisterEvents(void);
	int operator==(const ZatDialogMedBase &ref){ 
		if(&ref == this)
			return 1;
		return 0;
	}

    virtual void cbApply(const int i);
    virtual void cbOK(const int i);
    virtual void cbCancel(const int i);
	virtual void cbReset(const int i);
	virtual void cbHelp(const int i);

	virtual void cbControlRegistration(ZatItem *zi);
	virtual void cbEditSliderLongModified(const long delta, const int i){}
	virtual void cbEditSliderDoubleModified(const double delta, const int i){}
	virtual void cbDeltaModified(const int box, const int checked,const int id);	
	virtual void cbCheckAllModified(const int box, const int checked,const int id);	
	virtual void cbCheckBoxModified(const int box, const int checked,const int id);	
    virtual void cbStaticComboBox1(const int i);
    virtual void cbStaticComboBox2(const int i);


    static void _cbApply(void *msg, const int i);
    static void _cbOK(void *msg, const int i);
    static void _cbCancel(void *msg, const int i);
    static void _cbReset(void *msg, const int i);
	static void _cbHelp(void *msg, const int i);

	static void _cbControlRegistration(void *msg, ZatItem *zi);
	static void _cbEditSliderLongModified(void *msg, const long delta, const int i);
	static void _cbEditSliderDoubleModified(void *msg, const double delta, const int i);
	static void _cbDeltaModified(void *msg, const int box, const int checked, const int id);
	static void _cbCheckBoxModified(void *msg, const int box, const int checked, const int id);
	static void _cbCheckAllModified(void *msg, const int box, const int checked, const int id);
    static void _cbStaticComboBox1(void *msg, const int i);
    static void _cbStaticComboBox2(void *msg, const int i);

};

typedef utSmartPtr<ZatDialogMedBase> spZatDialogMedBase;

#endif
#endif





