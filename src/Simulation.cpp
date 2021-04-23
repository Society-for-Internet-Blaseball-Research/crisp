
#include "Calibrator.h"
#include "MonteControl.h"
#include "Simulation.h"

enum run_type Simulation::last = NONE;

void Simulation::run_monte()
{
    extern MonteControl *MonteCarlo;
    MonteCarlo->run();
    last = MONTE;
}

extern void RunTheModel();
void Simulation::run_scenario()
{
    ::RunTheModel();
    last = SCENARIO;
}

void Simulation::run_calibration()
{
    extern Calibrator *Calib;
    if (Calib)
	Calib->calibrate();
    last = CALIBRATION;
}

run_type Simulation::last_run()
{
    return last;
}


