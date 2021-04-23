                   Chinook Salmon Harvesting Model README

Using CRiSP Harvest:

CRiSP Harvest version 3.0.6 is intended to be a demonstration of a
user-friendly salmon harvest management simulation model. CRISP HARVEST IS
NOT THE SAME MODEL CURRENTLY BEING USED BY THE PACIFIC SALMON COMMISSION
CHINOOK TECHNICAL COMMITTEE TO ANALYZE CHINOOK SALMON HARVEST STRATEGIES.
Use CRiSP Harvest to learn about general model behavior and functionality,
but DO NOT USE CRISP HARVEST TO EVALUATE CURRENT MANAGEMENT PROPOSALS.

Functionality:

CRiSP Harvest version 3.0.6 duplicates the forecasting portion of the fall
1995 version of the PSC Chinook Model. The Monte Carlo and In-River
Management options in CRiSP Harvest version 3.0.6 are additional features
added by the University of Washington School of Fisheries staff and are not
contained in the PSC Chinook Model. These new features have not been
formally peer-reviewed by the PSC Chinook Technical Committee. Monte Carlo
and In-River Management model behaviors should be considered preliminary.

Calibration:

CRiSP Harvest version 3.0.6 uses input data files from the 9525 calibration
of the PSC Chinook Model.

Default Management Strategy:

The default management strategy for the simulation period (1995 - 2017)
defined by the input files accompanying CRiSP Harvest represents a modified
version of one strategy being analyzed by the PSC Chinook Technical
Committee during 1995. In simple terms, this default strategy simulates
reduced harvests for the years 1995 - 1997 (by reducing harvest rates to
about 75% of the base period rates) and simulates average 1991 - 1994 catch
ceilings and harvest rates for years beyond 1997.

Default Brood Year Survival Rates:

The model results during the simulation period are very sensitive to the
estimates of the stock specific brood year survival rates (roughly the
survival rate from egg through age one; also called EV, or Environmental
Variability, scalars). The simulation period EV Scalar values used in CRiSP
Harvest are estimated from the calibration period values under the
assumption that the EV Scalars are independent and log-normally distributed.
When using Monte Carlo mode, the model randomly selects EV scalar values
from the estimated log-normal distribution associated with each stock. The
Monte Carlo values are selected independently for each stock, implying that
there is no correlation between brood year survival rates among stocks.

Documentation:

The online documentation in this program has not yet been fully implemented.
Many of the dialog screens have no context sensitive help. As the
documentation and other features are tested and revised we will place our
latest version of the beta here for further testing.

We have included the four chapters of the CRiSP Harvest Manual as Adobe
Acrobat PDF files in the "Program Files\CBR\CRiSP Harvest" directory. If you
want a hardcopy of the manual, you can print one from these files. (You can download the free Adobe Acrobat Reader at http://www.adobe.com/prodindex/acrobat/readstep.html.)

Bug Reports:

Please use our online <b>Bug Report</b> form at http://www.cqs.washington.edu/crisp/ch_bug.html.

How to Get a New Copy:

The latest copy of CRiSP Harvest v3.xx can be obtained at the following
address: http://www.cqs.washington.edu/crisp/model.html

Please direct questions or comments to:
jnorris@olympus.net
Columbia Basin Research, UW
