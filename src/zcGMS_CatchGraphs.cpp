#ifdef _ZAPP_GUI_
#include <zapp.hpp>
#include <intpack/zip.hpp>
#include "globals.h"
#include "zcGMS_CatchGraphs.h"


extern int DefaultStock;

zcGMS_CatchTotal::zcGMS_CatchTotal(ZatGraphDialog *gd) : zcGM_YearAgeGraph(gd) {
	drawLabels();
}

void zcGMS_CatchTotal::drawLabels(void){

	setTitle(DefaultStock);
	zcGM_YearAgeGraph::drawLabels();
	cbRedraw();

}

void zcGMS_CatchTotal::setTitle(int index){
	if(index < Stocks.num()){
	    char title[80];
		DefaultSelection = index;
		sprintf(title, "Total Catch, %s Stock", ::Stocks[DefaultSelection].get_name());
		_gd->setTitleLabel(title);
	}
}

double zcGMS_CatchTotal::getDataItem(int year, Age age){
	return ::Stocks[DefaultSelection].get_total_catch(age,year);
}


zcGMS_CatchTerminal::zcGMS_CatchTerminal(ZatGraphDialog *gd) : zcGM_YearAgeGraph(gd) {
	drawLabels();
}

void zcGMS_CatchTerminal::drawLabels(void){

	setTitle(DefaultStock);
	zcGM_YearAgeGraph::drawLabels();
	cbRedraw();

}
void zcGMS_CatchTerminal::setTitle(int index){
	if(index < Stocks.num()){
	    char title[80];
		DefaultSelection = index;
		sprintf(title, "Terminal Catch, %s Stock", ::Stocks[DefaultSelection].get_name());
		_gd->setTitleLabel(title);
	}
}
double zcGMS_CatchTerminal::getDataItem(int year, Age age){
	return ::Stocks[DefaultSelection].get_term_catch(age,year);
}


zcGMS_CatchPreterminal::zcGMS_CatchPreterminal(ZatGraphDialog *gd) : zcGM_YearAgeGraph(gd) {
	drawLabels();
}

void zcGMS_CatchPreterminal::drawLabels(void){

	setTitle(DefaultStock);
	zcGM_YearAgeGraph::drawLabels();
	cbRedraw();

}

void zcGMS_CatchPreterminal::setTitle(int index){
	if(index < Stocks.num()){
	    char title[80];
		DefaultSelection = index;
		sprintf(title, "Preterminal Catch, %s Stock", ::Stocks[DefaultSelection].get_name());
		_gd->setTitleLabel(title);
	}
}

double zcGMS_CatchPreterminal::getDataItem(int year, Age age){
	return ::Stocks[DefaultSelection].get_preterm_catch(age,year);
}
#endif
