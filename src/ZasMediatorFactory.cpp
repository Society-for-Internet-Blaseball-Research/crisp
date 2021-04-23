#ifdef _ZAPP_GUI_

#include <zapp.hpp>
#include <intpack/zip.hpp>
#include "ZasMenuConst.h"
#include "ZasMediatorFactory.h"
#include "mapConstants.h"
#include "ZatDialogConstants.h"
#include "ZasTabDialogMedEV.h"
#include "ZasTabDialogMedIDL.h"
#include "ZasTabDialogMedMR.h"
#include "ZasTabDialogMedENH.h"
#include "ZasTabDialogMedCeilings.h"
#include "ZasTabDialogMedHRS.h"
#include "ZasDialogMedBPHR.h"
#include "ZasDialogMedPNV.h"

#include "ZasMonteCarlo.h"
#include "ZasCalibration.h"

#include "zcGMF_AbundanceIndex.h"
#include "zcGMF_CatchGraphs.h"
#include "zcGMF_InMortGraphs.h"
#include "zcGMS_Abundance.h"
#include "zcGMS_Escapement.h"
#include "zcGMS_CatchGraphs.h"
#include "zcGMS_CNRGraphs.h"
#include "zcGMS_TrueTermRun.h"
#include "ZasGraphMedMonteCarlo.h"
#include "zcGMH_HarvestGraphs.h"


ZasMediatorFactory* ZasMediatorFactory::_instance = 0;

ZasMediatorFactory::ZasMediatorFactory(zWindow *w) : _ref(0), _w(w) {

}

ZasMediatorFactory::~ZasMediatorFactory(){
	glist.clearAndDestroy();
	dlist.clearAndDestroy();
}

spZasMediatorFactory ZasMediatorFactory::Instance(zWindow *w){
	if(!_instance){
		_instance = new ZasMediatorFactory(w);
	}
	return spZasMediatorFactory(_instance);
}

int ZasMediatorFactory::makeGraph(const int type){
	zcGraphMediator *gtemp =  NULL;
	int gType =0;

	if(type > ID_FG_MIN && type < ID_FG_MAX){
		gType = FISHERY;
		switch(type){

		case ID_FG_ABUIND:
			gtemp = new zcGMF_AbundanceIndex(
			    new ZatGraphDialog(
				_w,
				new zSizer(40,40,500,400),
				WS_POPUP | WS_CAPTION |  WS_THICKFRAME
				| WS_MINIMIZEBOX | WS_MAXIMIZEBOX,
				"Abundance Index Graph (Fishery)"));
			break;
		case ID_FG_TOT:
			gtemp = new zcGMF_CatchTotal(
			    new ZatGraphDialog(
				_w, new zSizer(40,40,500,400),
				WS_POPUP | WS_CAPTION |  WS_THICKFRAME
				| WS_MINIMIZEBOX | WS_MAXIMIZEBOX,
				"Total Catch Graph (Fishery)"));
			break;
		case ID_FG_PRE:
			gtemp = new zcGMF_CatchPreterm(
			    new ZatGraphDialog(
				_w,
				new zSizer(40,40,500,400),
				WS_POPUP | WS_CAPTION |  WS_THICKFRAME
				| WS_MINIMIZEBOX | WS_MAXIMIZEBOX,
				"Preterminal Catch Graph (Fishery)"));
			break;
		case ID_FG_TER:
			gtemp = new zcGMF_CatchTerminal(
			    new ZatGraphDialog(
				_w,
				new zSizer(40,40,500,400),
				WS_POPUP | WS_CAPTION |  WS_THICKFRAME
				| WS_MINIMIZEBOX | WS_MAXIMIZEBOX,
				"Terminal Catch Graph (Fishery)"));
			break;
		case ID_FG_INCMOR:
			gtemp = new zcGMF_InMortTotal(
			    new ZatGraphDialog(
				_w,
				new zSizer(40,40,500,400),
				WS_POPUP | WS_CAPTION |  WS_THICKFRAME
				| WS_MINIMIZEBOX | WS_MAXIMIZEBOX,
				"Total Incidental Mortality (Shakers + CNRs)"));
			break;
		case ID_FG_SUB:
			gtemp = new zcGMF_InMortSublegal(
			    new ZatGraphDialog(
				_w,
				new zSizer(40,40,500,400),WS_POPUP
				| WS_CAPTION | WS_THICKFRAME |
				WS_MINIMIZEBOX | WS_MAXIMIZEBOX,
				"Sublegal CNR Mortality Graph (Fishery)"));
			break;
		case ID_FG_LEG:
			gtemp = new zcGMF_InMortLegal(
			    new ZatGraphDialog(
				_w,
				new zSizer(40,40,500,400),
				WS_POPUP | WS_CAPTION |  WS_THICKFRAME
				| WS_MINIMIZEBOX | WS_MAXIMIZEBOX,
				"Legal CNR Mortality Graph (Fishery)"));
			break;

		default:
			return 0;
		}
	}
	else if(type > ID_SG_MIN && type < ID_SG_MAX){
		gType = STOCK;
		switch(type){

		case ID_SG_ABU:
			gtemp = new zcGMS_Abundance(
			    new ZatGraphDialog(
				_w, new zSizer(40,40,500,400),
				WS_POPUP | WS_CAPTION |  WS_THICKFRAME
				| WS_MINIMIZEBOX | WS_MAXIMIZEBOX,
				"Abundance Graph (Stock)"));
			break;
		case ID_SG_ESC:
			gtemp = new zcGMS_Escapement(
			    new ZatGraphDialog(
				_w,
				new zSizer(40,40,500,400),
				WS_POPUP | WS_CAPTION |  WS_THICKFRAME
				| WS_MINIMIZEBOX | WS_MAXIMIZEBOX,
				"Escapement Graph (Stock)"));
			break;
		case ID_SG_SUB:
			gtemp = new zcGMS_CNRSublegal(
			    new ZatGraphDialog(
				_w,
				new zSizer(40,40,500,400),
				WS_POPUP | WS_CAPTION |  WS_THICKFRAME
				| WS_MINIMIZEBOX | WS_MAXIMIZEBOX,
				"Sublegal CNR Graph (Stock)"));
			break;
		case ID_SG_LEG:
			gtemp = new zcGMS_CNRLegal(
			    new ZatGraphDialog(
				_w,
				new zSizer(40,40,500,400),
				WS_POPUP | WS_CAPTION |  WS_THICKFRAME
				| WS_MINIMIZEBOX | WS_MAXIMIZEBOX,
				"Legal CNR Graph (Stock)"));
			break;
		case ID_SG_TOT:
			gtemp = new zcGMS_CatchTotal(
			    new ZatGraphDialog(
				_w,
				new zSizer(40,40,500,400),
				WS_POPUP | WS_CAPTION |  WS_THICKFRAME |
				WS_MINIMIZEBOX | WS_MAXIMIZEBOX,
				"Total Catch Graph (Stock)"));
			break;
		case ID_SG_PRE:
			gtemp = new zcGMS_CatchPreterminal(
			    new ZatGraphDialog(
				_w,
				new zSizer(40,40,500,400),
				WS_POPUP | WS_CAPTION
				| WS_THICKFRAME | WS_MINIMIZEBOX
				| WS_MAXIMIZEBOX,
				"Preterminal Catch Graph (Stock)"));
			break;
		case ID_SG_TER:
			gtemp = new zcGMS_CatchTerminal(
			    new ZatGraphDialog(
				_w,
				new zSizer(40,40,500,400),
				WS_POPUP | WS_CAPTION
				| WS_THICKFRAME | WS_MINIMIZEBOX
				| WS_MAXIMIZEBOX,
				"Terminal Catch Graph (Stock)"));
			break;
		case ID_SG_TRUTERRUN:
			gtemp = new zcGMS_TrueTermRun(
			    new ZatGraphDialog(
				_w,
				new zSizer(40,40,500,400)
				,WS_POPUP | WS_CAPTION
				| WS_THICKFRAME | WS_MINIMIZEBOX
				| WS_MAXIMIZEBOX,
				"True Term Run (Stock)"));
			break;
		case ID_SG_MONTE:
	    		gtemp = new ZasGraphMedMonteCarlo(
			    new ZatGraphDialog(
				_w,
				new zSizer(40,40,500,400)
				,WS_POPUP | WS_CAPTION
				| WS_THICKFRAME | WS_MINIMIZEBOX
				| WS_MAXIMIZEBOX,
				"Monte Carlo Graph"));
			break;
		default:
			return 0;
		}
	}
	else if(type > ID_HG_MIN && type < ID_HG_MAX){
		gType = STOCK&FISHERY;
		switch(type){

		case ID_HG_INC:
			gtemp = new zcGMH_InMort(
			    new ZatGraphDialog(
				_w,
				new zSizer(40,40,500,400),
				WS_POPUP | WS_CAPTION |  WS_THICKFRAME |
				WS_MINIMIZEBOX | WS_MAXIMIZEBOX,
				"Incidental Mortality Graph (Harvest)"));
			break;
		case ID_HG_TOT:
			gtemp = new zcGMH_TotalMort(
			    new ZatGraphDialog(
				_w,
				new zSizer(40,40,500,400),
				WS_POPUP | WS_CAPTION |  WS_THICKFRAME |
				WS_MINIMIZEBOX | WS_MAXIMIZEBOX,
				"Total Mortality Rate Graph (Harvest)"));
			break;

		default:
			return 0;
		}
	}
	if(gtemp){
		gtemp->get_remove_event()->attach(
		    this, &ZasMediatorFactory::_removeGraph);
		gtemp->setGraphType(gType);
		glist.insert(gtemp);
		return 1;
	}
	return 0;
}

/* These global, static variables are used to enforce that only one instance
 *  of each dialog type is allowed to exist at one time. This prevents
 *  cache incoherency because Steve U. did not implement Interface
 *  Data Controllers correctly. At some point we will implement IDCs correctly
 *  (one global, static IDC object per dialog type) and then we will be
 *  able to create multiple dialogs of the same type.
 * NOTE: the destructor of each dialog mediator NULLs out it's pointer.
 */
ZasDialogMedPNV *_zdmPNV = NULL;
ZasTabDialogMedMR *_ztdmMR = NULL;
ZasTabDialogMedCeilings *_ztdmCeilings = NULL;
ZasTabDialogMedIDL *_ztdmIDL = NULL;
ZasTabDialogMedEV *_ztdmEV = NULL;
ZasTabDialogMedENH *_ztdmENH = NULL;
ZasDialogMedBPHR *_zdmBPHR = NULL;
ZasTabDialogMedHRS *_ztdmHRS = NULL;

int ZasMediatorFactory::makeDialog(const int type){
	ZatDialogMedBase *dtemp = NULL;
	zMessage *zm=NULL;

	switch(type){
	case ID_PNV:
		if (_zdmPNV != NULL)
			_zdmPNV->show();
		else {
			dtemp = _zdmPNV = new ZasDialogMedPNV(
				new idcPNV(),
				new ZatDialogBase(_w, zResId(IDD_PNVFRAME)));
		}
		break;
	case ID_MR:
		if (_ztdmMR != NULL)
			_ztdmMR->show();
		else {
			dtemp = _ztdmMR = new ZasTabDialogMedMR(
				new idcMR(),
				new ZatTabDialog(_w, zResId(IDD_MATURATIONRATES)));
		}
		break;
	case ID_CNR:
		zm = new zMessage(
		    _w, "This dialog is currently under development.",
		    "CNR Dialog", MB_OK);
		delete zm;
		break;
	case ID_CEL:
		if (_ztdmCeilings != NULL)
			_ztdmCeilings->show();
		else {
			dtemp = _ztdmCeilings = new ZasTabDialogMedCeilings(
				new idcCeilings(),
				new ZasTabDialogCeilings(_w, zResId(IDD_CATCHCEILINGS)));
		}
		break;
	case ID_INTDAMLOS:
		if (_ztdmIDL != NULL)
			_ztdmIDL->show();
		else {
			dtemp = _ztdmIDL = new ZasTabDialogMedIDL(
				new idcIDL(),
				new ZatTabDialog(_w, zResId(IDD_INTERDAMLOSS)));
		}
		break;
	case ID_EV:
		if (_ztdmEV != NULL)
			_ztdmEV->show();
		else {
			dtemp = _ztdmEV = new ZasTabDialogMedEV(
				new idcEV(),
				new ZatTabDialog(_w, zResId(IDD_EVSCALARS)));
		}
		break;
	case ID_ENH:
		if (_ztdmENH != NULL)
			_ztdmENH->show();
		else {
			dtemp = _ztdmENH = new ZasTabDialogMedENH(
				new idcENH(),
				new ZasTabDialogENH(_w, zResId(IDD_ENHSCALARS)));
		}
		break;
	case ID_BASPER:
		if (_zdmBPHR != NULL)
			_zdmBPHR->show();
		else {
			dtemp = _zdmBPHR = new ZasDialogMedBPHR(
				new idcBPHR(),
				new ZatDialogBase(_w, zResId(IDD_BASEPERIODHARVESTRATES)));
		}
		break;
	case ID_HARRATSCA:
		if (_ztdmHRS != NULL)
			_ztdmHRS->show();
		else {
			dtemp = _ztdmHRS = new ZasTabDialogMedHRS(
				new idcHRS(),
				new ZatTabDialog(_w, zResId(IDD_HARVESTRATESCALARS)));
		}
		break;
	case ID_MON:
		{
		ZasMonteCarlo *zmc = new ZasMonteCarlo(_w, zResId(IDD_MONTE));
		}
		break;
	case ID_CAL:
		{
		ZasCalibration *zmca = new ZasCalibration(_w);
		}
		break;
	default:
		return 0;
	}
	if(dtemp){
		dtemp->evRemove()->attach(
			this, &ZasMediatorFactory::_removeDialog);
		dlist.insert(dtemp);
		return 1;
	}
	return 0;
}

int ZasMediatorFactory::removeDialog(ZatDialogMedBase *med){
	med->evRemove()->detach(this, &ZasMediatorFactory::_removeDialog);
	dlist.remove(med);
	delete med;
	return 1;
}

int ZasMediatorFactory::removeGraph(zcGraphMediator *med){
	med->get_remove_event()->detach(
	    this, &ZasMediatorFactory::_removeGraph);
	glist.remove(med);
	delete med;
	return 1;
}


void ZasMediatorFactory::_removeGraph(void *factory, zcGraphMediator *med){
	ZasMediatorFactory *f = (ZasMediatorFactory *)factory;
	if(f == _instance)
		f->removeGraph(med);
}
void ZasMediatorFactory::_removeDialog(void *factory, ZatDialogMedBase *med){
	ZasMediatorFactory *f = (ZasMediatorFactory *)factory;
	if(f == _instance)
		f->removeDialog(med);
}


#endif
