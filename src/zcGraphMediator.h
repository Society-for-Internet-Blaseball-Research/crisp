#ifdef _ZAPP_GUI_
#ifndef _zcGraphMediator_H_
#define _zcGraphMediator_H_

#include <rw/tvordvec.h>
#include "implicit.h"
#include "smart_ptr.h"
#include "ZasGraphUpdateMed.h"
#include "ZatGraphDialog.h"

class zcGraphMediator;

const int ZAT_LONG = 10;
const int ZAT_DOUBLE = 20;

typedef utImplicit1<zcGraphMediator *> signal_graph;

class zcGraphMediator {

	protected:
		
		signal_graph evRemove;

		ZatGraphDialog *_gd;
		spZasGraphUpdateMed _gu;

		RWTValOrderedVector<double> dataList;
		int _ref;
		double maxVal, minVal;
		int DefaultSelection;
		int _isData;
		int _lock;
		int _graphType;
		int _dataIndex[2];
		int _isDisabled;
		int yAxisType_, xAxisType_;
		long lX_[2], lY_[2];
		double dX_[2], dY_[2];

	public:

		zcGraphMediator(ZatGraphDialog *gd);
		virtual ~zcGraphMediator();
		
		void setGraphType(const int type){ _graphType = type; }
		inline int ref(){ return ++_ref; }
		inline int unref(){ return --_ref; }
		
		signal_graph *get_remove_event(){ return &evRemove; }
		int isDisabled(void){return _isDisabled;} 
		void setXAxisRange(long min, long max, double xDottedLine = -1.0);
		void setYAxisRange(long min, long max);
		void setXAxisRange(double min, double max, double xDottedLine = -1.0);
		void setYAxisRange(double min, double max);

		virtual void drawLabels(void) = 0;
		virtual void drawLines(void) = 0;
		virtual void getData(void) = 0;
		virtual void setTitle(int index);
		virtual void cbRemove();
		
		virtual void cbRedraw(const zPoint pos = 0);
		virtual void cbPosition(const zPoint pos);
		virtual void cbZoomIn(const zRect);
		virtual void cbZoomOut(const zRect);
		virtual void cbGraphUpdate(const int index, const int type);

		static void _cbRemove(void *msg);
		static void _cbZoomIn(void *, const zRect);
		static void _cbZoomOut(void *, const zRect);
		static void _cbRedraw(void *msg, const zPoint pos);
		static void _cbPosition(void *msg, const zPoint pos);
		static void _cbGraphUpdate(void *ptr, const int index, const int type);

		virtual void RegisterEvents(void);
		virtual void unRegisterEvents(void);
		int operator==(const zcGraphMediator &ref){ 
			if(&ref == this)
				return 1;
			return 0;
		}

};
typedef utSmartPtr<zcGraphMediator> zcSpGraphMed;
#endif
#endif
