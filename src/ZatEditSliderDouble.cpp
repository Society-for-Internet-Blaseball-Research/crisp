#ifdef _ZAPP_GUI_
#include <zapp.hpp>
#include <intpack/zip.hpp>
#include <rw/cstring.h>
#include "ZatEditSliderDouble.h"

ZatEditSliderDouble::ZatEditSliderDouble(zWindow *w, zSizer *siz, char *text, int baseId, double rMin, double rMax) 
	: ZatEditSliderBase(w,siz,text,baseId,ZAT_DOUBLEEDITSLIDER) {
	el_ = new zEditLine(this, new zPercentSizer(ZGRAV_RIGHT,100.0,28.0,sizer()), WS_CHILD | WS_VISIBLE | WS_TABSTOP | WS_BORDER,"",baseId_);
	el_->setNotifyChange(this, (NotifyProc)&ZatEditSliderDouble::cbEditLineChanged);
	setRange( rMin, rMax );
	setValue( 0.0 );
	st_->show();
	sb_->show();
	el_->show();
	show();
}

ZatEditSliderDouble::~ZatEditSliderDouble(){}

int ZatEditSliderDouble::cbEditLineChanged(zEvent *){
	if(!lock_){
		lock_=1;
		char buf[40];
		double oldValue = doubleValue_;
		doubleValue_ = 0.0;
		if (el_->text().length() == 0)
			el_->text( "0" );
		else
			sscanf(el_->text().data(),"%lf",&doubleValue_);
		if(doubleValue_ > rDoubleMax_ || doubleValue_ < rDoubleMin_){
			if(doubleValue_ > rDoubleMax_)doubleValue_ = rDoubleMax_;
			else doubleValue_ = rDoubleMin_;
			sprintf(buf,"%lf",doubleValue_);
			el_->text(buf);	
			el_->setDirty();
		}
		if(delta_)
			evDoubleChanged_.notify(doubleValue_-oldValue,baseId_);
		else
			evDoubleChanged_.notify(doubleValue_,baseId_);
		sb_->info()->pos(getPos(doubleValue_));
		sb_->setDirty();
		lock_=0;
	}
	return 0;	
	
}

void ZatEditSliderDouble::cbScrollBarChanged(const int val){
	if(!lock_){
		lock_=1;
		char buf[40];
		double oldValue = doubleValue_;
		doubleValue_ = getDoubleValue(sb_->info()->pos());
		sprintf(buf,"%lf",doubleValue_);
		el_->text(buf);	
		if(delta_)
			evDoubleChanged_.notify(doubleValue_-oldValue,baseId_);
		else
			evDoubleChanged_.notify(doubleValue_,baseId_);
		el_->setDirty();
		lock_=0;
	}
}

int ZatEditSliderDouble::getPos(double newPos){
		double percent;
		int max = sb_->info()->limits().hi() - sb_->info()->limits().lo();
		if(newPos >= rDoubleMax_)
			return sb_->info()->limits().hi();
		if(newPos <= rDoubleMin_)
			return sb_->info()->limits().lo();
		percent = (newPos-rDoubleMin_)/(rDoubleMax_-rDoubleMin_);
		return (int(percent*double(max))+sb_->info()->limits().lo());
}

double ZatEditSliderDouble::getDoubleValue(int pos){
		int max = sb_->info()->limits().hi() - sb_->info()->limits().lo();
		return double((double(pos-sb_->info()->limits().lo())/double(max))*double(rDoubleMax_-rDoubleMin_))+rDoubleMin_;
}

void ZatEditSliderDouble::setValue(double val){
	if(!lock_){
		lock_=1;
		doubleValue_ = val;
		sb_->info()->pos(getPos(doubleValue_));
		char buf[40];
		sprintf(buf,"%lf",val);
		el_->text(buf);
		el_->setDirty();
		sb_->setDirty();
		lock_=0;
	}
}

void ZatEditSliderDouble::setRange(double r1,double r2){
	rDoubleMin_=r1;
	rDoubleMax_=r2;
	sb_->info()->moveDelta( 1 );
	sb_->info()->pageDelta( 10 );
	sb_->info()->limits(zRange(0,100));
}
#endif

