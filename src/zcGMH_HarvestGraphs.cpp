#ifdef _ZAPP_GUI_
#include <zapp.hpp>
#include <intpack/zip.hpp>
#include "globals.h"
#include "zcGMH_HarvestGraphs.h"
#include "idcBPHR.h"
#include "mapConstants.h"
extern int DefaultStock;
extern int DefaultFishery;

// Graph Mediator: Harvest Incidental Mortality Graph

zcGMH_InMort::zcGMH_InMort(ZatGraphDialog *gd) : zcGM_YearAgeGraph(gd) {
	drawLabels();
}

void zcGMH_InMort::drawLabels(void){
	idcBPHR idc;
	_dataIndex[0] = DefaultFishery;
	_dataIndex[1] = DefaultStock;
	setTitle(DefaultStock);
	defHarvest = idc.find(_dataIndex[1], _dataIndex[0]);
	zcGM_YearAgeGraph::drawLabels();
	cbRedraw();
}

void zcGMH_InMort::cbGraphUpdate(const int index, const int type){
	idcBPHR idc;
	if(_gd->isActive()){
		if(type == FISHERY)
			_dataIndex[0] = index;
		if(type == STOCK)
			_dataIndex[1] = index;
		setTitle(index);
		if(dataList.entries())
			dataList.clear();
		defHarvest = idc.find(_dataIndex[1], _dataIndex[0]);
		getData();
		_gd->setDirt();
		cbRedraw();
	}
}

void zcGMH_InMort::setTitle(int index){
	if(index < Stocks.num()){
	    char title[80];
		sprintf(title, "Incidental Mortality, %s Fishery, %s Stock", ::Fisheries[_dataIndex[0]].get_name(), ::Stocks[_dataIndex[1]].get_name());
		_gd->setTitleLabel(title);
	}
}

double zcGMH_InMort::getDataItem(int year, Age age){
	
	if(!defHarvest) return 0.0;
	return 	(defHarvest->get_cnr_sublegals(age, year)
		 + defHarvest->get_cnr_legals(age, year)
		 + defHarvest->get_term_shakers(age, year)
		 + defHarvest->get_preterm_shakers(age, year));

}

// Graph Mediator: Harvest Total Mortality Graph

zcGMH_TotalMort::zcGMH_TotalMort(ZatGraphDialog *gd) : zcGM_YearGraph(gd) {
	drawLabels();
}

void zcGMH_TotalMort::drawLabels(void){
	idcBPHR idc;
	_dataIndex[0] = DefaultFishery;
	_dataIndex[1] = DefaultStock;
	setTitle(DefaultStock);
	defHarvest = idc.find(_dataIndex[1], _dataIndex[0]);
	zcGM_YearGraph::drawLabels();
	_gd->addLegendLabel("Total", new zColor(RED)); 
	cbRedraw();
}

void zcGMH_TotalMort::cbGraphUpdate(const int index, const int type){
	idcBPHR idc;
	if(_gd->isActive()){
		if(type == FISHERY)
			_dataIndex[0] = index;
		else if(type == STOCK)
			_dataIndex[1] = index;
		setTitle(0);
		if(dataList.entries())
			dataList.clear();
		defHarvest = idc.find(_dataIndex[1], _dataIndex[0]);
		getData();
		_gd->setDirt();
		cbRedraw();
	}
}

void zcGMH_TotalMort::setTitle(int index){
	if(index < Stocks.num()){
	    char title[80];
		sprintf(title, "Total Mortality, %s Fishery, %s Stock", ::Fisheries[_dataIndex[0]].get_name(), ::Stocks[_dataIndex[1]].get_name());
		_gd->setTitleLabel(title);
	}
}

void zcGMH_TotalMort::getData(void){
	
	double tempVal;
	int i;
	int ny = Chronographer->nyears();

	maxVal=0.0;
	if(!defHarvest) return;

	for (i = 0; i < ny; i++){
		tempVal = defHarvest->get_total_catch(i);
		for (Age age = FIRST_HV_AGE; age <= age.top(); age++){
			tempVal += (defHarvest->get_cnr_sublegals(age, i)+ defHarvest->get_cnr_legals(age, i)
			+ defHarvest->get_term_shakers(age, i)+ defHarvest->get_preterm_shakers(age, i));
		}
		if(tempVal>maxVal)
			maxVal = tempVal;
		dataList.insert(tempVal);
	}
	maxVal = maxVal*1.2;
	setYAxisRange(long(0),long(maxVal));
}

#endif
