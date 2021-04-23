#ifdef _ZAPP_GUI_

#ifndef _ZasCalibration_h_
#define _ZasCalibration_h_

#include "ZatEditSliderLong.h"
#include "ZatEditSliderDouble.h"

class ZasCalibration : public zDialogFrame {

	protected:
		
		zWindow *w_;
		zProgressBar *progBarCtl_;
		ZatEditSliderDouble *esConvTolerance_;
		ZatEditSliderLong  *esMaxIterations_;
		ZatEditSliderDouble *esMinEV_;
		
		int lock_, numberOfIterations_;		
		long maxIterations_;
		double convTolerance_, minEV_;

		void registerEvents();
		void unRegisterEvents();

		void maxIterationsModified(const long val, const int id);
		void convToleranceModified(const double val, const int id);
		void minEVModified(const double val, const int id);

		void newIterationStarted(const int val);

	public:

		ZasCalibration(zWindow *w, zSizer *szr=0);		
		~ZasCalibration();
		virtual int command(zCommandEvt *Ev);
		static void _maxIterationsModified(void *ptr, const long val, const int id);
		static void _convToleranceModified(void *ptr, const double val, const int id);
		static void _minEVModified(void *ptr, const double val, const int id);
		static void _newIterationStarted(void *ptr, const int val);
};



#endif
#endif
