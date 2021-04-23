#ifdef _ZAPP_GUI_
#ifndef _ZatGraphDialog_H_
#define _ZatGraphDialog_H_

#include <rw/cstring.h>
#include <rw/tpordvec.h>
#include <zapp.hpp>
#include <intpack/zip.hpp>

#include "implicit.h"
#include "ZatGraphicPane.h"
#include "ZatRowColumnBox.h"

class ZatGraphDialog : public zDialogFrame {

	RWCString tLabel_;
	RWCString xLabel_;
	RWCString yLabel_;

	RWTPtrOrderedVector<zColor> colorList_;
	RWTPtrOrderedVector<RWCString> legendList_;
	RWTPtrOrderedVector<RWCString> xDivLabels_;
	RWTPtrOrderedVector<RWCString> yDivLabels_;

	double xIncrement_,yIncrement_;
	unsigned int xLabIncrement_;
	unsigned int numXDivisions_, numYDivisions_;

	/* This value is [0.0 -1.0] to get a vertical dotted line at that
	 *  proportion of the way along the x-axis. <0 to turn off this feature.
	 */
	double xDottedLine_;

	signalNull evRemove_;
	signalRect evZoom_;
	signalRect evDezoom_;
	signalPoint evPosition_;

	zPen *currentPen_;
	zPoint p1_, p2_;
	zFont *labelFont_;
	zFont *labelFontRotated_;

	zToolbar *tbar_;
	zEditLine *elPositionX_;
	zEditLine *elPositionY_;
	zGravSizer *pLegend_;
	ZatGraphicPane *gp_;
	zBitmapButton *bbActiveUpdate_;
	zPrinterDisplay *pd_;
	zStaticText *stTitle_;
	zRect graphArea_, yLabelArea_, xLabelArea_, legendArea_;
	int xLabelSet_, yLabelSet_, TitleSet_; 
	int isActive_;

protected:

	void buildGraphDialog(void);

public:

	ZatGraphDialog(zWindow *w, zSizer *siz, DWORD dw =0, const char *label = NULL);
	ZatGraphDialog(zWindow *w, zResId & rid);
	~ZatGraphDialog();
	int buildDisplay();
	void copyDisplay();

	void setDirt( void ) { gp_->setDirty(); };

	int buildPrinterDisplay();
	void copyPrinterDisplay();

	void drawGraphDialog(void);
	int drawLegend(void);
	void drawAxies(void);
	int drawXAxisDivLabels(void);
	int drawYAxisDivLabels(void); 
	int drawLineSegment(zPoint point1, zPoint point2);
	
	void lockCanvas();
	void unlockCanvas();

	int addLegendLabel(const char *cs, zColor *zc, int labelNum=-1);
	void addXAxisDivLabel(const char *label);
	void addYAxisDivLabel(const char *label); 

	void clearXAxisDivLabels(){xDivLabels_.clear();}
	void clearYAxisDivLabels(){yDivLabels_.clear();}

	virtual int getYDivisions();
	virtual int getXDivisions();

	int setPositionXLabel(const char *pstr);
	int setPositionYLabel(const char *pstr);
	void setXAxisLabel(const char *xl = NULL);
	void setYAxisLabel(const char *xl = NULL);
	int setCurrentPen(int colorNum);
	void setTitleLabel(const char *label = NULL);
	double getXpercent(int x);	
	double getYpercent(int y);
	int getXinterval( int x );
	zRect getGraphRegion(void);

	void setXDottedLine( double x ) { xDottedLine_ = x; };

	int isActive(){ return isActive_; }
	virtual int command(zCommandEvt *);

	int cbMouseMoved(zEvent *);
	int cbMouseButtonDown(zEvent *);
	int cbMouseButtonUp(zEvent *);

	signalNull *evRemove(){ return &evRemove_; }	
	signalPoint *evRedraw(){ return gp_->evDraw(); }	
	signalRect *evZoom(){ return &evZoom_; }
	signalRect *evDezoom(){ return &evDezoom_; }
	signalPoint *evPosition(){ return &evPosition_; }

};

#endif
#endif
