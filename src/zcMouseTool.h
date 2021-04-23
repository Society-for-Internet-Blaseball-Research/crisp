#ifdef _ZAPP_GUI_
#ifndef _zcMouseTool_h_
#define _zcMouseTool_h_
#include <rw/tvordvec.h>

class zcMouseTool : public zDialogFrame {


		
	protected:

		static zcMouseTool *instance_;
		static int id[3][2];
		zComboBoxStatic *OnButton[3][2];
		zWindow *w_;
		zcMouseTool(zWindow *w, zResId &rid);
		RWTValOrderedVector<int> IdCode[3][2];

	public:

		virtual ~zcMouseTool();
		virtual int command(zCommandEvt *Ev);
		void addEntry(const char *label, int mouseButton, int type, int idcode){
			if(mouseButton > 0 && mouseButton < 3 && type >= 0 && type < 3){
				OnButton[type][mouseButton-1]->add(label);
				IdCode[type][mouseButton-1].insert(idcode);
			}
		}
		virtual int executeCommand(int mouseButton, int type){return 0;}
		
};


#endif
#endif
