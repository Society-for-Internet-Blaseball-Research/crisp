// ZatDialogBase.h 
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
// designed to communicate back to a mediator (ZatDialogBaseMed) via their respective 
// implicit invocation objects evCancel, evApply, etc.  
// The evControlRegistration event can be used to register events with controls
// in the process of the drawDialog() function.  For example, if you build a dialog
// and you won't know how many sliders it should have until after it's been built, 
// you can pass that number to the drawDialog() function and it can then use the 
// evControlRegistration event to contact the mediator after you build each new control
// so that the mediator may register events with a specific control.  
// This allows you to design custom controls and maintains a separation between the 
// view of the data (ZatDialogBase) and the data itself, cached in a interfaceDataControl 
// class.  The mediator attaches static functions to the dialog via the 
// dlg_cancel_event() functions and the like.
#ifdef _ZAPP_GUI_
#ifndef _ZatDialogBase_h_
#define _ZatDialogBase_h_

#include <rw/tvvector.h>
#include <rw/tvordvec.h>
#include <rw/cstring.h>
#include "implicit.h"
#include "ZatItem.h"
#include "ZatRowColumnBox.h"

typedef utImplicit1<const int> signalInt;
typedef utImplicit1<ZatItem *> signalReg;

class ZatDialogBase : public zDialogFrame {

  protected:

	// tells the status of the ZatComboBoxGroups for each numItems_ 
	// This previously wasn't necessary, but with the advent of the TabDialogs..
	RWTValVector<int> cbgTags_;  
	RWTValOrderedVector<RWCString> cbgBoxName_;  
	
	//Controls
	zPushButton *pbCancel_, *pbApply_, *pbOK_, *pbHelp_, *pbReset_;
	zComboBoxStatic *cmbStatic_[2];
	zSizer *cbgContainer_;
	ZatRowColumnBox *rc_, *rcDefControls_;     

	//Events
    signalInt evCancel_, evApply_, evOK_, evReset_, evHelp_, evCmbStatic1_, evCmbStatic2_;
    signalReg evControlRegistration_;

	//numItems is the total number of Items in the tab, rowColumn obj or whatever.
	unsigned numItems_, topMargin_;
	// numFixedItems_ is the first "n" items which are not editable because
	//  they are in the calibration years or whatever.
	unsigned numFixedItems_;
	void buildDefaultButtons();
	
  public:

    
    ZatDialogBase(zWindow *w, zResId & rid);
    ZatDialogBase(zWindow *w, zSizer *siz, DWORD dw=0, const char *nt=NULL);
	virtual ~ZatDialogBase();
	void setTopMargin(unsigned top){ topMargin_ = top; }
	virtual int drawDialog(unsigned topMargin);
	//Draws the dialog in it's standard layout..
	virtual void drawStandardLayout(int sliderType);
	virtual int buildRowColumnControl(zSizer *siz);
	//This is the total number of data items your dialog will maintain.. typically
	//this is set to Chronographer->nyears();
	unsigned numItems(){return numItems_;}	
	void setNumItems(unsigned ni){ numItems_ = ni; }
	// This prevents automatic checking and updating of the first "n" items.
	unsigned numFixedItems() { return numFixedItems_; };
	void setNumFixedItems( unsigned nfi ) { numFixedItems_ = nfi; };
	//Tells the number of boxes in your check box groups, (ie "Y" "S" "F" would be 3)
	unsigned numBoxes(){return cbgBoxName_.entries();}
	//For inserting boxes into your cbg(check box group) column
	virtual void addBoxName(const char *tag);
	//Since some derived classes, such as the TabDialogs, won't be maintaining
	//the status of the check box groups directly, we give you the
	//option to store it in the dialog
	virtual int isBoxChecked(unsigned item, unsigned box=0);
	virtual void setCheckBox(unsigned box, unsigned checked, unsigned id);
	//this selects an item in one of the static combo boxes, such as a fishery or stock
	int selectComboBox(int i=-1, unsigned box=0);
	//for adding text to a combo box, (ie "North T")
	void addComboBoxText(const char *text, unsigned box=0);
	void clearComboBox(unsigned box=0){ if(box<=1) cmbStatic_[box]->reset();}
	void addComboBox(unsigned box=0);
	//this grabs an iterator from the main row column widget so that you might traverse
	//through the control objects (cbgs, edit sliders, buttons, etc)
	virtual rwItemIterator *getItemIterator(){if(rc_)return rc_->getItemIterator();return NULL;}    

	//Standard Dialog Events
	virtual int cbCancel(zEvent *);
	virtual int cbApply(zEvent *);
	virtual int cbOK(zEvent *);
	virtual int cbReset(zEvent *);
	virtual int cbHelp(zEvent *);
	virtual int command(zCommandEvt *Ev);

    signalInt *evCmbStatic1(){ return &evCmbStatic1_; }
    signalInt *evCmbStatic2(){ return &evCmbStatic2_; }
	signalInt *evCancel(){ return &evCancel_; }
    signalInt *evApply(){ return &evApply_; }
    signalInt *evOK(){ return &evOK_; }
	signalInt *evReset(){ return &evReset_; }
	signalInt *evHelp(){ return &evHelp_; }
	signalReg *evControlRegistration(){ return &evControlRegistration_; }
			
};

#endif
#endif



