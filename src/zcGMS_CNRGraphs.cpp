#ifdef _ZAPP_GUI_
#include <zapp.hpp>
#include <intpack/zip.hpp>
#include "globals.h"
#include "zcGMS_CNRGraphs.h"


extern int DefaultStock;

// Graph Mediator: Stock CNR Legal Graph

zcGMS_CNRLegal::zcGMS_CNRLegal(ZatGraphDialog *gd) : zcGM_YearAgeGraph(gd) {
	drawLabels();
}

void zcGMS_CNRLegal::drawLabels(void){

	setTitle(DefaultStock);
	zcGM_YearAgeGraph::drawLabels();
	cbRedraw();

}

void zcGMS_CNRLegal::setTitle(int index){
	if(index < Stocks.num()){
	    char title[80];
		DefaultSelection = index;
		sprintf(title, "Legal CNRs, %s Stock", ::Stocks[DefaultSelection].get_name());
		_gd->setTitleLabel(title);
	}
}

double zcGMS_CNRLegal::getDataItem(int year, Age age){
	return ::Stocks[DefaultSelection].get_cnr_legals(age,year);
}

// Graph Mediator: Stock CNR Sublegal Graph

zcGMS_CNRSublegal::zcGMS_CNRSublegal(ZatGraphDialog *gd) : zcGM_YearAgeGraph(gd) {
	drawLabels();
}

void zcGMS_CNRSublegal::drawLabels(void){

	setTitle(DefaultStock);
	zcGM_YearAgeGraph::drawLabels();
	cbRedraw();

}
void zcGMS_CNRSublegal::setTitle(int index){
	if(index < Stocks.num()){
	    char title[80];
		DefaultSelection = index;
	    sprintf(title, "Sublegal CNRs, %s Stock", ::Stocks[DefaultSelection].get_name());
		_gd->setTitleLabel(title);
	}
}

double zcGMS_CNRSublegal::getDataItem(int year, Age age){
	return ::Stocks[DefaultSelection].get_cnr_sublegals(age,year);
}

#endif
