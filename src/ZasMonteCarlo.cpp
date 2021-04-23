#ifdef _ZAPP_GUI_
#include <zapp.hpp>
#include <intpack/zip.hpp>
#include "ZasMonteCarlo.h"

#include "globals.h"
#include "Simulation.h"
#include "MonteControl.h"
#include "ZatDialogConstants.h"
#include "ZasMenuConst.h"
#include "ZasMediatorFactory.h"
#include "mapConstants.h"

ZasMonteCarlo::ZasMonteCarlo(zWindow *w, zResId &rid)
    : zDialogFrame(w,rid), w_(w),lock_(0) {
	esNumGames_ = new ZatEditSliderLong(
	    this,
	    new zSizer(zDialogUnit(10,40), zDialogUnit(123,10)),"Games:",
	    ZAT_LONGEDITSLIDER,1,500);
	esNumGames_->show();
	progBarCtl_ = new zProgressBar(
	    this,
	    new zSizer(zDialogUnit(10,55),zDialogUnit(123,10)),
	    Z_LEFTTORIGHT | Z_BORDER3D | ZALIGN_CENTER);
	progBarCtl_->show();
	numberOfGames = 5;
	esNumGames_->setValue(long(numberOfGames));
	esNumGames_->setRange( 1, 100 );
	MonteCarlo->set_ngames(numberOfGames);
	registerEvents();
	show();
}

int ZasMonteCarlo::command(zCommandEvt *Ev){
	if(Ev->cmd() == IDC_OK){
		Simulation::run_monte();
		ZasMediatorFactory::Instance(w_)->makeGraph(ID_SG_MONTE);
		shutdown();
	}
	if(Ev->cmd() == IDC_CANCEL){
		shutdown();
	}
	return 0;
}
ZasMonteCarlo::~ZasMonteCarlo(){
	unRegisterEvents();
	delete esNumGames_;
	delete progBarCtl_;
}

void
ZasMonteCarlo::registerEvents(){
	if(esNumGames_)
	    esNumGames_->evLongChanged()->attach(
		this, &ZasMonteCarlo::_sliderModified);
	if(progBarCtl_)
	    MonteCarlo->evNewGame()->attach(
		this, &ZasMonteCarlo::_newGameStarted);
}

void ZasMonteCarlo::unRegisterEvents(){
	if(esNumGames_)
	    esNumGames_->evLongChanged()->detach(
		this, &ZasMonteCarlo::_sliderModified);
	if(progBarCtl_)
	    MonteCarlo->evNewGame()->detach(
		this, &ZasMonteCarlo::_newGameStarted);
}

void ZasMonteCarlo::sliderModified(const long val, const int id){
	if(!lock_){
		lock_=1;
		::MonteCarlo->set_ngames(unsigned(val));
		numberOfGames = unsigned(val);
		lock_=0;
	}
}
void ZasMonteCarlo::_sliderModified(void *ptr, const long val, const int id){
	ZasMonteCarlo *zmc = (ZasMonteCarlo *)ptr;
	zmc->sliderModified(val,id);
}

void ZasMonteCarlo::_newGameStarted(void *ptr, const int val){
	ZasMonteCarlo *zmc = (ZasMonteCarlo *)ptr;
	zmc->newGameStarted(val);
}

void ZasMonteCarlo::newGameStarted(const int val){
	char buf[20];
	float f	= (float)((double(val)/double(numberOfGames))*100.0);
	progBarCtl_->setPercent(f);
	sprintf(buf,"%d",val);
	progBarCtl_->text(buf);
	progBarCtl_->setDirty();
	progBarCtl_->update();
}

#endif

