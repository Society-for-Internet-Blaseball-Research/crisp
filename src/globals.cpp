// global externals for crisp2

#include "Calibrator.h"
#include "StockList.h"
#include "FisheryList.h"
#include "Harvest.h"
#include "HarvestList.h"
#include "FisheryManagement.h"
#include "Bool.h"

class MonteControl;

// this is the main harvest list.  nodes deleted should delete the associated
// harvest object as well.  other lists of these objects should not do so.

HarvestList Harvests(TRUE);		// list of all harvests, active delete

// other global lists

FisheryList Fisheries;			// all fisheries
StockList Stocks;			// all stocks

FisheryManagement FisheryManager;	// overall fishery policy manager
Calendar *Chronographer=0;		// global calendar
MonteControl *MonteCarlo=0;		// monte controller
Calibrator *Calib = 0;

//MapRegion PNW("CRiSP 2 Map");		// All the items that go on the map.
