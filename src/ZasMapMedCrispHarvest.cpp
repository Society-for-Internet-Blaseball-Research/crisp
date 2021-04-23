#ifdef _ZAPP_GUI_
#include <iostream.h>
#include <zapp.hpp>
#include <math.h>
#include "ZasMapMedCrispHarvest.h" 
#include "ZasMenuConst.h"
#include "globals.h"
#include "Harvest.h"
#include "idcBPHR.h"



ZasMapMedCrispHarvest::ZasMapMedCrispHarvest(ZatMapPane *mp, mapController *mc) : ZatMapMediator(mp, mc) {

	mapStack_.insert(new mapCordset(140.2,60.2,104.1,42.33));
    defaultCord_ = new mapCordset(140.2,60.2,104.1,42.33);

	bmFish_ = new zBitmap(zResId(ID_MAP_FISH));
	bmBoat_ = new zBitmap(zResId(ID_MAP_BOAT));	
	bdFish_ = new zBitmapDisplay(bmFish_);
	bdBoat_ = new zBitmapDisplay(bmBoat_);

	//The printer has a much higher resolution so I've created another set of bitmaps
	//so that they are visible on the printouts. 
	bmFishPrinter_ = new zBitmap(zResId(ID_MAP_FISH2));
	bmBoatPrinter_ = new zBitmap(zResId(ID_MAP_BOAT2));	
	bdFishPrinter_ = new zBitmapDisplay(bmFishPrinter_);
	bdBoatPrinter_ = new zBitmapDisplay(bmBoatPrinter_);

	lastCircleSourceType_[0]=0;
	lastCircleSourceType_[1]=0;
	bmGoob_ = new zBitmap(zResId(ID_GOOB));
	bdGoob_ = new zBitmapDisplay(bmGoob_);
}

ZasMapMedCrispHarvest::~ZasMapMedCrispHarvest(){
	delete bdFish_;
	delete bdBoat_;
}
 

void ZasMapMedCrispHarvest::redrawCircles(){
		if(lastCircleSourceType_[0])
		  drawCircleGraph(lastCircleSourceType_[0],lastCircleFisherySelection_.data());
		if(lastCircleSourceType_[1])
		  drawCircleGraph(lastCircleSourceType_[1],lastCircleStockSelection_.data());
}

zPen *ZasMapMedCrispHarvest::getPen(int type){
    
    switch(type){
      case ISLAND:
	return new zPen(zColor(GRAY),Solid,1);
      case COASTLINE:
	return new zPen(zColor(BLACK),Solid,1);
      case RIVER:
	return new zPen(zColor(BLUE),Solid,1);
      case FISHERY:
	return new zPen(zColor(RED),Solid,1);
      case STOCK:
	return new zPen(zColor(GREEN),Solid,1);
      default:
	return new zPen(zColor(RED),Solid,1);
	break;
    };
}
zBrush *ZasMapMedCrispHarvest::getBrush(int type, BrushHatch style){
    
    switch(type){
      case ISLAND:

      case COASTLINE:
	
      case RIVER:
	
      case FISHERY:
		return new zBrush(zColor(RED),style);
      case STOCK:						
		return new zBrush(zColor(0,128,0),style);	
      default:
		return new zBrush(zColor(BLACK),style);
	break;
    };
}

void ZasMapMedCrispHarvest::drawIcons(RWDlistCollectablesIterator *itr, ZatMercatorTransform *zpt, zRect r){
	zPoint tp;
	mapPoint  *mpo=NULL;
	mapObject *mo=NULL;		

	// Had to be done.. if you REALLY zoom in on Elliot Bay you'll see a 
	// picture of me, the gui goob.  
	tp = (*zpt)(122.32,47.62);
	if(zpt->revX(r.left()) < 122.7 && zpt->revY(r.top()) < 48.0 && zpt->revX(r.right()) > 121.8 && zpt->revY(r.bottom()) > 47.2)
		bdGoob_->copyTo(cd_,tp.x(),tp.y(),40,52,0,0);


	while((*itr)()){
		mo = (mapObject *)itr->key();
		mpo=mo->at(0);
		if(mo->intersects((*zpt)(r.left(),r.top()),zpt->revXY(r.right(),r.bottom()))){
			cd_->pixel((*zpt)(*mpo),zColor(RED));
			tp = (*zpt)(*mpo);
			if(mo->objType() == STOCK){
				if(mp_->isPrintMode())
					bdFishPrinter_->copyTo(cd_,tp.x()-bmFishPrinter_->size().width()/2,
									tp.y()-bmFishPrinter_->size().height()/2,
									bmFishPrinter_->size().width(),bmFishPrinter_->size().height(),0,0);
				else
					bdFish_->copyTo(cd_,tp.x()-bmFish_->size().width()/2,
									tp.y()-bmFish_->size().height()/2,
									bmFish_->size().width(),bmFish_->size().height(),0,0);
			}
			else if(mo->objType() == FISHERY){
				if(mp_->isPrintMode())
					bdBoatPrinter_->copyTo(cd_,tp.x()-bmBoatPrinter_->size().width()/2,
									tp.y()-bmBoatPrinter_->size().height()/2,
									bmBoatPrinter_->size().width(),bmBoatPrinter_->size().height(),0,0);
				else
					bdBoat_->copyTo(cd_,tp.x()-bmBoat_->size().width()/2,
									tp.y()-bmBoat_->size().height()/2,
									bmBoat_->size().width(),bmBoat_->size().height(),0,0);
			}
		}
	}
}

double ZasMapMedCrispHarvest::getHarvestRateMagnitude(int sourceType, const char *sourceName){
	double cumulative_magnitude=0.0;
    Harvest *hv;
    switch (sourceType){
      case STOCK:
		{
			Stock *s = ::Stocks.find(sourceName);
			if (s)
			for (HvIter hvl(s->get_harvest_list()); hv = ++hvl; )
				cumulative_magnitude += hv->get_total_harvest_rate();
		}
		break;
      case FISHERY:
		{
			Fishery *fi = ::Fisheries.find(sourceName);
			if (fi)
			for (HvIter hvl(fi->get_harvest_list()); hv = ++hvl; )
				cumulative_magnitude += hv->get_total_harvest_rate();
		}
		break;
      default:
		break;
    }
	
	return cumulative_magnitude;

}

int ZasMapMedCrispHarvest::getHarvestRateRadius(const char *stockName, const char *fisheryName, double mag, double maxArea){
	idcBPHR hit;
	int stock = 0, s=0;
	int fishery = 0, f=0;
	Harvest *hv=NULL;

	while(s < ::Stocks.num() && !stock){
		if(!strcmp(::Stocks[s].get_name(), stockName))
			stock=1;
		else s++;
	}
	while(f < ::Fisheries.num() && !fishery){
		if(!strcmp(::Fisheries[f].get_name(), fisheryName))
			fishery = 1;
		else f++;
	}
	if(stock && fishery)
		hv = hit.find(s,f);
	if(hv){
		double rate = hv->get_total_harvest_rate();
		s = int((rate/mag)*maxArea);
		return (int)(sqrt(s));
	}
	return 0;
}

void ZasMapMedCrispHarvest::drawCircleGraph(const int sourceType, const char *selection){
	
	RWDlistCollectablesIterator *itr=NULL;
	ZatMercatorTransform *zpt = NULL;
	zRect r;
	mapObject *mo=NULL;
        mapPoint  *mpo=NULL;
	int radius = 0;
	cd_->getVisible(r);
	itr=mc_->getIconIterator();
	if(mapStack_.top())zpt = new ZatMercatorTransform(r,(mapCordset *)mapStack_.top());
	else zpt = new ZatMercatorTransform(r,defaultCord_);
	double cm = getHarvestRateMagnitude(sourceType,selection);
	cd_->pushPen(getPen(sourceType));
	cd_->pushBrush(getBrush(sourceType,DiagCrossHatch));
#ifdef WIN32
	cd_->drawMode(R2MaskPen);
#else
	cd_->drawMode(R2XorPen);
#endif
	zPoint diamond[4] = {zPoint(0,0),zPoint(0,0),zPoint(0,0),zPoint(0,0)};
	while((*itr)()){
		mo = (mapObject *)itr->key();
		if(mo->objType() != sourceType){
			mpo=mo->at(0);
			if(mo->intersects((*zpt)(r.left(),r.top()),zpt->revXY(r.right(),r.bottom()))){
					if(sourceType == FISHERY)
						radius = getHarvestRateRadius(mo->getLabel(), selection, cm, 2000);
					if(sourceType == STOCK)
						radius = getHarvestRateRadius(selection, mo->getLabel(), cm, 2000);
					if(radius)radius+=2;
					cd_->ellipse((*zpt)(mpo->lon(),mpo->lat())-zPoint(radius,radius),(*zpt)(mpo->lon(),mpo->lat())+zPoint(radius,radius));
			}
		}
		else if(mo->objType() == sourceType && !strcmp(mo->getLabel(),selection)){
			cd_->pushBrush(new zBrush(WhiteBrush));
			cd_->drawMode(R2XorPen);
			mpo=mo->at(0);
			if(mo->intersects((*zpt)(r.left(),r.top()),zpt->revXY(r.right(),r.bottom()))){
				diamond[0] = ((*zpt)(mpo->lon(),mpo->lat())+zPoint(0,12));
				diamond[1] = ((*zpt)(mpo->lon(),mpo->lat())+zPoint(12,0));
				diamond[2] = ((*zpt)(mpo->lon(),mpo->lat())-zPoint(0,12));
				diamond[3] = ((*zpt)(mpo->lon(),mpo->lat())-zPoint(12,0));
				
				cd_->polygon(diamond, 4);
			}			
#ifdef WIN32
			cd_->drawMode(R2MaskPen);
#else
			cd_->drawMode(R2XorPen);
#endif
			delete cd_->popBrush();
		}
	}
	delete cd_->popPen();
	delete cd_->popBrush();

	if(itr)delete itr;
	if(zpt)delete zpt;

}


void ZasMapMedCrispHarvest::drawCircles(const int sourceType, const char *selection){

	if(sourceType == FISHERY){
		lastCircleSourceType_[0] = sourceType;
		lastCircleFisherySelection_ = selection;
	}
	else{
		lastCircleSourceType_[1] = sourceType;
		lastCircleStockSelection_ = selection;
	}
	mp_->canvas()->setDirty();
}

#endif
