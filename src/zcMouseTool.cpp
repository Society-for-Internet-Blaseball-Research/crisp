#ifdef _ZAPP_GUI_
#include <zapp.hpp>
#include "zcMouseTool.h"
#include "ZatDialogConstants.h"

int zcMouseTool::id[3][2];

zcMouseTool *zcMouseTool::instance_ = 0;

zcMouseTool::zcMouseTool(zWindow *w, zResId &rid) : zDialogFrame(w,rid), w_(w) {
	OnButton[0][0] = new zComboBoxStatic(this,IDC_COMBOBOX1);
	OnButton[1][0] = new zComboBoxStatic(this,IDC_COMBOBOX2);
	OnButton[2][0] = new zComboBoxStatic(this,IDC_COMBOBOX3);
	OnButton[0][1] = new zComboBoxStatic(this,IDC_COMBOBOX4);
	OnButton[1][1] = new zComboBoxStatic(this,IDC_COMBOBOX5);
	OnButton[2][1] = new zComboBoxStatic(this,IDC_COMBOBOX6);
}


int zcMouseTool::command(zCommandEvt *Ev){
	if(Ev->cmd() == IDC_OK){
		shutdown();
	}
	return 0;
}

zcMouseTool::~zcMouseTool(){
	for(int i=0;i<3;i++)
		for(int j=0;j<2;j++)
			delete OnButton[i][j];
}
#endif
