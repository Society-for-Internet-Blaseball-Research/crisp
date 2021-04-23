// global externals for crisp2
#ifndef GLOBALS_H
#define GLOBALS_H

#include "Bool.h"
#include "StockList.h"
#include "FisheryList.h"

class HarvestList;
class Calendar;
class Calibrator;
class MapRegion;
class FisheryManagement;
class MonteControl;

extern StockList Stocks;		// list of all stocks
extern HarvestList Harvests;		// list of all harvests
extern FisheryList Fisheries;		// array of all fisheries
extern FisheryManagement FisheryManager; // overall policy manager
extern Calendar *Chronographer;		// global calendar
extern Calibrator *Calib;		// Calibration manager.
extern MonteControl *MonteCarlo;	// monte controller
extern MapRegion PNW;			// All the items on the map.

extern int DefaultStock;
extern int DefaultFishery;

#endif
