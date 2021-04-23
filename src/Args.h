#ifndef ARGS_H
#define ARGS_H

#include "Bool.h"
#include "UI.h"

// this class processes command line args and keeps the information
// around to be accessed later.

class Args
{

  public:
    Args(int argc, char **argv);
    Args(char *cmdline);
    ~Args() {}

    char * get_datafile()	{ return datafile; }
    UI::Mode get_ui_mode()	{ return gui_mode; }
    Bool get_sensitivity()	{ return sensitivity; }
    int get_monte_games()	{ return monte_games; }

  private:
    void processArgString(char *);
    
    char *datafile;
    UI::Mode gui_mode;
    int monte_games;
    //char *argv;
    //int argc;
    Bool sensitivity;
};

#endif

