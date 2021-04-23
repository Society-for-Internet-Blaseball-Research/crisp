#include <iostream.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#include "Args.h"
#include "Bool.h"
#include "UI.h"

const char *DFLT_CONFIG_FILE = "proto.OPT";

Args::Args(char *cmdline)
    : gui_mode(UI::ZAPP), datafile(NULL), monte_games(0), sensitivity(FALSE)
{
    processArgString(cmdline);
}

// construct the command line from argc and argv
Args::Args(int argc, char **argv)
    : gui_mode(UI::ZAPP), datafile(NULL), monte_games(0), sensitivity(FALSE)
{
    char *cmdstr;
    int len = 0;
    int i;

    /* Reconstruct a single command line, arguments seperated by spaces. */
    for (i=0; i < argc; ++i)
	len += strlen(argv[i]) + 1;
    cmdstr = new char[len+1];
    cmdstr[0] = '\0';
    for (i=0; i < argc; ++i) {
	strcat(cmdstr, argv[i]);
	strcat(cmdstr, " ");
    }

    processArgString(cmdstr);
    delete [] cmdstr;
}

void
Args::processArgString(char *cmdline)
{
    char *argv=NULL;
    char temp[80];
    if(argv = strstr(cmdline,"-n")){
	gui_mode = UI::NONE;
	cout << "GUI: OFF" << endl;
    }
    if (argv = strstr(cmdline,"-s")){
	sensitivity = TRUE;
	cout << "Sensitivity: ON" << endl;
    }
    if (argv = strstr(cmdline,"-f")){
	int i = 2;
	while(argv[i] == ' ' || argv[i] == '\t')
	    i++;
	int j=0;
	while(argv[i] != ' ' && argv[i] != '\t' && argv[i] != '\0')
	    temp[j++] = argv[i++];
	temp[j] = '\0';
	datafile = new char[strlen(temp) + 1];
	strcpy(datafile, temp);
	cout << "Datafile: " << datafile << endl;
    }
    if (argv = strstr(cmdline,"-m")){
	sscanf(&argv[2], "%d", &monte_games);
	cout << "Monte Games: " << monte_games << endl;
    }
    if (argv = strstr(cmdline,"-h")){
	cout << endl;
	cout << "CRiSP Harvest v3.0.5" << endl;
	cout << "crisphv [-n] [-f filename] [-s] [-m##] [-h]" << endl;
	cout << endl;
	cout << " -n   : Disable GUI" << endl;
	cout << " -s   : Enable sensitivity analysis" << endl;
	cout << " -f   : Specify data option file, default is ";
	cout << DFLT_CONFIG_FILE << endl;
	cout << " -m## : Monte Carlo run with ## games."<< endl;
	cout << endl;
	exit(0);
    }
    if (!datafile){
	datafile = new char[64];
	strcpy(datafile, DFLT_CONFIG_FILE); 
    }
}
