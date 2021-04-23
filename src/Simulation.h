#ifndef SIMULATION_H
#define SIMULATION_H


enum run_type {NONE = 0, MONTE, SCENARIO, CALIBRATION};

class Simulation {
  public:
    Simulation() {}

    static void run_monte();
    static void run_scenario();
    static void run_calibration();
    static run_type last_run();

  private:
    static run_type last;
};

#endif
