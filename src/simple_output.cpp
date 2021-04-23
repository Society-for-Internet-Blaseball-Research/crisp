// do some PSC style output

#include <iostream.h>
#include <stdio.h>
#include "globals.h"
#include "IOCrud.h"
#include "Stock.h"
#include "StockList.h"
#include "log.h"

void PrintStats()
{
	
    IOCrud psc("output");
	if (psc.write_output_files())
	::LogMsg(L_Error, "problem writing output files.\n");
}
