#ifdef _ZAPP_GUI_
#include <iostream.h>
#include <zapp.hpp>
#include "ZatMapMediator.h"
#include "ZatDialogConstants.h"

ZatMapMediator::ZatMapMediator(ZatMapPane *mp, mapController *mc) : mp_(mp), mc_(mc), lock_(0), gridLines_(0) {
  
    registerEvents();
	mp_->show();
    pd_=NULL;

}

ZatMapMediator::~ZatMapMediator(){
}

void ZatMapMediator::registerEvents(void){

    mp_->evDraw()->attach(this, &ZatMapMediator::_redrawMap);
    mp_->evSelect()->attach(this, &ZatMapMediator::_selectItem);
    mp_->evZoom()->attach(this, &ZatMapMediator::_zoomSection);
    mp_->evDeZoom()->attach(this, &ZatMapMediator::_deZoomSection);
    mp_->evPosition()->attach(this, &ZatMapMediator::_getItemTag);

}
 
void ZatMapMediator::_redrawMap(void *msg, const zPoint pos){
    ZatMapMediator *zm = (ZatMapMediator *)msg;
    zm->redrawMap(pos);
}
void ZatMapMediator::_selectItem(void *msg, const zPoint pos, const int button){
    ZatMapMediator *zm = (ZatMapMediator *)msg;
    zm->selectItem(pos,button);
}
void ZatMapMediator::_getItemTag(void *msg, const zPoint pos){
    ZatMapMediator *zm = (ZatMapMediator *)msg;
    zm->getItemTag(pos);
}
void ZatMapMediator::_zoomSection(void *msg, const zRect zr){
    ZatMapMediator *zm = (ZatMapMediator *)msg;
    zm->zoomSection(zr);
}
void ZatMapMediator::_deZoomSection(void *msg, const zRect zr){
    ZatMapMediator *zm = (ZatMapMediator *)msg;
    zm->deZoomSection();
}
 
void ZatMapMediator::redrawMap(const zPoint pos){

    if(!lock_){
		lock_=1;
		buildDisplay();	
		cd_ = mp_->canvas();
		if(mp_->isPrintMode()){
			drawBitmaps(zRect(0,0,0,0));
			copyDisplay();
		}
		else{	
			cd_->lock();
			lastSelector_ == zPoint(0,0);
			zRect r;
			cd_->getVisible(r);
			cd_->drawMode( R2CopyPen ); // Just for luck
			
			drawBitmaps(r);
			redrawCircles();
			zPoint temp = lastSelector_;
			lastSelector_ = zPoint(0,0);
			drawSelector(temp);	
			cd_->unlock();

		}
		lock_=0;	
    }	
}
ZatPointTransform *ZatMapMediator::getTransform(zRect &r){
	if(mapStack_.top())
		return new ZatMercatorTransform(r,(mapCordset *)mapStack_.top());
	return new ZatMercatorTransform(r,defaultCord_);
}

int ZatMapMediator::buildPrinterDisplay(){

	pd_ = new zPrinterDisplay();	
    if (!pd_->isValid()) {
        delete pd_;
		return 1;
    }
	mp_->pushDisplay(pd_);
	zDefPrJobDlg *prDlg=new zDefPrJobDlg(zAppGetAppVar(app)->rootWindow(),zResId(PRINT));
    zPrintJob *pj = new zPrintJob(mp_, pd_, prDlg);
	pj->setJobName("CRiSP Harvest Map");
    pj->go();
	return 0;
}
int ZatMapMediator::buildDisplay(){
	if(mp_->isPrintMode())
		return buildPrinterDisplay();
	return buildBitmapDisplay();
}

void ZatMapMediator::copyBitmapDisplay(){
	  return;

}

int ZatMapMediator::buildBackupBitmapDisplay(){
	
	return 0;
}

void ZatMapMediator::copyPrinterDisplay(){
    mp_->popDisplay();
	mr_ = zRect(0,0,0,0);
}

void ZatMapMediator::copyDisplay(){
	if(mp_->isPrintMode())
		copyPrinterDisplay();
	else
		copyBitmapDisplay();
}
int ZatMapMediator::buildBitmapDisplay(){
	
	return 0;
}

/* This helper routine clips a point's coordinates to the range [-10000,10000]
 *  This is done because Win95 seems to have difficulties with enormous integer
 *  values for line drawing.
 */
void ZatMapMediator::clipPoint( zPoint *pp ) {
	if (pp->x() > 10000)
		pp->x() = 10000;
	if (pp->x() < -10000)
		pp->x() = -10000;
	if (pp->y() > 10000)
		pp->y() = 10000;
	if (pp->y() < -10000)
		pp->y() = -10000;
}

/* NOTE: we require a line segment to have minimum length
 *  three pixels (x or y) to increase drawing speed.
 */
void ZatMapMediator::drawBitmaps(zRect r){
	
	mr_ = r;
	ZatMercatorTransform *zpt = NULL; 
	mapObject *mo=NULL;
	mapPoint  *mpo=NULL;
	RWDlistCollectablesIterator *itr=NULL, *pItr=NULL;
	zPoint zp;
	double latDiff, lonDiff, latSave, lonSave;
	int i;

	if(mp_->isPrintMode())
		cd_->getVisible(r);	
	zpt = (ZatMercatorTransform *)getTransform(r);

	cd_->pushBrush(new zBrush(cd_->backColor()));
	cd_->rectangle(mr_);
	cd_->popBrush();

	int topLat = (int)zpt->revY(r.top());
	int bottomLat = (int)zpt->revY(r.bottom());
	int leftLon = (int)zpt->revX(r.left(),r.top());
	int rightLon = (int)zpt->revX(r.right(),r.top());

	//zPoint temp;
	if(gridLines_){
		cd_->pushPen(new zPen(zColor(GRAY),Dot,1));
		for(int i = bottomLat;i <= topLat;i++){
				cd_->moveTo((*zpt)(zpt->revX(r.left(),double(i)),double(i)));
				cd_->lineTo((*zpt)(zpt->revX(r.right(),double(i)),double(i)));
		}
		for(i = rightLon;i <= leftLon;i++){
				cd_->moveTo((*zpt)(double(i),zpt->revY(r.top())));
				cd_->lineTo((*zpt)(double(i),zpt->revY(r.bottom())));
		}
		cd_->popPen();
	}	

	
	itr=mc_->getIterator();
	while((*itr)()){
		mo = (mapObject *)itr->key();
		if(mo->intersects((*zpt)(r.left(),r.top()),zpt->revXY(r.right(),r.bottom()))){
 			cd_->pushPen(getPen(mo->objType()));
			pItr=mo->getIterator();
			i=0;
			while((*pItr)()){
				mpo=(mapPoint *)pItr->key();
				if(!i){
					i++;
					zp = (*zpt)(*mpo);
					latDiff = fabs( zpt->revY( zp.y() )
									- zpt->revY(zp.y()+3) );
					lonDiff = fabs( zpt->revX( zp.x(), zp.y() ) -
									zpt->revX( zp.x()+3, zp.y() ));
					latSave = mpo->lat();
					lonSave = mpo->lon();
					clipPoint( &zp );
 					cd_->moveTo( zp );
				}
				else {
					if (fabs( mpo->lat() - latSave ) >= latDiff ||
						fabs( mpo->lon() - lonSave ) >= lonDiff) {
						zp = (*zpt)(*mpo);
						clipPoint( &zp );
						cd_->lineTo( zp );
						latSave = mpo->lat();
						lonSave = mpo->lon();
					}
				}
			}

			if (i > 0) {
				zp = (*zpt)(*mpo);
				clipPoint( &zp );
				cd_->lineTo( zp );
			}

			if(pItr) delete pItr;
			pItr=NULL;
			delete cd_->popPen();
		}
	}
	if(itr)delete itr;
	itr=NULL;
	itr=mc_->getIconIterator();
	drawIcons(itr,zpt,r);
	if(itr)delete itr;
	if(zpt)delete zpt;
}


zPen *ZatMapMediator::getPen(int type){
    
	return new zPen(zColor(RED),Solid,1);

}

mapObject *ZatMapMediator::intersectsIcon(const zPoint pos, const int zoneRadius){

	//mp_->canvas()->lock();
	//mp_->canvas()->unlock();
	int intersect=0;
	zRect r;
	mp_->canvas()->getVisible(r);

	RWDlistCollectablesIterator *itr=NULL;
	ZatMercatorTransform *zpt = (ZatMercatorTransform *)getTransform(r);
    mapObject *mo=NULL;
    mapPoint  *mpo=NULL;
	
	itr=mc_->getIconIterator();

	while((*itr)() && !intersect){
		mo = (mapObject *)itr->key();
		mpo=mo->at(0);
		if(mo->intersects((*zpt)(pos.x()-zoneRadius,pos.y()-zoneRadius),zpt->revXY(pos.x()+zoneRadius,pos.y()+zoneRadius))){
			intersect = 1;
		}
	}

	if(itr)delete itr;
	if(zpt)delete zpt;
	if(intersect)return mo;
	return NULL;

}

void ZatMapMediator::drawSelector(const zPoint pos){
	if(lastSelector_ == pos) return;
	mp_->canvas()->lock();
	zPoint tempos = lastSelector_;
	BinDrawOp bdTemp;
	mp_->canvas()->pushPen(new zPen(zColor(RED),Solid,1));
	bdTemp = mp_->canvas()->drawMode();
	mp_->canvas()->pushBrush(new zBrush(WhiteBrush));
	int radius = 10;
	mp_->canvas()->drawMode(R2XorPen);
	for(int i=0;i<2;i++){
		if(lastSelector_ == zPoint(0,0))i++;
		if(i)tempos = pos;
		mp_->canvas()->ellipse(tempos-zPoint(radius,radius),tempos+zPoint(radius,radius));
	}
	lastSelector_ = pos;
	mp_->canvas()->drawMode(bdTemp);
	delete mp_->canvas()->popPen();
	delete mp_->canvas()->popBrush();
	mp_->canvas()->unlock();
}

void ZatMapMediator::selectItem(const zPoint pos, const int button){
    if(!lock_){
		lock_=1;
		mapObject *mo = NULL;
		if(mo = intersectsIcon(pos,8)){ // Stock or Fishery selection on button 1 or 2;
			evSelected_.notify(mo->getLabel().data(),mo->objType(),button);
		}
		else if(button == 1) // Background section on button 1 
			evSelected_.notify(NULL,0,button);
		else if(button == 2){ // Background section on button 2
			lock_=0;
			deZoomSection();
		}
		lock_=0;	
	}
}	

void ZatMapMediator::getItemTag(const zPoint pos){
    if(!lock_){
		lock_=1;
		mapObject *mo = NULL;
		mapPoint *mpo = NULL;
		zRect r;
		mp_->canvas()->getVisible(r);
		ZatMercatorTransform *zpt = (ZatMercatorTransform *)getTransform(r);

		char realPos[20];
		sprintf(realPos,"LON: %.2f",zpt->revX(pos.x(),pos.y()));
		evStatus_.notify(realPos,0,-2);
		sprintf(realPos,"LAT: %.2f",zpt->revY(pos.y()));
		evStatus_.notify(realPos,0,-3);
		

		if(mo = intersectsIcon(pos,5)){ // Set the status item label
			mpo=mo->at(0);
			evStatus_.notify(mo->getLabel().data(),mo->objType(),-1);
			drawSelector((*zpt)(mpo->lon(),mpo->lat()));
		}
		lock_=0;	
	}
}

void ZatMapMediator::zoomSection(const zRect zr){
    if(!lock_){
		lock_=1;
		zRect r;
		int xshift=0, yshift=0;
		mp_->canvas()->getVisible(r);
		double oldAspect = double(r.right()-r.left())/double(r.bottom()-r.top());
		double newAspect = double(zr.right()-zr.left())/double(zr.bottom()-zr.top());

		lastSelector_ = zPoint(0,0);
		ZatMercatorTransform *zpt = (ZatMercatorTransform *)getTransform(r);
		xshift=0;
		yshift=0;
		if(oldAspect > newAspect){
			xshift = int((((oldAspect/newAspect)-1.0)*double(zr.right()-zr.left()))/2.0);
		}
		if(oldAspect < newAspect){
			yshift = int((((newAspect/oldAspect)-1.0)*double(zr.bottom()-zr.top()))/2.0);
		}
		/*
		mp_->canvas()->lock();
		mp_->canvas()->drawMode(R2CopyPen);
		mp_->canvas()->pushBrush(new zBrush(GrayBrush));
		mp_->canvas()->rectangle(zr.left()-xshift,zr.top()-yshift,zr.right()+xshift,zr.bottom()+yshift);
		delete mp_->canvas()->popBrush();
		mp_->canvas()->pushBrush(new zBrush(BlackBrush));
		  */
		mapStack_.insert((RWCollectable *) 
			(new mapCordset(zpt->revX(zr.left()-xshift,zr.top()-yshift), 
							zpt->revY(zr.top()-yshift), 
							zpt->revX(zr.right()+xshift,zr.bottom()+yshift), 
							zpt->revY(zr.bottom()+yshift)))
		);
		if(zpt)delete zpt;
	/*
		mapCordset *cord = (mapCordset *)mapStack_.top();
		if(mapStack_.top())zpt = new zPointTransform(r,(mapCordset *)mapStack_.top());
		mp_->canvas()->moveTo((*zpt)(cord->X1(),cord->Y1()));
		mp_->canvas()->lineTo((*zpt)(cord->X2(),cord->Y2()));
		mp_->canvas()->unlock();
		if(zpt)delete zpt;
		*/
		mp_->canvas()->setDirty();
		lock_=0;
	}
}


void ZatMapMediator::deZoomSection(){
	if(!lock_){
		lock_=1;
		lastSelector_ = zPoint(0,0);
		if(mapStack_.top())
			mapStack_.pop();
		mp_->canvas()->setDirty();
		lock_=0;
	}
}
#endif



