// Phase.h

#ifndef PHASE_H
#define PHASE_H

#include "IEnum.h"

// phases in which harvest occurs.  right now, preterminal and terminal.
// IEnum HarvestPhase is provided as an incremental enumerated type.

enum HvPhaseEnum { PRETERM, TERM, NUM_PHASES };
typedef IEnum<HvPhaseEnum, int(PRETERM), int(TERM)> HarvestPhase; 

#endif
