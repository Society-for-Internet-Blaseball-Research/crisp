#ifdef _ZAPP_GUI_
#include <zapp.hpp>
#include "ZatGraphicPane.h"

int ZatGraphicPane::print(zPrinterDisplay *pd, zRect *) {
	setPrintMode( 1 );
	pushDisplay( pd );
	canvas()->lock();

	/* Clear background. */
	zRect r;
	canvas()->getVisible(r);
	canvas()->drawMode(R2CopyPen);	
	canvas()->pushBrush(new zBrush(canvas()->backColor()));
	canvas()->rectangle(r);
	delete canvas()->popBrush();

	/* Tell various mediators to draw what they are responsible for. */
	evDraw_.notify(zPoint(0,0));

	/* Finished. */
	canvas()->unlock();
	popDisplay(); 
	setPrintMode( 0 );
	return 1;
}

#endif

