// ZatTabDialog.h 
//
// HOW TO:
// Base class for most dialog windows.  Simply inherit from this class and
// override the virtual functions drawDialog(), and command().  
// The drawDialog function in your new class should build all the buttons, 
// floatsliders, check boxes and such that make up your dialog. 
// The command function comes from the zApp class zWindow and is called whenever
// a event is triggered on your dialog. See the zApp manual for more information 
// on this function.
//
// QUICK OVERVIEW:
// Events from the pushbuttons pbCancel, pbApply, pbOK, pbHelp, and pbReset are 
// designed to communicate back to a mediator (ZatTabDialogMed) via their respective 
// implicit invocation objects evCancel, evApply, etc.  
// The evControlRegistration event can be used to register events with controls
// in the process of the drawDialog() function.  For example, if you build a dialog
// and you won't know how many sliders it should have until after it's been built, 
// you can pass that number to the drawDialog() function and it can then use the 
// evControlRegistration event to contact the mediator after you build each new control
// so that the mediator may register events with a specific control.  
// This allows you to design custom controls and maintains a separation between the 
// view of the data (ZatTabDialog) and the data itself, cached in a interfaceDataControl 
// class.  The mediator attaches static functions to the dialog via the 
// dlg_cancel_event() functions and the like.

#ifdef _ZAPP_GUI_
#ifndef _ZatTabDialog_h_
#define _ZatTabDialog_h_

#include "ZatImpTabCtrl.h"
#include "ZatDialogBase.h"
#include "ZatDefines.h"

class ZatTabDialog : public ZatDialogBase {

  protected:
	
	ZatImpTabCtrl *tc_;
    signalInt evTabSelected_;
    RWTValOrderedVector<RWCString> tabNames_;  

	unsigned numItemsPerTab_, numTabs_, currentIndex_;
	 

	void appendTab(int tabIndex, const char *tabName);
	int buildTabControl(zSizer *szr);
	int buildRowColumnControl(zSizer *szr);

  public:

    ZatTabDialog(zWindow *w, zResId & rid);
    ZatTabDialog(zWindow *w, zSizer *siz, DWORD dw=0, const char *nt=NULL);
	virtual ~ZatTabDialog();

	virtual int drawDialog(unsigned topMargin);
	static void _cbTabSelected(void *vp, const int newIndex, const int oldIndex);
	virtual void cbTabSelected(const int newIndex, const int oldIndex);
	signalInt *evTabSelected(){ return &evTabSelected_; }
	virtual void drawStandardLayout(int sliderType = ZAT_DOUBLEEDITSLIDER);
	void addTabName(const char *name){ tabNames_.insert(name); }
	int numItemsPerTab(){return numItemsPerTab_;}
	void setNumItemsPerTab(unsigned ni){ numItemsPerTab_ = ni; }
	virtual void setCheckBox(unsigned box, unsigned checked, unsigned id);
	virtual int isBoxChecked(unsigned item, unsigned box);
	unsigned currentIndex(){ return currentIndex_; }			
	void setCurrentIndex(int ci){ currentIndex_ = ci; }	
	
};

#endif
#endif
