#ifdef _ZAPP_GUI_
#include <zapp.hpp>
#include "zcMouseToolCrisp2.h"
#include "ZasMenuConst.h"
#include "ZatDialogConstants.h"
#include "ZasMediatorFactory.h"

zcMouseToolCrisp2::zcMouseToolCrisp2(zWindow *w, zResId &res) : zcMouseTool(w,res){
	for(int i=1;i<3;i++){
		addEntry("Set Default Fishery",i,0,0);
		addEntry("PNV Dialog",i,0,ID_PNV);
		addEntry("CNR Dialog",i,0,ID_CNR);
		addEntry("Ceilings Dialog",i,0,ID_CEL);
		addEntry("-Abundance Index",i,0,ID_FG_ABUIND);
		addEntry("-Total Catch",i,0,ID_FG_TOT);
		addEntry("-Preterminal Catch",i,0,ID_FG_PRE);
		addEntry("-Terminal Catch",i,0,ID_FG_TER);
		addEntry("-Total Incidental Mort.",i,0,ID_FG_INCMOR);
		addEntry("-Sublegal Incidental Mort.",i,0,ID_FG_SUB);
		addEntry("-Legal Incidental Mort.",i,0,ID_FG_LEG);
	}
	for(i=1;i<3;i++){
		addEntry("Set Default Stock",i,1,0);
		addEntry("Inter. Dam Loss",i,1,ID_INTDAMLOS);
		addEntry("Ev Scalars",i,1,ID_EV);
		addEntry("Enhancement",i,1,ID_ENH);
		addEntry("-Abundance Index",i,1,ID_SG_ABU);
		addEntry("-Sublegal",i,1,ID_SG_SUB);
		addEntry("-Legal",i,1,ID_SG_LEG);
		addEntry("-Total",i,1,ID_SG_TOT);
		addEntry("-Preterminal",i,1,ID_SG_PRE);
		addEntry("-Terminal",i,1,ID_SG_TER);
		addEntry("-True Term Run",i,1,ID_SG_TRUTERRUN);
		
	}

	addEntry("Hatchery Info",1,2,0);
	addEntry("Zoom Out",2,2,0);
	for(i=0;i<3;i++)
		for(int j=0;j<2;j++)
			OnButton[i][j]->selection(0);
	OnButton[0][1]->selection(4);
	OnButton[1][1]->selection(4);

}

zcMouseToolCrisp2 *zcMouseToolCrisp2::Instance(zWindow *w){
	if(!instance_){
		for(int i=0;i<3;i++)
			for(int j=0;j<2;j++)
				id[i][j]=0;
		instance_ = new zcMouseToolCrisp2(w, zResId(IDD_MOUSETOOL));
	}
	return (zcMouseToolCrisp2 *)instance_;
}

int zcMouseToolCrisp2::executeCommand(int mouseButton, int type){
	if(mouseButton){
		if(!(ZasMediatorFactory::Instance(w_)->makeDialog(IdCode[type][mouseButton-1].at(OnButton[type][mouseButton-1]->selection())))
		&& !(ZasMediatorFactory::Instance(w_)->makeGraph(IdCode[type][mouseButton-1].at(OnButton[type][mouseButton-1]->selection()))))
			return 0;
	}
	return 1;
}

#endif
