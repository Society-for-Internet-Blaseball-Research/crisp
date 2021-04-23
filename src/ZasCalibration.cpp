#ifdef _ZAPP_GUI_
#include <zapp.hpp>
#include <intpack/zip.hpp>
#include "ZasCalibration.h"
#include "globals.h"
#include "Calibrator.h"
#include "Simulation.h"
#include "ZatDialogConstants.h"

ZasCalibration::ZasCalibration(zWindow *w, zSizer *szr) : zDialogFrame(w,new zSizer(100,100,300,160),WS_CAPTION,"Calibration Run..."), w_(w), lock_(0) {
	if(!Calib){
		new zMessage(this, "Your configuration files are not properly set up for a calibration run.", "Calibration Canceled...", MB_OK);
		return;
	}

	
	#ifdef WIN32
	  	setFont(new zFont("MS Sans Serif",zDimension(8,5), FW_NORMAL));
	#else
		setFont(new zFont("MS Sans Serif",zDimension(16,10), FW_NORMAL));
	#endif	
	
	new zGravSizer(ZGRAV_RIGHT,5, sizer());
	new zGravSizer(ZGRAV_LEFT,5, sizer());
	new zGravSizer(ZGRAV_BOTTOM,5, sizer());
	new zGravSizer(ZGRAV_TOP,5, sizer());
	zGravSizer *tem = new zGravSizer(ZGRAV_TOP,26, sizer());
	new zPushButton(this, new zGravSizer(ZGRAV_RIGHT,60,tem), SS_CENTER, "Cancel", IDC_CANCEL);
	new zGravSizer(ZGRAV_RIGHT,5, tem);
	new zPushButton(this, new zGravSizer(ZGRAV_RIGHT,110,tem), SS_CENTER, "Run Calibration",IDC_OK);
	progBarCtl_ = new zProgressBar(this, new zGravSizer(ZGRAV_BOTTOM,20,sizer()), Z_LEFTTORIGHT | Z_BORDER3D | ZALIGN_CENTER);
	progBarCtl_->show();

	new zGravSizer(ZGRAV_BOTTOM,10, sizer());
	tem = new zGravSizer(ZGRAV_BOTTOM,20,sizer());
	esMinEV_ = new ZatEditSliderDouble(this, new zGravSizer(ZGRAV_RIGHT,180,tem),"",ZAT_DOUBLEEDITSLIDER,0.0,1.0);
	esMinEV_->show();
	new zStaticText(this, new zGravSizer(ZGRAV_RIGHT,110,tem), SS_RIGHT, "Minimum EV:");

	new zGravSizer(ZGRAV_BOTTOM,5, sizer());
	tem = new zGravSizer(ZGRAV_BOTTOM,20,sizer());
	esConvTolerance_ = new ZatEditSliderDouble(this, new zGravSizer(ZGRAV_RIGHT,180,tem),"",ZAT_DOUBLEEDITSLIDER,0.0,1.0);
	esConvTolerance_->show();
	new zStaticText(this, new zGravSizer(ZGRAV_RIGHT,110,tem), SS_RIGHT, "Conv. Tolerance:");

	new zGravSizer(ZGRAV_BOTTOM,5, sizer());
	tem = new zGravSizer(ZGRAV_BOTTOM,20,sizer());
	esMaxIterations_ = new ZatEditSliderLong(this, new zGravSizer(ZGRAV_RIGHT,180,tem),"",ZAT_LONGEDITSLIDER,1,500);
	esMaxIterations_->show();
	new zStaticText(this, new zGravSizer(ZGRAV_RIGHT,110,tem), SS_RIGHT, "Max Iterations:");
	
	
	maxIterations_ = ::Calib->get_max_iter();
	convTolerance_ = ::Calib->get_conv_tolerance();
	minEV_ = ::Calib->get_min_ev();
	
	esMaxIterations_->setValue(maxIterations_);
	esMinEV_->setValue(minEV_);
	esConvTolerance_->setValue(convTolerance_);
	
	registerEvents();
	show();
}

int ZasCalibration::command(zCommandEvt *Ev){
	if(Ev->cmd() == IDC_OK){
		Simulation::run_calibration();
		shutdown();
	}
	if(Ev->cmd() == IDC_CANCEL){
		shutdown();
	}
	return 0;
}

ZasCalibration::~ZasCalibration(){
	unRegisterEvents();
	delete esMaxIterations_;
	delete esConvTolerance_;
	delete esMinEV_;
	delete progBarCtl_;
}

void ZasCalibration::registerEvents(){
	if(esMaxIterations_)esMaxIterations_->evLongChanged()->attach(this, &ZasCalibration::_maxIterationsModified);
	if(esConvTolerance_)esConvTolerance_->evDoubleChanged()->attach(this, &ZasCalibration::_convToleranceModified);
	if(esMinEV_)esMinEV_->evDoubleChanged()->attach(this, &ZasCalibration::_minEVModified);
	//if(progBarCtl_)::Calib->evNewIteration()->attach(this, &ZasCalibration::_newIterationStarted);
}

void ZasCalibration::unRegisterEvents(){
	if(esMaxIterations_)esMaxIterations_->evLongChanged()->detach(this, &ZasCalibration::_maxIterationsModified);
	if(esConvTolerance_)esConvTolerance_->evDoubleChanged()->detach(this, &ZasCalibration::_convToleranceModified);
	if(esMinEV_)esMinEV_->evDoubleChanged()->detach(this, &ZasCalibration::_minEVModified);
	//if(progBarCtl_)MonteCarlo->evNewIteration()->detach(this, &ZasCalibration::_newIterationStarted);
}

void ZasCalibration::maxIterationsModified(const long val, const int id){
	if(!lock_){
		lock_=1;
		::Calib->set_max_iter(val);
		maxIterations_ = val;
		lock_=0;
	}
}
void ZasCalibration::convToleranceModified(const double val, const int id){
	if(!lock_){
		lock_=1;
		::Calib->set_conv_tolerance(val);
		convTolerance_ = val;
		lock_=0;
	}
}
void ZasCalibration::minEVModified(const double val, const int id){
	if(!lock_){
		lock_=1;
		::Calib->set_min_ev(val);
		minEV_ = val;
		lock_=0;
	}
}
void ZasCalibration::newIterationStarted(const int val){
	char buf[20];
	float f = (float)((float)val/(float)numberOfIterations_*100.0);
	progBarCtl_->setPercent(f);
	sprintf(buf,"%d",val);
	progBarCtl_->text(buf);
	progBarCtl_->setDirty();
	progBarCtl_->update();
}

void ZasCalibration::_maxIterationsModified(void *ptr, const long val, const int id){
	ZasCalibration *zmc = (ZasCalibration *)ptr;
	zmc->maxIterationsModified(val,id);
}
void ZasCalibration::_convToleranceModified(void *ptr, const double val, const int id){
	ZasCalibration *zmc = (ZasCalibration *)ptr;
	zmc->convToleranceModified(val,id);
}
void ZasCalibration::_minEVModified(void *ptr, const double val, const int id){
	ZasCalibration *zmc = (ZasCalibration *)ptr;
	zmc->minEVModified(val,id);
}
void ZasCalibration::_newIterationStarted(void *ptr, const int val){
	ZasCalibration *zmc = (ZasCalibration *)ptr;
	zmc->newIterationStarted(val);
}



#endif
