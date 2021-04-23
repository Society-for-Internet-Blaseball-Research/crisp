#ifdef _ZAPP_GUI_
#include <zapp.hpp>
#include <intpack/zip.hpp>
#include "ZasGraphMedMonteCarlo.h"
#include "MonteControl.h"
#include "MonteStockIntrfc.h"
#include "Simulation.h"
#include "globals.h"

extern int DefaultStock;

ZasGraphMedMonteCarlo::ZasGraphMedMonteCarlo(ZatGraphDialog *gd) : zcGM_YearGraph(gd) {

 	drawLabels();
}

void ZasGraphMedMonteCarlo::drawLabels(void){
    char gyear[10];
	setTitle(DefaultStock);
	maxVal=0.0;	
	getData();
	_isData = 1;
    xAxisType_ = ZAT_LONG;
    lX_[0] = ::Chronographer->base_year()
		                 + ::Chronographer->nyears() - numYears_;
    lX_[1] = lX_[0] + numYears_ - 1;

	double xDottedLine = (::Chronographer->sim_start_year() - 
		(lX_[0] - ::Chronographer->base_year()) - 0.5) / (numYears_ - 1);
	_gd->setXDottedLine( xDottedLine );

	for (int i = 0; i < numYears_; i++){
		sprintf(gyear, "%d", ::Chronographer->base_year()
			                        +::Chronographer->nyears()-numYears_+i);
		_gd->addXAxisDivLabel(gyear);
	}
	_gd->addLegendLabel("Min", new zColor(RED));
	_gd->addLegendLabel("Median", new zColor(BLUE));
	_gd->addLegendLabel("Max", new zColor(BLACK));
	cbRedraw();

}
void ZasGraphMedMonteCarlo::setTitle(int index){
	char title[80];
	const MonteStockTracking *monte = ::Stocks[index].get_monte()->find_MonteTrackingItem(MonteStockTracking::ESCAPEMENT);	
	if (!monte || !(Simulation::last_run() == MONTE) || (numGames_ = monte->get_game_size()) < 1 || (numYears_ = monte->get_year_size()) == 0){
		sprintf(title, "No data for %s Stock", ::Stocks[index].get_name());
		_gd->setTitleLabel(title);
		return;
	}
	if(index < Stocks.num()){
	    char title[80];
		DefaultSelection = index;
		sprintf(title, "Monte Adult Escapements, %s Stock", ::Stocks[index].get_name());
		_gd->setTitleLabel(title);
	}
}

void ZasGraphMedMonteCarlo::getData(void){

	maxVal=0.0;
	double yearMax, yearMin;
	double tempVal;
	int i,j,g;
	const MonteStockTracking *monte = ::Stocks[DefaultSelection].get_monte()->find_MonteTrackingItem(MonteStockTracking::ESCAPEMENT);	
	const double** data = monte->get_results();
	double *dArr = new double[numGames_];

	if(!dArr || !data)return;

	/* Get minimum value in each year. */
	for (i = 0; i < numYears_; i++){
		yearMin = 2000000000;
		for (g = 0; g < numGames_; g++){
			tempVal=data[g][i];
			if(yearMin > tempVal)
				yearMin = tempVal;
		}
		dataList.insert(yearMin);
	}
 
	/* Get median value in each year. */
	for (i = 0; i < numYears_; i++){
		/* Get data for given year, for each game */
		for (g = 0; g < numGames_; g++)
			dArr[g] = data[g][i];

		/* Sort array of data - simple double-do-loop sort - developer is lazy. */
		for (g = 0; g < numGames_ - 1; g++)
			for (j = g+1; j < numGames_; j++)
				if (dArr[g] > dArr[j]) {
					tempVal = dArr[g];
					dArr[g] = dArr[j];
					dArr[j] = tempVal;
				}

		/* Get median value. */
		if (numGames_ % 2 == 1)
			dataList.insert( dArr[numGames_ / 2] );
		else
			dataList.insert( 
			         (dArr[(numGames_-1) / 2] + dArr[numGames_ / 2]) / 2.0 );
	}

	/* Get maximum value in each year. */
	for (i = 0; i < numYears_; i++){
		yearMax = 0.0;
		for (g = 0; g < numGames_; g++){
			tempVal=data[g][i];
			if(yearMax < tempVal)
				yearMax = tempVal;
			if(tempVal>maxVal)
				maxVal = tempVal;
		}
		dataList.insert(yearMax);
	}

	maxVal = maxVal*1.2;
	setYAxisRange(double(0),double(maxVal));

	delete dArr;
}

void ZasGraphMedMonteCarlo::drawLines(void){

  	if(maxVal == 0.0 || !_isData)
		return;
	zRect r = _gd->getGraphRegion();
	
	int ny = numYears_;
	double incr = double(r.right()-r.left())/(ny-1);
	int i;
	size_t j;

	_gd->lockCanvas();
	for(j = 0; j < dataList.entries()/ny; j++){
		_gd->setCurrentPen(j);
		for (i = 0; i < ny-1; i++){
			if((dataList[i+ny*j] < maxVal) && (dataList[1+i+ny*j] < maxVal))
				_gd->drawLineSegment(
				zPoint(r.left()+(int)(i*incr),
				       int(double(1.0-dataList[i+ny*j]/maxVal)*double(r.bottom()-r.top()))+r.top()),
				zPoint(r.left()+(int)((i+1)*incr),
				       int(double(1.0-dataList[i+1+ny*j]/maxVal)*double(r.bottom()-r.top()))+r.top()));
		}
	}
	_gd->unlockCanvas();

}

#endif
