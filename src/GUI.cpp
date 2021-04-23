#include "UI.h"
#include "GUI.h"


UI::Mode UI::mode = UI::UIT;

GUI * GUI::start(Args * args)
{
    UI::init(args->get_ui_mode());
    switch(UI::mode)
    {
      case UI::UIT:
#ifdef _GUI_
	return new UIT_BaseFrame(args->get_argc(), args->get_argv());
#else
	UI::mode = UI::NONE;
#endif
	return 0;
      case UI::OI:
      case UI::ascii:
      default:
	return 0;
    }
}

void GUI::finish()
{
    if (UI::mode == UI::NONE) return;
}
