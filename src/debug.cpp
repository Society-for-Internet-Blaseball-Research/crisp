//debugging fns only; remove file later

#ifdef DEBUG

#include <iostream.h>
#include "Stock.h"
#include "Fishery.h"
#include "Harvest.h"

void Stock::print_harvests()
{
    cout << "\nFisheries for Stock " << get_name() << ":" << endl;
    for (Harvest* phv = hv_list.head(); !hv_list.at_end(); phv = hv_list.next())
    {
	cout << "\t" << phv->get_fishery()->get_name() << endl;
    }
}

void Fishery::print_harvests()
{
    cout << "\nStocks for Fishery " << get_name() << ":" << endl;
    for (Harvest* phv = hv_list.head(); !hv_list.at_end(); phv = hv_list.next())
    {
	cout << "\t" << phv->get_stock()->get_name() << endl;
    }
}

#endif
