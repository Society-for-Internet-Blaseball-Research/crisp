#ifdef _ZAPP_GUI_
#include <fstream.h>
#include <zapp.hpp>
#include <intpack/zip.hpp>
#include <help/zhelp.hpp>
#include "ZatGraphDialog.h"
#include "ZatGraphConstants.h"
#include "ZatDialogConstants.h"
#include "ZasMenuConst.h"


extern zHelp *helpWin;

ZatGraphDialog::ZatGraphDialog(zWindow *w, zResId & rid) 
	: zDialogFrame(w,rid)  {
	buildGraphDialog();
	
}

ZatGraphDialog::ZatGraphDialog(zWindow *w, zSizer *siz, DWORD dw, const char *nt) 
	: zDialogFrame(w,siz,dw,nt)  {
	buildGraphDialog();
}

ZatGraphDialog::~ZatGraphDialog(){
	if (labelFont_)
		delete labelFont_;

	//if(labelFontRotated_)delete labelFontRotated_;
	legendList_.clearAndDestroy();
	colorList_.clearAndDestroy();
}	

void ZatGraphDialog::buildGraphDialog(void){
	// Common initializations.
	TitleSet_ = 0;
	pd_ = NULL;
	isActive_ = 1;
	xLabelSet_ = 0;
	yLabelSet_ = 0;
	deleteOnClose(TRUE);
	xDottedLine_ = -1.0;

	//Build the fonts we'll be using in the pane, and make a default black pen.

#ifdef WIN32
    
  	setFont(new zFont("MS Sans Serif",zDimension(8,6), FW_NORMAL));
	labelFont_ = new zFont(
	    "Helv", zDimension(GFontWidth,GFontHeight), FW_EXTRALIGHT);
	
#else
//    SUNOS
	labelFont_ = new zFont(
	    "MS Sans Serif",zDimension(16,12), FW_NORMAL);
	/* NOTE: setFont() must be given a unique object because the zDialogFrame
	 *        will own that object henceforth and will delete it automatically. */
  	setFont(new zFont("MS Sans Serif",zDimension(16,12), FW_NORMAL));
	
//      new zFont("MS Sans Serif",zDimension(16,12), FW_NORMAL));
//	labelFont_ = new zFont(DispDefault);
#endif
	
	currentPen_ = new zPen(zColor(BLACK),Solid,1);

	//Make a Toolbar, add the buttons.
	zPushButton *pb;
	int i=1;
	tbar_ = new zToolbar(this, new zGravSizer(ZGRAV_TOP,27,sizer()), ES_READONLY | WS_VISIBLE | WS_CHILD | WS_TABSTOP);
#ifdef WIN32
	int tHeight = 22;
#else
	int tHeight = 0;
#endif	
	pb = new zPushButton(tbar_, new zSlotSizer(i++,zDimension(50,tHeight),tbar_->sizer()), WS_VISIBLE | WS_CHILD | WS_TABSTOP, "Done", IDC_OK);
	new zSlotSizer(i++, zDimension(20,0), tbar_->sizer());
	elPositionX_ = new zEditLine(tbar_, new zSlotSizer(i++,zDimension(80,tHeight),tbar_->sizer()), WS_VISIBLE | WS_CHILD, "0");
	elPositionX_->backgroundColor(ZCTRL_FILLER);        
	new zSlotSizer(i++, zDimension(20,0), tbar_->sizer());
	elPositionY_ = new zEditLine(tbar_, new zSlotSizer(i++,zDimension(80,tHeight),tbar_->sizer()), WS_VISIBLE | WS_CHILD, "0");
	elPositionY_->backgroundColor(ZCTRL_FILLER);                                     
	new zSlotSizer(i++, zDimension(9,0), tbar_->sizer());
/*	(new zBitmapButton(tbar_, new zSlotSizer(i++,zDimension(25,tHeight),tbar_->sizer()),
				ZBB_FULL | ZBB_OFFDEP, "", ID_SAVE,
				new zBitmap(zResId(ID_SAVE))))->show();
*/
	zBitmapButton *printButton = new zBitmapButton(tbar_, new zSlotSizer(i++,zDimension(25,tHeight),tbar_->sizer()),
				ZBB_FULL | ZBB_OFFDEP, "", ID_PRINT,
				new zBitmap(zResId(ID_PRINT)));
	printButton->show();
	(new zBitmapButton(tbar_, new zSlotSizer(i++,zDimension(25,tHeight),tbar_->sizer()),
				ZBB_FULL | ZBB_OFFDEP, "", ID_CON,
				new zBitmap(zResId(ID_CON))))->show();
	new zSlotSizer(i++, zDimension(10,0), tbar_->sizer());
	(bbActiveUpdate_ = new zBitmapButton(tbar_, new zSlotSizer(i++,zDimension(25,tHeight),tbar_->sizer()),
				ZBB_PARTIAL | ZBB_TWOSTATE | ZBB_OFFON, "", ID_WAND,
				new zBitmap(zResId(ID_WAND))))->show();
	isActive_ = 0;  // active update is off by default.
	bbActiveUpdate_->check(isActive_);
	pb->show();
	elPositionX_->show();
	elPositionY_->show();
	tbar_->show();
	
	//Build the Graph pane and register some events.
	stTitle_ = new zStaticText(this, new zGravSizer(ZGRAV_TOP,30,sizer()),SS_CENTER);
	stTitle_->show();
	pLegend_ = new zGravSizer(ZGRAV_BOTTOM,25,sizer());
	new zGravSizer(ZGRAV_TOP,5,pLegend_);
	gp_ = new ZatGraphicPane(this,new zGravSizer(ZGRAV_MIDDLE,0,sizer()));
	gp_->setNotifyMouseMove(this,(NotifyProc)&ZatGraphDialog::cbMouseMoved);
	gp_->setNotifyMouseButtonDown(this,(NotifyProc)&ZatGraphDialog::cbMouseButtonDown);
	gp_->setNotifyMouseButtonUp(this,(NotifyProc)&ZatGraphDialog::cbMouseButtonUp);
	gp_->show();
	show();

}
int ZatGraphDialog::buildDisplay(){

	if(gp_->isPrintMode()){
		if(buildPrinterDisplay()) 
			return 0;
		return 1;
	}
	else {
		gp_->canvas()->lock();
		zRect r;
		gp_->getInterior( r );
		gp_->canvas()->pushBrush( new zBrush( gp_->backgroundColor() ) );
		gp_->canvas()->fill( r );
		delete gp_->canvas()->popBrush();
		gp_->canvas()->unlock();
	}
	return 1;

}
void ZatGraphDialog::copyDisplay(){

	if(gp_->isPrintMode()) {
		copyPrinterDisplay();
		gp_->setDirty();
	}
}

int ZatGraphDialog::buildPrinterDisplay(){
    return 0;
}

void ZatGraphDialog::copyPrinterDisplay(){
}

void ZatGraphDialog::drawGraphDialog(void){

	/* How big is the graph area we will draw into?
	 */
	zRect r;
	gp_->canvas()->getVisible(r);

	graphArea_ = zRect(r.left()+r.right()/8,r.top()+r.bottom()/10,
		                 r.right()-r.right()/8,r.bottom()-r.bottom()/10);

	/* How big is the label font? 
	 */
	if(labelFont_)delete labelFont_;
	labelFont_ = new zFont(
			"Helv", zPrPoint(0,90,gp_->canvas()), FW_EXTRALIGHT );

	/* Draw everything but the actual data lines.
	 */
    drawAxies();
    setXAxisLabel();
    setYAxisLabel();
    drawXAxisDivLabels();
    drawYAxisDivLabels();
	if(gp_->isPrintMode()){
		drawLegend();
		setTitleLabel(NULL);
	}
}

int ZatGraphDialog::command(zCommandEvt *Ev){

	if(Ev->cmd() == IDC_OK){
		evRemove_.notify();
		shutdown();
		return 1;
    }
	else if(Ev->cmd() == ID_SAVE){
		zMessage *NoData = new zMessage(gp_, "Sorry, this feature is not yet implimented.", "Graph Save", MB_OK);
		delete NoData;
		return 1;
    }
	else if(Ev->cmd() == ID_WAND){
		isActive_ = bbActiveUpdate_->check();
		return 1;
	}
	else if (Ev->cmd() == ID_PRINT) {
		pd_ = new zPrinterDisplay();	
		if (!pd_->isValid() || !pd_->printerSetup()) {
			delete pd_;
			return 1;
		}

		zDefPrJobDlg *prDlg=new zDefPrJobDlg(zAppGetAppVar(app)->rootWindow(),zResId(PRINT));
		zPrintJob *pj = new zPrintJob(gp_, pd_, prDlg);
		pj->setJobName(tLabel_.data());
		pj->go();
		return 1;
	}
	else if (Ev->cmd()==ID_CON) {
	    if(helpWin)
			helpWin->jumpToPage("crisp2_manual.html");
		return 1;
	}

	return 0;
}

void ZatGraphDialog::setXAxisLabel(const char *xlabel){

	if(xlabel){
		xLabel_ = xlabel;
		xLabelSet_ = 1;
	}
	else if(xLabelSet_){
		gp_->canvas()->lock();
		zRect r = graphArea_;
		gp_->canvas()->pushPen(new zPen(zColor(BLACK),Solid,1));
		gp_->canvas()->pushFont(labelFont_);
		gp_->canvas()->text((r.right()-r.left()-(xLabel_.length()*GFontWidth))/2, r.bottom()-GLabelOffset, xLabel_.data());
		gp_->canvas()->popFont();
		delete gp_->canvas()->popPen();
		gp_->canvas()->unlock();
	}

}

void ZatGraphDialog::setTitleLabel(const char *label){
	if(label){
		tLabel_ = label;
		stTitle_->text(label);
	}
	else{
		gp_->canvas()->lock();
		zRect r = graphArea_;
		zDimension textArea;
		gp_->canvas()->pushPen(new zPen(zColor(BLACK),Solid,1));
		gp_->canvas()->pushFont(labelFont_);
		textArea = gp_->canvas()->getTextDim(tLabel_.data());
		gp_->canvas()->text((r.right()-r.left()-(textArea.width()))/2+r.left(), r.top()-2*textArea.height(), tLabel_.data());
		gp_->canvas()->popFont();
		delete gp_->canvas()->popPen();
		gp_->canvas()->unlock();
	}
}

void ZatGraphDialog::setYAxisLabel(const char *ylabel){
/*
	if(ylabel){
		yLabel = ylabel;
		yLabelSet=1;
	}
	else if(yLabelSet){
		gp_->canvas()->lock();
		zRect r;
		gp_->canvas()->getPictureArea(r);
		gp_->canvas()->pushPen(new zPen(zColor(BLACK),Solid,1));
		gp_->canvas()->pushFont(labelFontRotated);
		gp_->canvas()->text(r.left()+GLabelOffset,(r.bottom()-r.top()-(yLabel.length()*GFontWidth))/2+GMargin+GFontHeight/2,  yLabel.data());
		gp_->canvas()->popFont();
		delete gp_->canvas()->popPen();
		gp_->canvas()->unlock();
	}
*/
}

int ZatGraphDialog::addLegendLabel(const char *cs, zColor *zc, int labelNum){

	new zGravSizer(ZGRAV_LEFT,10,pLegend_);
	zPane *bb= new zPane(this, new zGravSizer(ZGRAV_LEFT,zDimension(20,20),pLegend_));
	bb->backgroundColor(*zc);
	bb->show();
	bb->update();
	new zGravSizer(ZGRAV_LEFT,5,pLegend_);
	zStaticText *ll = new zStaticText(this, new zGravSizer(ZGRAV_LEFT,10*strlen(cs),pLegend_),SS_CENTER,cs);
	ll->backgroundColor(ZCTRL_FILLER);
	ll->show();

	if(labelNum==-1){
		colorList_.insert(zc);
		legendList_.insert(new RWCString(cs));
	}
	else{
		colorList_.insertAt(labelNum,zc);
		legendList_.insertAt(labelNum,new RWCString(cs));
	}
	return 1;
}

int ZatGraphDialog::drawLegend(void){
	
	if(!colorList_.entries()) return 0;
	gp_->canvas()->lock();
	zRect r = graphArea_;
	zBrush *b;
	int xShift=50;
	zDimension textArea;
	gp_->canvas()->pushPen(new zPen(zColor(BLACK),Solid,1));
	gp_->canvas()->pushFont(labelFont_);
	for(size_t i=0;i<colorList_.entries();i++){
		xShift += 4*textArea.height();
		b = new zBrush(*colorList_[i]);
		gp_->canvas()->fill(zRect(r.left()+xShift, r.bottom()+3*textArea.height(), r.left()+xShift+textArea.height(), r.bottom()+4*textArea.height()),b);
		delete b;
		xShift += textArea.height()+textArea.height()/2;
		textArea = gp_->canvas()->getTextDim(legendList_[i]->data());
		gp_->canvas()->text(r.left()+xShift, r.bottom()+3*textArea.height(), legendList_[i]->data());
		xShift += textArea.width();
	}
	gp_->canvas()->popFont();
	delete gp_->canvas()->popPen();
	gp_->canvas()->unlock();
	
	return 1; 
	
}

void ZatGraphDialog::addXAxisDivLabel(const char *label){
	xDivLabels_.insert(new RWCString(label));
}
void ZatGraphDialog::addYAxisDivLabel(const char *label){
	yDivLabels_.insert(new RWCString(label));
}

int ZatGraphDialog::drawXAxisDivLabels(void){


	if(xDivLabels_.entries() <= 0) return 0;
	zDimension textArea;
	gp_->canvas()->lock();
	gp_->canvas()->pushPen(new zPen(zColor(BLACK),Solid,1));
	gp_->canvas()->pushFont(labelFont_);
	for(size_t i =0;i<xDivLabels_.entries();i++){
		if (i == xDivLabels_.entries() - 1 || 
			 (i % xLabIncrement_ == 0 && i < xDivLabels_.entries() - xLabIncrement_)) {
			textArea = gp_->canvas()->getTextDim(xDivLabels_[i]->data(),
				xDivLabels_[i]->length());
			gp_->canvas()->text(graphArea_.left()+(int)(xIncrement_*i)-(textArea.width()/2), 
				graphArea_.bottom()+2*GMarkLen, xDivLabels_[i]->data());
		}
	}

	gp_->canvas()->popFont();
	delete gp_->canvas()->popPen();
	gp_->canvas()->unlock();
	return 1; 
}

int 
ZatGraphDialog::drawYAxisDivLabels(void){

    if(yDivLabels_.entries() <= 0) 
		return 0;
	gp_->canvas()->lock();
	zDimension textArea;
	gp_->canvas()->pushPen(new zPen(zColor(BLACK),Solid,1));
	gp_->canvas()->pushFont(labelFont_);
	for(size_t i =0;i<yDivLabels_.entries();i++){
		textArea = gp_->canvas()->getTextDim(yDivLabels_[i]->data(),
			yDivLabels_[i]->length());
		gp_->canvas()->text(graphArea_.left()-textArea.width()-GMarkLen*2,
			graphArea_.top()+(int)(yIncrement_*i)-textArea.height()/2, yDivLabels_[i]->data());
	}
	gp_->canvas()->popFont();
	delete gp_->canvas()->popPen();
	gp_->canvas()->unlock();
	return 1; 
}

double ZatGraphDialog::getYpercent(int y){

	if(y<graphArea_.top()) 
		return 1.0;
	if(y>graphArea_.bottom()) 
		return 0.0;
	return 1.0-(double(y-graphArea_.top())/double(graphArea_.bottom()-graphArea_.top()));

}
double ZatGraphDialog::getXpercent(int x){
	if(x<graphArea_.left()) 
		return 1.0;
	if(x>graphArea_.right()) 
		return 0.0;
	return 1.0-(double(x-graphArea_.left())/double(graphArea_.right()-graphArea_.left()));
}

int ZatGraphDialog::getXinterval( int x ) {
	/* Which tickmark interval is this point in? */
	int i;
	if (x < graphArea_.left())
		return 0;
	if (x >= graphArea_.right())
		return xDivLabels_.entries()-1;

	x -= graphArea_.left();
	for (i = 0; i < (int)(xDivLabels_.entries()-1); i++)
		if (x < (int)((i+1)*xIncrement_))
			return i;
	return i;  /* should never get here; keeps compiler happy. */
}

int ZatGraphDialog::getXDivisions(){
	zDimension textArea;
	gp_->canvas()->pushFont(labelFont_);
	textArea = gp_->canvas()->getTextDim("1999"); 
	int width = textArea.width();
	if(xDivLabels_.entries()){
		textArea = gp_->canvas()->getTextDim(xDivLabels_[0]->data());
		if(textArea.width() > width) 
			width = textArea.width();
	}
	gp_->canvas()->popFont();
	return int(double(graphArea_.right()-graphArea_.left())/double(width+(width/3)));
}

int ZatGraphDialog::getYDivisions(){
	zRect r;
	int num;
	gp_->canvas()->getPictureArea(r);
	num = ((r.bottom()-r.top()-2*GMargin)/40);
	if(num > 0) 
		return num;
	else 
		return 4;
}


zRect ZatGraphDialog::getGraphRegion(void){
	return graphArea_;
}

int ZatGraphDialog::setCurrentPen(int colorNum){
	if(colorNum >= (int)(colorList_.entries()))
		return 0;
	delete currentPen_;
	currentPen_ = new zPen(*colorList_[colorNum],Solid,1);
	return 1;
}
void ZatGraphDialog::lockCanvas(){
	if(gp_->canvas())gp_->canvas()->lock();
	if(gp_->isPrintMode()) 
		return;
	zRectRegion clipArea(&graphArea_);
	gp_->canvas()->setClip(&clipArea);
}
void ZatGraphDialog::unlockCanvas(){
	if(gp_->canvas())gp_->canvas()->unlock();
	if(gp_->isPrintMode()) 
		return;
	zRect r;
	gp_->canvas()->getVisible(r);
	zRectRegion clipArea(&r);
	gp_->canvas()->setClip(&clipArea);
}

int ZatGraphDialog::drawLineSegment(zPoint point1, zPoint point2){
	
    if(!currentPen_) return 0;
    gp_->canvas()->pushPen(currentPen_);
    gp_->canvas()->moveTo(point1);
    gp_->canvas()->lineTo(point2);
    gp_->canvas()->popPen();
    return 1;
}

void
ZatGraphDialog::drawAxies(void){

	int ix;
	
    numXDivisions_ = xDivLabels_.entries();
    numYDivisions_ = yDivLabels_.entries();

    //Protection from divide by zero
    if(numYDivisions_ <= 1) numYDivisions_ = 2;
    if(numXDivisions_ <= 1) numXDivisions_ = 2;
    gp_->canvas()->lock();
    zRect r;
    gp_->canvas()->getPictureArea(r);
    yIncrement_ = double(graphArea_.bottom()-graphArea_.top())/(numYDivisions_-1);
    xIncrement_ = double(graphArea_.right()-graphArea_.left())/(numXDivisions_-1);

    gp_->canvas()->pushPen(new zPen(zColor(BLACK),Solid,1));
    gp_->canvas()->moveTo(graphArea_.left(),graphArea_.top());
    gp_->canvas()->lineTo(graphArea_.left(),graphArea_.bottom());
    gp_->canvas()->moveTo(graphArea_.left(),graphArea_.bottom());
    gp_->canvas()->lineTo(graphArea_.right(),graphArea_.bottom());

	/* Put a vertical dotted line in the graphing area, if desired.
	 */
	if (xDottedLine_ >= 0) {
		gp_->canvas()->pushPen( new zPen( zColor(BLACK), Dot, 1 ) );
		ix = int(graphArea_.left() + xDottedLine_ * graphArea_.width());
		gp_->canvas()->moveTo( ix, graphArea_.top());
		gp_->canvas()->lineTo( ix, graphArea_.bottom());
		delete gp_->canvas()->popPen();
	}

	/* Calculate interval between years which will have full text labels.
	 */
	gp_->canvas()->pushFont(labelFont_);
	zDimension textArea = gp_->canvas()->getTextDim( "2999", 4 );
	xLabIncrement_ = (int)((textArea.width() * 1.25 + xIncrement_ - 1)
		                                                   / xIncrement_);

    for(unsigned int y = 0; y<numYDivisions_; y++){
		gp_->canvas()->moveTo(graphArea_.left()-GMarkLen,
			          graphArea_.top()+(int)(y*yIncrement_));
		gp_->canvas()->lineTo(graphArea_.left(),
			          graphArea_.top()+(int)(y*yIncrement_));
    }
    for(unsigned int x = 0; x<numXDivisions_; x++){
		gp_->canvas()->moveTo(graphArea_.left()+(int)(x*xIncrement_),
			          graphArea_.bottom());
		if (x == numXDivisions_ - 1 || 
			  (x % xLabIncrement_ == 0 && x < numXDivisions_ - xLabIncrement_))
			gp_->canvas()->lineTo(graphArea_.left()+(int)(x*xIncrement_),
							  graphArea_.bottom()+2*GMarkLen);
		else
			gp_->canvas()->lineTo(graphArea_.left()+(int)(x*xIncrement_),
							  graphArea_.bottom()+GMarkLen);
    }
	gp_->canvas()->popFont();
    delete gp_->canvas()->popPen();
    gp_->canvas()->unlock();

}

int
ZatGraphDialog::setPositionYLabel(const char *pstr){
	elPositionY_->text(pstr);
	return 0;
}

int
ZatGraphDialog::setPositionXLabel(const char *pstr){
	elPositionX_->text(pstr);
	return 0;
}

int 
ZatGraphDialog::cbMouseMoved(zEvent *ev){
	if(!gp_->isPrintMode()){
		zMouseMoveEvt *mm = (zMouseMoveEvt *)ev;
		if(mm->isButtonDown(1)){
			//Highlight zoom section
		}
		else evPosition_.notify(mm->pos());
	}
	return 0;
}

int 
ZatGraphDialog::cbMouseButtonDown(zEvent *ev){
	zMouseClickEvt *mc = (zMouseClickEvt *)ev;
	if(mc->isButtonDown(1)){
		p1_ = mc->pos();
	}
	return 0;
}

int 
ZatGraphDialog::cbMouseButtonUp(zEvent *ev){
	if(!gp_->isPrintMode()){
		zMouseClickEvt *mc = (zMouseClickEvt *)ev;
		p2_ = mc->pos();
		if(mc->isButton(1))
			evZoom_.notify(zRect(p1_,p2_));
		if(mc->isButton(2))
			evDezoom_.notify(zRect(p1_,p2_));
	}
	return 0;
}
#endif


	
