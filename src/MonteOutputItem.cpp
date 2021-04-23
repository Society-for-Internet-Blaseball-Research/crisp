#include <stdio.h>
#include <stdlib.h>
#include "globals.h"
#include "log.h"
#include "statistics.h"
#include "tokens.h"
#include "MonteOutputItem.h"
#include "MonteStockIntrfc.h"


MonteOutputItem::MonteOutputItem()
: nyears(0), years(0), nstocks(0), stocks(0)
{
}

MonteOutputItem::~MonteOutputItem()
{
    delete [] stocks;
    delete [] years;
}

// preconditions:
//   File pointer positioned at the beginning of a variable spec: "output".
// postcondition:
//   'this' is filled in to reflect requested output.
int MonteOutputItem::read(FILE *fp)
{
    char buf[256];
    int err = 0;
    
    char *token;
    while (fgets(buf, 256, fp) != NULL
	   && (token = strtok(buf, " \t\n")))
    {
	if (!strcmp(token, "stocks"))
	{
	    token = strtok(NULL, " \t\n");
	    nstocks = atoi(token);
	    if (stocks) delete [] stocks;
	    stocks = new Stock * [nstocks];
	    for (int i = 0; i < nstocks; i++)
	    {
		token = strtok(NULL, " \t\n");
		for (int j = 0; j < ::Stocks.num(); ++j)
		    if (!strcmp(::Stocks[j].get_abbrv(), token))
		    {
			stocks[i] = &::Stocks[j];
			break;
		    }
	    }
	}
	else if (!strcmp(token, "years"))
	{
	    token = strtok(NULL, " \t\n");
	    nyears = atoi(token);
	    if (years) delete [] years;
	    years = new int[nyears];
	    for (int i = 0; i < nyears; i++)
	    {
		token = strtok(NULL, " \t\n");
		years[i] = atoi(token);
	    }
	}
	else if (!strcmp(token, "end"))
	    return err;
	else
	{
	    ::LogMsg(L_Error, "bad output configuration specification.\n");
	    return ++err;
	}
    }
    ::LogMsg(L_Warning, "No matching end for output specification.\n");
    return err;
}
    
int MonteEscQuantileOutput::write(char *prefix) const
{
    int err = 0;
    for (int i = 0; i < nstocks; i++)
    {
	const MonteStockTracking *monte = stocks[i]->get_monte()
	    ->find_MonteTrackingItem(MonteStockTracking::ESCAPEMENT);
	int games, myears;
	if (!monte 
	    || !monte->get_results()
	    || (games = monte->get_game_size()) <= 1
	    || !(myears = monte->get_year_size()))
	    return 0;
	const double **data = monte->get_results();
	if (!data) return 0;

	// quant.prn
	char fn[MAX_TOKEN_LEN];
	FILE *fp;
	sprintf(fn, "%s%squant.prn", prefix, stocks[i]->get_abbrv());
    
	extern int open_outfile(FILE *&, const char *);
	if (open_outfile(fp, fn))
	    return 1;
	
	int base_year = ::Chronographer->base_year() +
	    ::Chronographer->nyears() - myears;

	float *values;
	if (!(values = new float [games]))
	{
	    ::LogMsg(L_Error, "Out of memory in monte quantile output.\n");
	    return 1;
	}

	if (games >= 10)
	    fprintf(fp, "Year \tMin \t25%% \tMedian \t75%% \t95%%\n");
	else
	    fprintf(fp, "Year \tMin \tMedian \tMax\n");

	if (nyears)
	{
	    for (int y = 0 ; y < nyears; y++)
	    {
		int year = years[y];
		if ((year < base_year) || (year > base_year + myears))
		{
		    ::LogMsg(L_Error, "No escapement histogram information"
			     " for year %d.\n", year);
		    err++;
		}
		else
		{
		    fprintf(fp, "%d\t", year);

		    for (int g = 0; g < games; g++)
		    {
			int year_index = year - base_year;
			values[g] = (float)(data[g][year_index]);
		    }
		    qsort(values, games, sizeof(float), compare );
		    fprintf(fp, "%.0f\t", values[0]);
		    if (games >= 10)
			fprintf(fp, "%.0f\t",
				get_quantile(values, games, (float).25));
		    fprintf(fp, "%.0f\t",
			    get_quantile(values, games, (float).5));
		    if (games >= 10)
			fprintf(fp, "%.0f\t",
				get_quantile(values, games, (float).75));
		    if (games >= 10)
			fprintf(fp, "%.0f\t",
				get_quantile(values, games, (float).95));
		    else	
			fprintf(fp, "%.0f\t", values[games - 1]);
		    fprintf(fp, "\n");
		}
	    }
	}
	else
	{
	    for (int year = 0; year < myears; year++)
	    {
		fprintf(fp, "%d\t", year + base_year);

		{
		    for (int g = 0; g < games; g++)
			values[g] = (float)(data[g][year]);
		    qsort(values, games, sizeof(float), compare );
		    fprintf(fp, "%.0f\t", values[0]);
		    if (games >= 10)
			fprintf(fp, "%.0f\t",
				get_quantile(values, games, (float).25));
		    fprintf(fp, "%.0f\t",
			    get_quantile(values, games, (float).5));
		    if (games >= 10)
			fprintf(fp, "%.0f\t",
				get_quantile(values, games, (float).75));
		    if (games >= 10)
			fprintf(fp, "%.0f\t",
				get_quantile(values, games, (float).95));
		    else	
			fprintf(fp, "%.0f\t", values[games - 1]);
		    fprintf(fp, "\n");
		}
	    }
	}
	fclose(fp);
	delete [] values;
    }
    return err;
}

int MonteEscapementOutput::write(char *prefix) const
{
    int err = 0;
    for (int i = 0; i < nstocks; i++)
    {
	const MonteStockTracking *monte = stocks[i]->get_monte()
	    ->find_MonteTrackingItem(MonteStockTracking::ESCAPEMENT);
	int games, myears;
	if (!monte 
	    || !monte->get_results()
	    || (games = monte->get_game_size()) <= 1
	    || !(myears = monte->get_year_size()))
	    return 0;
	const double **data = monte->get_results();
	if (!data) return 0;

	// hist.prn
	char fn[MAX_TOKEN_LEN];
	FILE *fp;
	sprintf(fn, "%s%shist.prn", prefix, stocks[i]->get_abbrv());
    
	extern int open_outfile(FILE *&, const char *);
	if (open_outfile(fp, fn))
	    return 1;
	
	int base_year = ::Chronographer->base_year() +
	    ::Chronographer->nyears() - myears;
	
	for (int g = -1; g < games; g++)
	{
	    if (g < 0)
		fprintf(fp, "Year\t");
	    else
		fprintf(fp, "Gm%d\t", g);
	    if (nyears)
	    {
		for (int y = 0 ; y < nyears; y++)
		{
	
		    int year = years[y];
		    if ((year < base_year) || (year > base_year + myears))
		    {
			::LogMsg(L_Error, "No escapement histogram information"
				 " for year %d.\n", year);
			err++;
		    }
		    else
		    {
			if (g < 0)
			    fprintf(fp, "%d\t", year);
			else
			{
			    int year_index = year - base_year;
			    fprintf(fp, "%.0f\t", data[g][year_index]);
			}
		    }
		}
		fprintf(fp, "\n");
	    }
	    else
	    {
		for (int year = 0; year < myears; year++)
		    if (g < 0)
			fprintf(fp, "%d\t", year + base_year);
		    else
			fprintf(fp, "%.0f\t", data[g][year]);
		fprintf(fp, "\n");
	    }
	}
	fclose(fp);
    }
    return 0;
}
