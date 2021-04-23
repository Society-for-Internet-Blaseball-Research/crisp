#ifdef _ZAPP_GUI_
#ifndef _ZasMonteCarlo_h_
#define _ZasMonteCarlo_h_

#include "ZatEditSliderLong.h"

class ZasMonteCarlo : public zDialogFrame {

	protected:
		
		zWindow *w_;
		zProgressBar *progBarCtl_;
		ZatEditSliderLong *esNumGames_;

		int lock_;		
		int numberOfGames;
		void registerEvents();
		void unRegisterEvents();
		void sliderModified(const long val, const int id);
		void newGameStarted(const int val);

	public:

		ZasMonteCarlo(zWindow *w, zResId &rid);		
		~ZasMonteCarlo();
		virtual int command(zCommandEvt *Ev);
		static void _sliderModified(void *ptr, const long val, const int id);
		static void _newGameStarted(void *ptr, const int val);
};



#endif
#endif

