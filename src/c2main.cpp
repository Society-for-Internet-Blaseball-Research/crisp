// Crisp 2 Main, 1995, Steve U.

//ENGINE STUFF
#include <iostream.h>
#include <stdlib.h>
#include "log.h"
#include "init.h"
#include "globals.h"
#include "Simulation.h"
#include "Args.h"

extern void PrintStats();

int DefaultFishery = 0;
int DefaultStock = 0;

// common routine to perform core execution without any GUI.  does not
// include initializaton.

static void
executeNonGui(Args args)
{
    //no GUI runs scenario unless monte explicitly requested
    if (args.get_monte_games()){
	cout << "monte:" << endl;
	Simulation::run_monte();
    }
    else if (Calib){
	cout << "calbration:" << endl;
	Simulation::run_calibration();
    }
    else{
	cout << "scenario run:" << endl;
	Simulation::run_scenario();
	cout << "complete. " << endl;
    }
    PrintStats();
    cout << "stats printed." << endl;
}

#ifdef _ZAPP_GUI_

#include <zapp.hpp>

#include <intpack/zip.hpp>

#include <help/zhelp.hpp>
#include <iostream.h>
#include "ZasMenuConst.h"
#include "ZasMediatorFactory.h"
#include "ZasGraphUpdateMed.h"
#include "ZasMapMedCrispHarvest.h"
#include "GUI.h"
#include "c2main.h"
#include "zcMouseToolCrisp2.h"
#include "resource.h"

/* Available to all of app.
 */
zHelp *helpWin = NULL;

void
zApp::main() {

    //NOTE: cmdLine() doesn't give you the name of the executable, just args
    Args args(cmdLine());
    // reads setup data; initialize globals
    if (ModelInit(&args) < 0){
		::LogMsg(L_Fatal, "unable to initialize; exiting...\n");
		exit(-1);
    }
    if (args.get_ui_mode() != UI::NONE){
		// When GUI::start returns, the programs entire interface exits.
		GUI::start(&args);
		C2Main *appWin = new C2Main();
		go();
		delete appWin;
    }
    else
		::executeNonGui(args);

    GUI::finish();
    ModelCleanup();
}

#ifdef WIN32
char *version = "CRiSP Harvest v3.0.6 (WIN32 Version)";
#else
char *version = "CRiSP Harvest v3.0.6 (SunOS 4.1.x Version)";
#endif

spZasMediatorFactory C2Main::factory;

C2Main::C2Main() : zAppFrame(0,new zSizer(10,10,620,460),zSTDFRAME,version) {
	int ss=1;
	menu(new zMenu(this, zResId(MAINMENU)));
	tbar=new zToolbar(this, new zGravSizer(ZGRAV_TOP,27,sizer()));
	fishList = new zComboBoxStatic(
	    tbar, new zSlotSizerForComboBox(ss++, zPoint(0,2),
		zDimension(150,200), tbar->sizer()),
	    LBS_STANDARD | CBS_DROPDOWN | WS_VSCROLL | WS_CHILD | WS_TABSTOP,
	    "Fisheries", ID_SELFIS);
	fishList->backgroundColor(ZCTRL_FILLER);
	for (int f = 0; f < ::Fisheries.num(); f++){
	    fishList->add(::Fisheries[f].get_name());
	    fishList->setNotifySelChange(
		this, (NotifyProc)&C2Main::defaultFisheryChange);
	}
	fishList->show();
	new zSlotSizer(ss++, zDimension(9,0), tbar->sizer());
	stockList = new zComboBoxStatic(
	    tbar, new zSlotSizerForComboBox(ss++, zPoint(0,2),
		zDimension(180,200), tbar->sizer()),
	    LBS_STANDARD | CBS_DROPDOWN | WS_VSCROLL
	    | WS_CHILD | WS_TABSTOP, "Stocks", ID_SELSTO);
	stockList->backgroundColor(ZCTRL_FILLER);
	for (int s = 0; s < ::Stocks.num(); s++){
	    stockList->add(::Stocks[s].get_name());
	    stockList->setNotifySelChange(
		this, (NotifyProc)&C2Main::defaultStockChange);
	}
	stockList->show();
	new zSlotSizer(ss++, zDimension(9,0), tbar->sizer());
/*	(new zBitmapButton(
	    tbar, new zSlotSizer(ss++,zDimension(25,22),tbar->sizer()),
	    ZBB_FULL | ZBB_OFFDEP, "", ID_OPEN,
	    new zBitmap(zResId(ID_OPEN))))->show();
	(new zBitmapButton(
	    tbar, new zSlotSizer(ss++,zDimension(25,22),tbar->sizer()),
	    ZBB_FULL | ZBB_OFFDEP, "", ID_SAVE,
	    new zBitmap(zResId(ID_SAVE))))->show();
*/
	zBitmapButton *printButton = new zBitmapButton(
	    tbar, new zSlotSizer(ss++,zDimension(25,22),tbar->sizer()),
	    ZBB_FULL | ZBB_OFFDEP, "", ID_PRINT,
	    new zBitmap(zResId(ID_PRINT)));
	printButton->show();
	new zSlotSizer(ss++, zDimension(10,0), tbar->sizer());
	(fishCircle = new zBitmapButton(
	    tbar,new zSlotSizer(ss++,zDimension(25,22),tbar->sizer()),
	    ZBB_PARTIAL | ZBB_TWOSTATE | ZBB_OFFON, "", ID_SELFIS,
	    new zBitmap(zResId(ID_SELFIS))))->show();
	fishCircle->check(1);
	(stockCircle = new zBitmapButton(
	    tbar,new zSlotSizer(ss++,zDimension(25,22),tbar->sizer()),
	    ZBB_PARTIAL | ZBB_TWOSTATE | ZBB_OFFON, "", ID_SELSTO,
	    new zBitmap(zResId(ID_SELSTO))))->show();
	stockCircle->check(1);
	(helpButton = new zBitmapButton(
	    tbar,new zSlotSizer(ss++,zDimension(25,22),tbar->sizer()),
	    ZBB_PARTIAL | ZBB_TWOSTATE | ZBB_OFFON, "", ID_MAPHELP,
	    new zBitmap(zResId(ID_MAPHELP))))->show();
	(mapButton = new zBitmapButton(
	    tbar,new zSlotSizer(ss++,zDimension(25,22),tbar->sizer()),
	    ZBB_PARTIAL | ZBB_TWOSTATE | ZBB_OFFON, "", ID_MAPSIZE,
	    new zBitmap(zResId(ID_MAPSIZE))))->show();
	(gridButton = new zBitmapButton(
	    tbar,new zSlotSizer(ss++,zDimension(25,22),tbar->sizer()),
	    ZBB_PARTIAL | ZBB_TWOSTATE | ZBB_OFFON, "", ID_GRID,
	    new zBitmap(zResId(ID_GRID))))->show();
	new zSlotSizer(ss++, zDimension(9,0), tbar->sizer());
	(new zBitmapButton(
	    tbar,new zSlotSizer(ss++,zDimension(25,22),tbar->sizer()),
	    ZBB_FULL | ZBB_OFFDEP, "", ID_SCE,
	    new zBitmap(zResId(ID_SCE))))->show();
	new zSlotSizer(ss++, zDimension(10,0), tbar->sizer());
	(new zBitmapButton(
	    tbar,new zSlotSizer(ss++,zDimension(25,22),tbar->sizer()),
	    ZBB_FULL | ZBB_OFFDEP, "", ID_MOUSETOOL,
	    new zBitmap(zResId(ID_MOUSETOOL))))->show();
	new zSlotSizer(ss++, zDimension(10,0), tbar->sizer());
	tbar->show();
	sline=new zStatusLineEZ(
	   this, new zGravSizer(ZGRAV_BOTTOM,27,sizer()), ZSL_CREATEMAINITEM | ZSL_MENUHELPITEM);//ZSL_STANDARD
	new zStatusClock(sline,ZGRAV_RIGHT,IDSL_CLOCK);
	new zStatusItemText(sline,new zGravSizer(ZGRAV_RIGHT,80,sline->sizer()),IDSL_LATITUDE,ZALIGN_CENTER | ZSLTEXT_DOCLIPPING);
	new zStatusItemText(sline,new zGravSizer(ZGRAV_RIGHT,80,sline->sizer()),IDSL_LONGITUDE,ZALIGN_CENTER | ZSLTEXT_DOCLIPPING);
	sline->show();
	mapPane = new ZatMapPane(this);
	mapMed = new ZasMapMedCrispHarvest(
	    mapPane,new mapController("map.dat"));
	//printButton->setNotifyMouseButtonUp(mapPane,(NotifyProc)&ZatMapPane::printMap);
	mapMed->evStatus()->attach(this, &C2Main::_mapSelectionUpdate);
	mapMed->evSelected()->attach(this, &C2Main::_mapItemSelected);
	helpWin = new zHelp("crisp2.zhp");
	helpWin->enableHelpKey(1);

	fishList->selection(DefaultFishery);
	stockList->selection(DefaultStock);

	factory = ZasMediatorFactory::Instance(this);
	graphUpdate = ZasGraphUpdateMed::instance();

	show();
	update();
	runScenarioGUI();  // KLUDGE
}

C2Main::~C2Main(){
    delete mapMed;
}

int
C2Main::defaultFisheryChange(zEvent *ev){
	for (int s = 0; s < ::Fisheries.num(); s++)
		if(!strcmp(::Fisheries[s].get_name(),
			   fishList->text(fishList->selection())))
		    DefaultFishery = s;
	return 0;
}

int
C2Main::defaultStockChange(zEvent *ev){

	for (int s = 0; s < ::Stocks.num(); s++)
		if(!strcmp(::Stocks[s].get_name(),
			   stockList->text(stockList->selection())))
		    DefaultStock = s;
	return 0;
}

char* types[]={
    "Option Files (*.opt)" , "*.opt", "All Files (*.*)", "*.*",  0,0
};

/* This is a separate routine so that it can be called when the app
 *  is first launched, as well as from the command event system.
 */
void C2Main::runScenarioGUI( void ) {
	sline->text(0, "Running Scenario...");
	sline->update();
	Simulation::run_scenario();
	PrintStats();
	sline->text(0, "Done.");
}

int
C2Main::command(zCommandEvt *ev) {
/*	if (ev->cmd()==ID_OPEN) {
		zFileOpenForm *tmp=new zFileOpenForm(this,
						     "Select File",0,types);
	    if (tmp->completed()) {
			// do whatever
	    } else {
			// do whatever else
	    }
	    delete tmp;
	    return 1;
	}
	else if (ev->cmd()>=ID_SAVE && ev->cmd()<=ID_SAVEAS) {
		zFileSaveAsForm *tmp=new zFileSaveAsForm(this,
							 "Save As..",0,types);
	    if (tmp->completed()) {
			// do whatever
	    } else {
			// do whatever else
	    }
	    delete tmp;
	}
*/
	if (ev->cmd()==ID_PRINT) {
		mapPane->printMap(NULL);
	}
	else if(ev->cmd()==ID_EXIT) {
	    app->quit();
	    return 1;
	}
	else if(ev->cmd()==ID_MAPSIZE) {
	    if(mapButton->check()){
		oldPos = sizer()->pos();
		oldSize = sizer()->dimension();
		move(oldPos.x(),oldPos.y(),640,75);
	    }
	    else{
		move(oldPos.x(),oldPos.y(),
		     oldSize.width(),oldSize.height());
	    }
	    return 1;
	}
	else if (ev->cmd()==ID_GRID) {
	    mapMed->setGridLines(gridButton->check());
		mapMed->clearAndRedraw();
	}
	else if (ev->cmd()==ID_SCE) {
		runScenarioGUI();
	}
	else if (ev->cmd()==ID_MOUSETOOL) {
	    zcMouseToolCrisp2 *mt = zcMouseToolCrisp2::Instance(this);
	    mt->show();
	}
	else if (ev->cmd()==ID_CON) {
	    if(helpWin)helpWin->jumpToPage("index.html");
	}
	else if (ev->cmd()==ID_GETSTA) {
	    if(helpWin)helpWin->jumpToPage("users29g.htm");
	}
	else if (ev->cmd()==IDC_README) {
	    if(helpWin)helpWin->jumpToPage("readme.html");
	}
	else if (ev->cmd()==ID_SELFIS) {
	    if(!fishCircle->check())mapMed->clearFisheryCircles();
	}
	else if (ev->cmd()==ID_SELSTO) {
	    if(!stockCircle->check())mapMed->clearStockCircles();
	}
	else if (ev->cmd()==ID_ABO) {
		RWCString cstr = version;
		cstr += "\n\nProgramming and Documentation:\n\n";

		cstr += "T. Frever, T. Bunch, S. Umbehocker, M. Moore, N. Beer, S. Iltis, J. Norris\n\n";

		cstr += "CRiSP Harvest is a user-friendly version of the Pacific Salmon Commission(PSC)\n";
		cstr += "Chinook Model calibrated through 1995. The PSC Chinook Technical Committee\n";
		cstr += "provided most of the underlying theory and computation algorithms. Funding for\n";
		cstr += "this project was provided by the Bonneville Power Administration. See the\n";
		cstr += "README file and User's Guide for functional limitations of CRiSP Harvest.\n\n";

		cstr += "Please reference this program as:\n\n";

		cstr += "Norris, J., T. Frever, T. Bunch, S. Umbehocker, M. Moore, N. Beer, and S. Iltis. 1997.\n";
		cstr += "CRiSP Harvest: a user-friendly chinook salmon harvest management model.\n";
		cstr += "Columbia Basin Research, University of Washington, Seattle, WA.\n\n";

		cstr += "Address all correspondence to:\n\n";

		cstr += "CRiSP Harvest\n";
		cstr += "Columbia Basin Research\n";
		cstr += "University of Washington\n";
		cstr += "Box 358218\n";
		cstr += "Seattle, WA 98195\n\n";

		cstr += "jnorris@olympus.net";

	    zMessage *zm = new zMessage(this,
					cstr, "About", MB_OK | MB_ICONINFORMATION);

	}
	else if (ev->cmd() > ID_FG_MIN && ev->cmd() < ID_HG_MAX) {
	    factory->makeGraph(ev->cmd());
	}
	else if ((ev->cmd() > ID_DLG_MIN && ev->cmd() < ID_DLG_MAX)
		 || (ev->cmd() == ID_MON) || (ev->cmd() == ID_CAL)) {
	    factory->makeDialog(ev->cmd());
	}
	return 0;
}
void
C2Main::_mapItemSelected(void *ptr, const char *data,
			 const int type, const int action){
	C2Main *tem = (C2Main *)ptr;
	tem->mapItemSelected(data, type, action);
}

void
C2Main::_mapSelectionUpdate(void *ptr, const char *data,
			    const int type, const int action){
	C2Main *tem = (C2Main *)ptr;
	tem->mapSelectionUpdate(data, type, action);
}

void
C2Main::mapItemSelected(const char *data, const int type, const int action){
	if(type == FISHERY){
		//find the index for the fishery
		for(int i=0;i<::Fisheries.num();i++)
			if(!strcmp(::Fisheries[i].get_name(),data))
				DefaultFishery = i;

		(zcMouseToolCrisp2::Instance(this))->executeCommand(action,0);
		fishList->selection(::Fisheries[DefaultFishery].get_name());
		if(fishCircle->check())
			mapMed->drawCircles(
			    type,::Fisheries[DefaultFishery].get_name());
	}
	else if(type == STOCK){
		//find the index for the stock
		for(int i=0;i<::Stocks.num();i++)
			if(!strcmp(::Stocks[i].get_name(),data))
				DefaultStock = i;

		(zcMouseToolCrisp2::Instance(this))->executeCommand(action,1);
		stockList->selection(::Stocks[DefaultStock].get_name());
		if(stockCircle->check())
			mapMed->drawCircles(
			    type,::Stocks[DefaultStock].get_name());
	}
	else if(type == 0 && action == 1){
		mapMed->clearFisheryCircles();
		mapMed->clearStockCircles();
	}
}

void
C2Main::mapSelectionUpdate(const char *data, const int type, const int action){

	static char pageName[80];
	static char oldPageName[80];

	//Update the status bar
	if(action == -1)
		sline->text(0,data);
	else if(action == -2){
		sline->text(IDSL_LATITUDE,data);
		return;
	}
	else if(action == -3){
		sline->text(IDSL_LONGITUDE,data);
		return;
	}


	//Update the graphs
	if(type == FISHERY){
		for(int i=0;i<::Fisheries.num();i++)
			if(!strcmp(::Fisheries[i].get_name(),data))
				graphUpdate->updateGraphs(i,type);
	}
	else if(type == STOCK){
		for(int i=0;i<::Stocks.num();i++)
			if(!strcmp(::Stocks[i].get_name(),data))
				graphUpdate->updateGraphs(i,type);
	}

	//Update the map's context sensitive help screen.
	if(helpButton->check()){
		char *p,*j;
		sprintf(pageName,"mapinfo.html#%s",data);
		p = j = pageName;
		//chopping out the spaces..
		while(*j != '\0' && *p != '\0'){
			if(*j==' ')j++;
			*p = *j;
			if(*j == '\0') break;
			j++;p++;
			if(*j == '\0')*p = *j;
		}
		//Update help just once.
		if(strcmp(pageName,oldPageName)){
			strcpy(oldPageName,pageName);
			if(helpWin)helpWin->jumpToPage(pageName);
		}
	}

}

DAbout::DAbout(zWindow *w,const zResId& rid) : zFormDialog(w,rid) {
	show();
}

#else // _ZAPP_GUI_

main(int argc, char **argv)
{
    Args args(argc, argv);
    if (ModelInit(&args) < 0){
 	::LogMsg(L_Fatal, "unable to initialize; exiting...\n");
	exit(-1);
    }
    ::executeNonGui(args);
    ModelCleanup();

    return (0);
}


#endif // _ZAPP_GUI_
