#ifndef GUI_H
#define GUI_H

#include "Args.h"

class GUI
{
  public:
    static GUI * start(Args *);
    static void finish();

  protected:
    GUI()
    {

    }

    virtual ~GUI(){}
    
    static void run()
    {
	extern void RunTheModel();
	RunTheModel();
    }

    static void print_results()
    {
	extern void PrintStats();
	PrintStats();
    }
};

#endif
