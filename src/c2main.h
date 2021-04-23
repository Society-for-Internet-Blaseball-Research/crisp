#ifndef _MAIN_H_
#define _MAIN_H_


class C2Main:public zAppFrame {

    zPoint oldPos;
    zDimension oldSize;
	ZatMapPane *mapPane; 
    ZasMapMedCrispHarvest *mapMed;
    zStatusLineEZ *sline;
    zToolbar *tbar;
    zComboBoxStatic *fishList;
    zComboBoxStatic *stockList;
    zBitmapButton *fishCircle, *stockCircle, *mapButton, 
		*helpButton, *gridButton;
    static spZasMediatorFactory factory;
    spZasGraphUpdateMed graphUpdate;

  public:
    
    C2Main();
    ~C2Main(); 

    virtual int command(zCommandEvt *ev);
	void runScenarioGUI( void );
    int defaultFisheryChange(zEvent *ev);
    int defaultStockChange(zEvent *ev);
    void mapSelectionUpdate(const char *, const int, const int);
    static void _mapSelectionUpdate(void *,
				    const char *, const int, const int);
    void mapItemSelected(const char *, const int, const int);
    static void _mapItemSelected(void *,
				 const char *, const int, const int);
};

class DAbout : public zFormDialog {
    zButton *pOK;
    zGroupBox *gro;

public:
    DAbout(zWindow *, const zResId&);
    ~DAbout() {delete gro;}
};

#endif
