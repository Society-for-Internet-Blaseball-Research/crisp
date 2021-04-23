#ifdef _ZAPP_GUI_
#include <zapp.hpp>
#include <intpack/zip.hpp>
#include <rw/cstring.h>
#include "ZatEditSliderLong.h"


ZatEditSliderLong::ZatEditSliderLong(zWindow *w, zSizer *siz, char *text, int baseId, long rMin, long rMax)  
		: ZatEditSliderBase(w,siz,text,baseId,ZAT_LONGEDITSLIDER) {
		
	el_ = new zEditLine(this, new zPercentSizer(ZGRAV_RIGHT,100.0,28.0,sizer()), WS_CHILD | WS_VISIBLE | WS_TABSTOP | WS_BORDER,"",baseId_);
	el_->setNotifyChange(this, (NotifyProc)&ZatEditSliderLong::cbEditLineChanged);
	setRange( rMin, rMax );
	setValue( 0 );
	st_->show();
	sb_->show();
	el_->show();
	show();
}

ZatEditSliderLong::~ZatEditSliderLong(){}

int ZatEditSliderLong::cbEditLineChanged(zEvent *){
	if(!lock_){
		lock_=1;
		char buf[40];
		long oldValue = longValue_;
		longValue_ = 0;
		if (el_->text().length() == 0)
			el_->text( "0" );
		else
			sscanf(el_->text().data(),"%ld",&longValue_);
		if(longValue_ > rLongMax_ || longValue_ < rLongMin_){
			if(longValue_ > rLongMax_)longValue_ = rLongMax_;
			else longValue_ = rLongMin_;
			sprintf(buf,"%ld",longValue_);
			el_->text(buf);	
			el_->setDirty();
		}
		if(delta_)
			evLongChanged_.notify(longValue_-oldValue,baseId_);
		else
			evLongChanged_.notify(longValue_,baseId_);
		sb_->info()->pos(getPos(longValue_));
		sb_->setDirty();
		lock_=0;
	}
	return 0;	
	
}

void ZatEditSliderLong::cbScrollBarChanged(const int val){
	if(!lock_){
		lock_=1;
		char buf[40];
		long oldValue = longValue_;
		longValue_ = getLongValue(sb_->info()->pos());
		sprintf(buf,"%ld",longValue_);
		el_->text(buf);	
		if(delta_)
			evLongChanged_.notify(longValue_-oldValue,baseId_);
		else
			evLongChanged_.notify(longValue_,baseId_);
		el_->setDirty();
		lock_=0;
	}
}

int ZatEditSliderLong::getPos(long newPos){
		double percent;
		int max = sb_->info()->limits().hi() - sb_->info()->limits().lo();

		if(newPos >= rLongMax_)
			return sb_->info()->limits().hi();
		if(newPos <= rLongMin_)
			return sb_->info()->limits().lo();
		percent = double(newPos-rLongMin_)/double(rLongMax_-rLongMin_);
		return (int(percent*double(max))+sb_->info()->limits().lo());
}

long ZatEditSliderLong::getLongValue(int pos){
		int max = sb_->info()->limits().hi() - sb_->info()->limits().lo();
		return long((double(pos-sb_->info()->limits().lo())/double(max))*double(rLongMax_-rLongMin_))+rLongMin_;
}

void ZatEditSliderLong::setValue(long val){
	if(!lock_){
		lock_=1;
		longValue_ = val;
		sb_->info()->pos(getPos(longValue_));
		char buf[40];
		sprintf(buf,"%ld",val);
		el_->text(buf);	sb_->text(buf);
		el_->setDirty();
		sb_->setDirty();
		lock_=0;
	}
}
void ZatEditSliderLong::setRange(long r1,long r2){
	rLongMin_=r1;
	rLongMax_=r2;
	sb_->info()->moveDelta( 1 );
	sb_->info()->pageDelta( 10 );
	if (r2 - r1 < 100)
		sb_->info()->limits(zRange(0,r2-r1));
	else
		sb_->info()->limits(zRange(0,100));
}
#endif

