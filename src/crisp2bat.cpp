// Crisp2bat.cpp, by Matt Moore, 3/31/99. A knockoff of c2main.cpp in
//  the same directory. This file is used to build a ZApp-less batch-only
//  version of the Crisp2 engine and file i/o system.

// This is not Windows software, Unix only.
#ifdef WIN32
this is not Windows code!!!!!
#endif

//ENGINE STUFF
#include <iostream.h>
#include <stdlib.h>
#include "log.h"
#include "init.h"
#include "globals.h"
#include "Simulation.h"
#include "Args.h"

extern void PrintStats();

int DefaultFishery = 0;
int DefaultStock = 0;

// common routine to perform core execution without any GUI.  does not
// include initializaton.

static void
executeNonGui(Args args)
{
    //no GUI runs scenario unless monte explicitly requested	
    if (args.get_monte_games()){
	cout << "monte:" << endl;
	Simulation::run_monte();
    }
    else if (Calib){
	cout << "calbration:" << endl;	
	Simulation::run_calibration();
    }
    else{
	cout << "scenario run:" << endl;	
	Simulation::run_scenario();
	cout << "complete. " << endl;	
    }
    PrintStats();
    cout << "stats printed." << endl;
}


main(int argc, char **argv)
{
    // Force "-n" argument.
    char **nargv = (char **)malloc( (argc + 2) * sizeof( char * ) );
    int i;
    nargv[0] = argv[0];
    nargv[1] = (char *)malloc( 3 );
    strcpy( nargv[1], "-n" );
    for (i = 1; i < argc; i++)
        nargv[i+1] = argv[i];
    nargv[argc + 1] = 0;

    // Back to the original flow.
    Args args(argc, nargv);
    if (ModelInit(&args) < 0){
 	::LogMsg(L_Fatal, "unable to initialize; exiting...\n");
	exit(-1);
    }
    ::executeNonGui(args);
    ModelCleanup();

    return (0);
}


