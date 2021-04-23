/* log.cc
 *
 *	Definition of the non-inline LogLevel class functions, including
 * the construction of all global (reportable) log levels.
 */
#include "log.h"

#ifdef _GUI_
#include <ComponentDisplay.h>
#endif

#include <iostream.h>

#ifdef NOT_NEEDED
extern "C"
{
    extern size_t strlen(const char *);
    extern char *strcpy(char *, const char *);
};
#endif

#ifdef USE_OI
extern OI_app_window *base;	// Who knows what this will be called?
#endif

RWTPtrSlist<LogLevel> LogLevel::list;

#ifdef USE_OI
OI_box *LogLevel::log_window = 0;
#else
#ifdef _GUI_
PopUpWindow *LogLevel::log_window = 0;
ToggleChoice *LogLevel::toggle = 0;
TextDisplay *LogLevel::text = 0;
#endif
#endif

// This is lame and may have to be removed somehow.
char LogBuf[256];	// For log.h, need to define exactly once.  Big enough?

// The usable log levels.  The parameters for construction specify
// flags for the log levels.
LogLevel L_Error(TRUE, "Error", "Error: ", TRUE);
LogLevel L_Warning(TRUE, "Warning", "Warning: ");
LogLevel L_Msg(FALSE, "Messages");
LogLevel L_IOMsg(FALSE, "IO");
LogLevel L_Fatal(TRUE, "Fatal", "FATAL: ", TRUE, FALSE, TRUE);
LogLevel L_Force(TRUE, "Force", "Force: ", TRUE, FALSE);
#ifdef DEBUG
LogLevel L_DbgMsg(TRUE, "Debug");
#else
LogLevel L_DbgMsg(FALSE, "Debug");
#endif

const unsigned LOG_LINES = 16;
const unsigned LOG_WIDTH = 80;
const unsigned LOG_MAX_LINES = 0;	// 0 = no maximum.

/*
 * void LogMsg(const LogLevel &l, const char *format, ...) - Printf style
 *	error message formatting.  Would be nice if this actually ran
 *	inlined.
 */
void LogMsg(const LogLevel &l, const char *format, ...)
{
    if (::LogTest(l)) {
	va_list args;
	va_start(args, format);
	vsprintf(LogBuf, format, args);
	l.display_log_message(LogBuf);
	va_end(args);
    }
}

/*
 * LogLevel(Bool set_by_default, char *level_name, char *message_prefix,
 *	Bool force_show, Bool user_can_set, Bool level_is_fatal) -
 *
 */
LogLevel::LogLevel(Bool set_by_default, char *level_name, char *message_prefix,
		   Bool force_show, Bool user_can_set, Bool level_is_fatal)
:flag(set_by_default), user_settable(user_can_set), force(force_show),
 fatal(level_is_fatal), name(level_name), prefix(message_prefix)
{
#ifdef _GUI_    
    list.append(this);
    if (log_window && is_settable())
    {
	// This code will not see any use, so long as this package is
	// used as it is designed (LogLevels declared at init time)

#ifdef USE_OI
	OI_poly_rect_menu *levels;

	levels = (OI_poly_rect_menu *) log_window->subobject("MessageChoices");
#ifndef OI_FIXED_THEIR_CONSTS
	char *ptr = new char[strlen(get_name())+1];
	strcpy(ptr, get_name());
	OI_menu_cell *cell = oi_create_menu_cell(ptr, ptr,
		NULL, NULL, OI_TEXT_CELL, NULL, 0, 0, 0,
		set() ? OI_CELL_SELECT : 0);
#else // OI_FIXED_THEIR_CONSTS
	OI_menu_cell *cell = oi_create_menu_cell(get_name(), get_name(),
		NULL, NULL, OI_TEXT_CELL, NULL, 0, 0, 0,
		set() ? OI_CELL_SELECT : 0);
#endif // OI_FIXED_THEIR_CONSTS
	levels->add_cell(cell, levels->num_cells());
#else // USE_OI

#ifndef UIT_CONSTS_SUCK_TOO
	char *ptr = new char[strlen(get_name())+1];
	strcpy(ptr, get_name());
	toggle->addChoice(ptr);
	toggle->setSelectedChoice(ptr, set());
#else
	toggle->addChoice(get_name());
	toggle->setSelectedChoice(get_name(), set());
#endif
	
#endif //USE_OI

    }
#endif //_GUI_
    
}

/*
 * LogLevel::~LogLevel()
 */
LogLevel::~LogLevel()
{
    if (
#ifdef _GUI_	
	log_window &&
#endif    
    is_settable())
    {
	// Though this is not likely to be called, it's added for completeness.
#ifdef USE_OI

#ifndef OI_FIXED_THEIR_CONSTS
    	char *name = new char[strlen(get_name())+1];	// LAME!!!!
    	strcpy(name, get_name());
	log_window->descendant(name)->del();	// delete_delayed() ?
    	delete [] name;
#else // OI_FIXED_THEIR_CONSTS
	log_window->descendant(get_name())->del();	// delete_delayed() ?
#endif // OI_FIXED_THEIR_CONSTS

#else // USE_OI

#ifndef UIT_CONSTS_SUCK_TOO
        char *nm = new char[strlen(get_name())+1];
	strcpy(nm, get_name());
#ifdef _GUI_	
	toggle->deleteChoice(name);
#endif	
	delete [] nm;
#else // UIT_CONSTS_SUCK_TOO
#ifdef _GUI_	
	toggle->deleteChoice(get_name());
#endif		
#endif // UIT_CONSTS_SUCK_TOO

#endif // USE_OI
    }
    list.remove(this);
    if (list.entries() == 0)
    {
#ifdef USE_OI
#ifdef _GUI_
	log_window->del();	// delete_delayed() ?
#endif	
#else // USE_OI
#ifdef _GUI_	
	delete toggle;
        delete text;
	delete log_window;
#endif	
#endif // USE_OI
#ifdef _GUI_	
	log_window = 0;
	text = 0;
	toggle = 0;
#endif	
    }
}

void LogLevel::show_log_window()
{
#ifdef _GUI_
    if (!log_window)
	make_log_window();
#ifdef USE_OI
    log_window->set_state(OI_ACTIVE);
#else // USE_OI
    log_window->setPinned(TRUE);
    log_window->show(TRUE);
#endif // USE_OI
#endif    
}

void LogLevel::hide_log_window()
{
#ifdef _GUI_    
    if (log_window) {
#ifdef USE_OI
	log_window->set_state(OI_NOT_DISPLAYED);
#else // USE_OI
	log_window->setPinned(FALSE);
	log_window->show(FALSE);
#endif // USE_OI
    }
#endif    
}

#ifdef USE_OI
void LogLevel::log_poly_callback(OI_menu_cell *cellp, void *, OI_number)
{
    set(cellp->selected() == OI_YES);
}
#endif

void LogLevel::make_log_window()
{
#ifdef _GUI_
    if (!log_window)
    {
#ifdef USE_OI
	log_window = oi_create_box("MessageWindow", 1, 1);
	log_window->set_associated_object(base->root(), OI_DEF_LOC, OI_DEF_LOC,
		OI_NOT_DISPLAYED);

	log_window->set_layout(OI_layout_column);

	OI_menu_cell *done_button = oi_create_menu_cell("DoneButton", "Done",
		(OI_action_fnp) hide_log_window);
	OI_button_menu *done = oi_create_button_menu("DoneMenu", 1,
		&done_button);
	done->layout_associated_object(log_window, OI_DEF_LOC, OI_DEF_LOC,
		OI_ACTIVE);

	OI_scroll_text *text = oi_create_scroll_text("TextDisplay",
		OI_scroll_bar_vertical | OI_scroll_bar_left, LOG_LINES,
		LOG_WIDTH, LOG_MAX_LINES);
	text->layout_associated_object(log_window, OI_DEF_LOC, OI_DEF_LOC,
		OI_ACTIVE);

	OI_menu_cell **cell = new OI_menu_cell* [list.entries()];
#else // USE_OI
	log_window = new PopUpWindow("Message Window");

	ComponentDisplay *cd = new ComponentDisplay(TRUE);

	Button *done = new Button("Done");

	toggle = new ToggleChoice("Log Settings");
	toggle->setMultipleChoice(TRUE);

	TextDisplay *txt = new TextDisplay;
	txt->setReadOnly(TRUE);
#endif // USE_OI

#ifndef OI_FIXED_THEIR_CONSTS
	char *ptr;
#endif // OI_FIXED_THEIR_CONSTS
	unsigned i = 0;
	RWTPtrSlistIterator<LogLevel> iter(list);
	LogLevel *l;
	while(l = iter())
	{
	    if (!l->is_settable()) continue;

#ifdef USE_OI

#ifndef OI_FIXED_THEIR_CONSTS
	    ptr = new char[strlen(l->get_name())+1];
	    strcpy(ptr, l->get_name());
	    cell[i] = oi_create_menu_cell(ptr, ptr, (OI_callback *) l,
		(OI_action_memfnp) log_poly_callback);
	    delete [] ptr;
#else // OI_FIXED_THEIR_CONSTS
	    cell[i] = oi_create_menu_cell(l->get_name(), l->get_name(),
		(OI_callback *) l, (OI_action_memfnp) log_poly_callback);
#endif // OI_FIXED_THEIR_CONSTS
	    cell[i]->select(l->set() ? OI_YES : OI_NO);

#else  // USE_OI

#ifndef UIT_CONSTS_SUCK_TOO
	    ptr = new char[strlen(l->get_name())+1];
	    strcpy(ptr, l->get_name());
	    toggle->addChoice(ptr);
	    toggle->setSelectedChoice(ptr, l->set());
#else
	    toggle->addChoice(l->get_name());
	    toggle->setSelectedChoice(l->get_name(), l->set());
#endif
#endif // USE_OI

	    ++i;
	}

#ifdef USE_OI
	OI_poly_rect_menu *levels = oi_create_poly_rect_menu("MessageChoices",
		i, cell, OI_HORIZONTAL, "Log Settings");
	levels->layout_associated_object(log_window, OI_DEF_LOC, OI_DEF_LOC,
		OI_ACTIVE);
#else  // USE_OI
	cd->addComponent(*done);
	cd->addComponent(*toggle);
//	cd->addComponent(*txt);
	log_window->addDisplay(*cd);
#endif // USE_OI
    }
#endif
}

/*
 * display_log_message(const char *message) -- Write the message passed in to
 *	the log window.  The varargs part should be in a single string by now.
 */
#ifndef OI_FIXED_THEIR_CONSTS
void LogLevel::display_log_message(char *message)
#else
void LogLevel::display_log_message(const char *message)
#endif
{
#ifdef USE_OI
// Temp hack to make this work!
    show_log_window();
#endif
#ifdef _GUI_
    if (!log_window) {
	cerr << message;
	return;
    }

#ifdef USE_OI
    OI_base_text *text = (OI_base_text *)
	log_window->descendant("TextDisplay");
    text->append_string(message, LOG_MAX_LINES ? OI_YES : OI_NO);
#else  // USE_OI
    
#endif // USE_OI
    // Deal with writing to a file!
#else // _GUI_
    cerr << message;
    return;
#endif // _GUI_
}
