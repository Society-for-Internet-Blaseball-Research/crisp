#ifdef _ZAPP_GUI_
#ifndef _ZasGraphUpdateMed_h_
#define _ZasGraphUpdateMed_h_

#include "smart_ptr.h"
#include "implicit.h"


typedef utImplicit2<const int,const int> signalGraph;

class ZasGraphUpdateMed {

	public:
		

		inline long ref(){ return ++_ref; }
		inline long unref(){ return --_ref; }

		static const utSmartPtr<ZasGraphUpdateMed> &instance();
		void updateGraphs(const int index, const int graphType);

		signalGraph *evGraphUpdate(){ return &evGraphUpdate_; }
		

	protected:

		ZasGraphUpdateMed() : _ref(0) {}
		
	
	private:

		friend class utSmartCPtr<ZasGraphUpdateMed>;
	
		ZasGraphUpdateMed& operator=(const ZasGraphUpdateMed&);
		virtual ~ZasGraphUpdateMed(){}		
		static utSmartPtr<ZasGraphUpdateMed> _instance;		

		long _ref;
		signalGraph evGraphUpdate_; 

};


typedef utSmartPtr<ZasGraphUpdateMed> spZasGraphUpdateMed;


#endif
#endif
