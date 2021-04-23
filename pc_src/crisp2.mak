# Microsoft Developer Studio Generated NMAKE File, Based on crisp2.dsp
!IF "$(CFG)" == ""
CFG=crisp2 - Win32 Release
!MESSAGE No configuration specified. Defaulting to crisp2 - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "crisp2 - Win32 Release" && "$(CFG)" != "crisp2 - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "crisp2.mak" CFG="crisp2 - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "crisp2 - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "crisp2 - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "crisp2 - Win32 Release"

OUTDIR=E:\WORKSHOP\CRISP2\OUTPUT
INTDIR=E:\WORKSHOP\CRISP2\OBJ
# Begin Custom Macros
OutDir=E:\WORKSHOP\CRISP2\OUTPUT
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\crisp2.exe" "$(OUTDIR)\crisp2.bsc"

!ELSE 

ALL : "$(OUTDIR)\crisp2.exe" "$(OUTDIR)\crisp2.bsc"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\base_tokens.obj"
	-@erase "$(INTDIR)\base_tokens.sbr"
	-@erase "$(INTDIR)\Bootstrap.obj"
	-@erase "$(INTDIR)\Bootstrap.sbr"
	-@erase "$(INTDIR)\c2main.obj"
	-@erase "$(INTDIR)\Calendar.obj"
	-@erase "$(INTDIR)\Calendar.sbr"
	-@erase "$(INTDIR)\Calibrator.obj"
	-@erase "$(INTDIR)\Calibrator.sbr"
	-@erase "$(INTDIR)\Ceiling.obj"
	-@erase "$(INTDIR)\Ceiling.sbr"
	-@erase "$(INTDIR)\CeilingPolicy.obj"
	-@erase "$(INTDIR)\CeilingPolicy.sbr"
	-@erase "$(INTDIR)\clog.obj"
	-@erase "$(INTDIR)\clog.sbr"
	-@erase "$(INTDIR)\CNR.obj"
	-@erase "$(INTDIR)\CNR.sbr"
	-@erase "$(INTDIR)\Cohort.obj"
	-@erase "$(INTDIR)\Cohort.sbr"
	-@erase "$(INTDIR)\command.obj"
	-@erase "$(INTDIR)\command.sbr"
	-@erase "$(INTDIR)\Crisp2.res"
	-@erase "$(INTDIR)\datFisheryCeilings.obj"
	-@erase "$(INTDIR)\datIntDouble.obj"
	-@erase "$(INTDIR)\debug.obj"
	-@erase "$(INTDIR)\debug.sbr"
	-@erase "$(INTDIR)\engine.obj"
	-@erase "$(INTDIR)\engine.sbr"
	-@erase "$(INTDIR)\Fishery.obj"
	-@erase "$(INTDIR)\Fishery.sbr"
	-@erase "$(INTDIR)\FisheryManagement.obj"
	-@erase "$(INTDIR)\FisheryManagement.sbr"
	-@erase "$(INTDIR)\FisherySummary.obj"
	-@erase "$(INTDIR)\FisherySummary.sbr"
	-@erase "$(INTDIR)\FisheryTactics.obj"
	-@erase "$(INTDIR)\FisheryTactics.sbr"
	-@erase "$(INTDIR)\FixedCombHarv.obj"
	-@erase "$(INTDIR)\FixedCombHarv.sbr"
	-@erase "$(INTDIR)\FixedEscapementPolicy.obj"
	-@erase "$(INTDIR)\FixedEscapementPolicy.sbr"
	-@erase "$(INTDIR)\globals.obj"
	-@erase "$(INTDIR)\globals.sbr"
	-@erase "$(INTDIR)\GUI.obj"
	-@erase "$(INTDIR)\GUI.sbr"
	-@erase "$(INTDIR)\Harvest.obj"
	-@erase "$(INTDIR)\Harvest.sbr"
	-@erase "$(INTDIR)\HarvestList.obj"
	-@erase "$(INTDIR)\HarvestList.sbr"
	-@erase "$(INTDIR)\HarvestTactics.obj"
	-@erase "$(INTDIR)\HarvestTactics.sbr"
	-@erase "$(INTDIR)\HatcheryProduction.obj"
	-@erase "$(INTDIR)\HatcheryProduction.sbr"
	-@erase "$(INTDIR)\HatchSurplusProduction.obj"
	-@erase "$(INTDIR)\HatchSurplusProduction.sbr"
	-@erase "$(INTDIR)\help.obj"
	-@erase "$(INTDIR)\help.sbr"
	-@erase "$(INTDIR)\HvSummary.obj"
	-@erase "$(INTDIR)\HvSummary.sbr"
	-@erase "$(INTDIR)\idcBPHR.obj"
	-@erase "$(INTDIR)\idcCeilings.obj"
	-@erase "$(INTDIR)\idcENH.obj"
	-@erase "$(INTDIR)\idcEV.obj"
	-@erase "$(INTDIR)\idcHRS.obj"
	-@erase "$(INTDIR)\idcIDL.obj"
	-@erase "$(INTDIR)\idcMR.obj"
	-@erase "$(INTDIR)\idcPNV.obj"
	-@erase "$(INTDIR)\implicit_base.obj"
	-@erase "$(INTDIR)\include.obj"
	-@erase "$(INTDIR)\include.sbr"
	-@erase "$(INTDIR)\init.obj"
	-@erase "$(INTDIR)\init.sbr"
	-@erase "$(INTDIR)\IOCrud.obj"
	-@erase "$(INTDIR)\IOCrud.sbr"
	-@erase "$(INTDIR)\log.obj"
	-@erase "$(INTDIR)\log.sbr"
	-@erase "$(INTDIR)\mapController.obj"
	-@erase "$(INTDIR)\mapObject.obj"
	-@erase "$(INTDIR)\monte_tokens.obj"
	-@erase "$(INTDIR)\monte_tokens.sbr"
	-@erase "$(INTDIR)\MonteControl.obj"
	-@erase "$(INTDIR)\MonteControl.sbr"
	-@erase "$(INTDIR)\MonteDataItem.obj"
	-@erase "$(INTDIR)\MonteDataItem.sbr"
	-@erase "$(INTDIR)\MonteOutputItem.obj"
	-@erase "$(INTDIR)\MonteOutputItem.sbr"
	-@erase "$(INTDIR)\MonteStockIntrfc.obj"
	-@erase "$(INTDIR)\MonteStockIntrfc.sbr"
	-@erase "$(INTDIR)\MonteStockTracking.obj"
	-@erase "$(INTDIR)\MonteStockTracking.sbr"
	-@erase "$(INTDIR)\MonteTrackingItem.obj"
	-@erase "$(INTDIR)\MonteTrackingItem.sbr"
	-@erase "$(INTDIR)\MultiCeilingPolicy.obj"
	-@erase "$(INTDIR)\MultiCeilingPolicy.sbr"
	-@erase "$(INTDIR)\NamedPtrVec.obj"
	-@erase "$(INTDIR)\NaturalProduction.obj"
	-@erase "$(INTDIR)\NaturalProduction.sbr"
	-@erase "$(INTDIR)\Parser.obj"
	-@erase "$(INTDIR)\Parser.sbr"
	-@erase "$(INTDIR)\parseutil.obj"
	-@erase "$(INTDIR)\Policy.obj"
	-@erase "$(INTDIR)\Policy.sbr"
	-@erase "$(INTDIR)\Production.obj"
	-@erase "$(INTDIR)\Production.sbr"
	-@erase "$(INTDIR)\RandGen.obj"
	-@erase "$(INTDIR)\RandGen.sbr"
	-@erase "$(INTDIR)\RandNorm.obj"
	-@erase "$(INTDIR)\RandNorm.sbr"
	-@erase "$(INTDIR)\Range.obj"
	-@erase "$(INTDIR)\ReadToken.obj"
	-@erase "$(INTDIR)\Sample.obj"
	-@erase "$(INTDIR)\simple_output.obj"
	-@erase "$(INTDIR)\simple_output.sbr"
	-@erase "$(INTDIR)\Simulation.obj"
	-@erase "$(INTDIR)\Simulation.sbr"
	-@erase "$(INTDIR)\State.obj"
	-@erase "$(INTDIR)\State.sbr"
	-@erase "$(INTDIR)\statistics.obj"
	-@erase "$(INTDIR)\statistics.sbr"
	-@erase "$(INTDIR)\Stock.obj"
	-@erase "$(INTDIR)\Stock.sbr"
	-@erase "$(INTDIR)\StockCalib.obj"
	-@erase "$(INTDIR)\StockCalib.sbr"
	-@erase "$(INTDIR)\StockConfig.obj"
	-@erase "$(INTDIR)\StockConfig.sbr"
	-@erase "$(INTDIR)\StockSummary.obj"
	-@erase "$(INTDIR)\StockSummary.sbr"
	-@erase "$(INTDIR)\String.obj"
	-@erase "$(INTDIR)\String.sbr"
	-@erase "$(INTDIR)\Strtools.obj"
	-@erase "$(INTDIR)\Token.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\version.obj"
	-@erase "$(INTDIR)\version.sbr"
	-@erase "$(INTDIR)\ZasCalibration.obj"
	-@erase "$(INTDIR)\ZasDialogMedBPHR.obj"
	-@erase "$(INTDIR)\ZasDialogMedPNV.obj"
	-@erase "$(INTDIR)\ZasGraphMedMonteCarlo.obj"
	-@erase "$(INTDIR)\ZasGraphUpdateMed.obj"
	-@erase "$(INTDIR)\ZasMapMedCrispHarvest.obj"
	-@erase "$(INTDIR)\ZasMediatorFactory.obj"
	-@erase "$(INTDIR)\ZasMonteCarlo.obj"
	-@erase "$(INTDIR)\ZasTabDialogCeilings.obj"
	-@erase "$(INTDIR)\ZasTabDialogENH.obj"
	-@erase "$(INTDIR)\ZasTabDialogMedCeilings.obj"
	-@erase "$(INTDIR)\ZasTabDialogMedENH.obj"
	-@erase "$(INTDIR)\ZasTabDialogMedEV.obj"
	-@erase "$(INTDIR)\ZasTabDialogMedHRS.obj"
	-@erase "$(INTDIR)\ZasTabDialogMedIDL.obj"
	-@erase "$(INTDIR)\ZasTabDialogMedMR.obj"
	-@erase "$(INTDIR)\ZatCheckBoxGroup.obj"
	-@erase "$(INTDIR)\ZatDialogBase.obj"
	-@erase "$(INTDIR)\ZatDialogMedBase.obj"
	-@erase "$(INTDIR)\ZatEditSliderBase.obj"
	-@erase "$(INTDIR)\ZatEditSliderDouble.obj"
	-@erase "$(INTDIR)\ZatEditSliderLong.obj"
	-@erase "$(INTDIR)\ZatGraphDialog.obj"
	-@erase "$(INTDIR)\ZatGraphicPane.obj"
	-@erase "$(INTDIR)\ZatImplicitScroller.obj"
	-@erase "$(INTDIR)\ZatMapMediator.obj"
	-@erase "$(INTDIR)\ZatMapPane.obj"
	-@erase "$(INTDIR)\ZatMercatorTransform.obj"
	-@erase "$(INTDIR)\ZatPointTransform.obj"
	-@erase "$(INTDIR)\ZatRowColumnBox.obj"
	-@erase "$(INTDIR)\ZatTabDialog.obj"
	-@erase "$(INTDIR)\ZatTabDialogMed.obj"
	-@erase "$(INTDIR)\zcGM_YearAgeGraph.obj"
	-@erase "$(INTDIR)\zcGM_YearGraph.obj"
	-@erase "$(INTDIR)\zcGMF_AbundanceIndex.obj"
	-@erase "$(INTDIR)\zcGMF_CatchPreterm.obj"
	-@erase "$(INTDIR)\zcGMF_CatchTerminal.obj"
	-@erase "$(INTDIR)\zcGMF_CatchTotal.obj"
	-@erase "$(INTDIR)\zcGMF_InMortLegal.obj"
	-@erase "$(INTDIR)\zcGMF_InMortSublegal.obj"
	-@erase "$(INTDIR)\zcGMF_InMortTotal.obj"
	-@erase "$(INTDIR)\zcGMH_HarvestGraphs.obj"
	-@erase "$(INTDIR)\zcGMS_Abundance.obj"
	-@erase "$(INTDIR)\zcGMS_CatchGraphs.obj"
	-@erase "$(INTDIR)\zcGMS_CNRGraphs.obj"
	-@erase "$(INTDIR)\zcGMS_Escapement.obj"
	-@erase "$(INTDIR)\zcGMS_TrueTermRun.obj"
	-@erase "$(INTDIR)\zcGraphMediator.obj"
	-@erase "$(INTDIR)\zcMouseTool.obj"
	-@erase "$(INTDIR)\zcMouseToolCrisp2.obj"
	-@erase "$(OUTDIR)\crisp2.bsc"
	-@erase "$(OUTDIR)\crisp2.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_WIN32"\
 /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /Fp"$(INTDIR)\crisp2.pch" /YX\
 /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=E:\WORKSHOP\CRISP2\OBJ/
CPP_SBRS=.

.c{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\Crisp2.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\crisp2.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\base_tokens.sbr" \
	"$(INTDIR)\Bootstrap.sbr" \
	"$(INTDIR)\Calendar.sbr" \
	"$(INTDIR)\Calibrator.sbr" \
	"$(INTDIR)\Ceiling.sbr" \
	"$(INTDIR)\CeilingPolicy.sbr" \
	"$(INTDIR)\clog.sbr" \
	"$(INTDIR)\CNR.sbr" \
	"$(INTDIR)\Cohort.sbr" \
	"$(INTDIR)\command.sbr" \
	"$(INTDIR)\debug.sbr" \
	"$(INTDIR)\engine.sbr" \
	"$(INTDIR)\Fishery.sbr" \
	"$(INTDIR)\FisheryManagement.sbr" \
	"$(INTDIR)\FisherySummary.sbr" \
	"$(INTDIR)\FisheryTactics.sbr" \
	"$(INTDIR)\FixedCombHarv.sbr" \
	"$(INTDIR)\FixedEscapementPolicy.sbr" \
	"$(INTDIR)\globals.sbr" \
	"$(INTDIR)\GUI.sbr" \
	"$(INTDIR)\Harvest.sbr" \
	"$(INTDIR)\HarvestList.sbr" \
	"$(INTDIR)\HarvestTactics.sbr" \
	"$(INTDIR)\HatcheryProduction.sbr" \
	"$(INTDIR)\HatchSurplusProduction.sbr" \
	"$(INTDIR)\help.sbr" \
	"$(INTDIR)\HvSummary.sbr" \
	"$(INTDIR)\include.sbr" \
	"$(INTDIR)\init.sbr" \
	"$(INTDIR)\IOCrud.sbr" \
	"$(INTDIR)\log.sbr" \
	"$(INTDIR)\monte_tokens.sbr" \
	"$(INTDIR)\MonteControl.sbr" \
	"$(INTDIR)\MonteDataItem.sbr" \
	"$(INTDIR)\MonteOutputItem.sbr" \
	"$(INTDIR)\MonteStockIntrfc.sbr" \
	"$(INTDIR)\MonteStockTracking.sbr" \
	"$(INTDIR)\MonteTrackingItem.sbr" \
	"$(INTDIR)\MultiCeilingPolicy.sbr" \
	"$(INTDIR)\NaturalProduction.sbr" \
	"$(INTDIR)\Parser.sbr" \
	"$(INTDIR)\Policy.sbr" \
	"$(INTDIR)\Production.sbr" \
	"$(INTDIR)\RandGen.sbr" \
	"$(INTDIR)\RandNorm.sbr" \
	"$(INTDIR)\simple_output.sbr" \
	"$(INTDIR)\Simulation.sbr" \
	"$(INTDIR)\State.sbr" \
	"$(INTDIR)\statistics.sbr" \
	"$(INTDIR)\Stock.sbr" \
	"$(INTDIR)\StockCalib.sbr" \
	"$(INTDIR)\StockConfig.sbr" \
	"$(INTDIR)\StockSummary.sbr" \
	"$(INTDIR)\String.sbr" \
	"$(INTDIR)\version.sbr"

"$(OUTDIR)\crisp2.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=zvcnt.lib zipvnt.lib zh32vcs.lib mtl.lib ole32.lib oleaut32.lib\
 ctl3d32s.lib libc.lib oldnames.lib kernel32.lib advapi32.lib user32.lib\
 gdi32.lib comdlg32.lib winspool.lib shell32.lib uuid.lib odbc32.lib\
 odbccp32.lib /nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)\crisp2.pdb" /machine:I386 /nodefaultlib\
 /out:"$(OUTDIR)\crisp2.exe" 
LINK32_OBJS= \
	"$(INTDIR)\base_tokens.obj" \
	"$(INTDIR)\Bootstrap.obj" \
	"$(INTDIR)\c2main.obj" \
	"$(INTDIR)\Calendar.obj" \
	"$(INTDIR)\Calibrator.obj" \
	"$(INTDIR)\Ceiling.obj" \
	"$(INTDIR)\CeilingPolicy.obj" \
	"$(INTDIR)\clog.obj" \
	"$(INTDIR)\CNR.obj" \
	"$(INTDIR)\Cohort.obj" \
	"$(INTDIR)\command.obj" \
	"$(INTDIR)\Crisp2.res" \
	"$(INTDIR)\datFisheryCeilings.obj" \
	"$(INTDIR)\datIntDouble.obj" \
	"$(INTDIR)\debug.obj" \
	"$(INTDIR)\engine.obj" \
	"$(INTDIR)\Fishery.obj" \
	"$(INTDIR)\FisheryManagement.obj" \
	"$(INTDIR)\FisherySummary.obj" \
	"$(INTDIR)\FisheryTactics.obj" \
	"$(INTDIR)\FixedCombHarv.obj" \
	"$(INTDIR)\FixedEscapementPolicy.obj" \
	"$(INTDIR)\globals.obj" \
	"$(INTDIR)\GUI.obj" \
	"$(INTDIR)\Harvest.obj" \
	"$(INTDIR)\HarvestList.obj" \
	"$(INTDIR)\HarvestTactics.obj" \
	"$(INTDIR)\HatcheryProduction.obj" \
	"$(INTDIR)\HatchSurplusProduction.obj" \
	"$(INTDIR)\help.obj" \
	"$(INTDIR)\HvSummary.obj" \
	"$(INTDIR)\idcBPHR.obj" \
	"$(INTDIR)\idcCeilings.obj" \
	"$(INTDIR)\idcENH.obj" \
	"$(INTDIR)\idcEV.obj" \
	"$(INTDIR)\idcHRS.obj" \
	"$(INTDIR)\idcIDL.obj" \
	"$(INTDIR)\idcMR.obj" \
	"$(INTDIR)\idcPNV.obj" \
	"$(INTDIR)\implicit_base.obj" \
	"$(INTDIR)\include.obj" \
	"$(INTDIR)\init.obj" \
	"$(INTDIR)\IOCrud.obj" \
	"$(INTDIR)\log.obj" \
	"$(INTDIR)\mapController.obj" \
	"$(INTDIR)\mapObject.obj" \
	"$(INTDIR)\monte_tokens.obj" \
	"$(INTDIR)\MonteControl.obj" \
	"$(INTDIR)\MonteDataItem.obj" \
	"$(INTDIR)\MonteOutputItem.obj" \
	"$(INTDIR)\MonteStockIntrfc.obj" \
	"$(INTDIR)\MonteStockTracking.obj" \
	"$(INTDIR)\MonteTrackingItem.obj" \
	"$(INTDIR)\MultiCeilingPolicy.obj" \
	"$(INTDIR)\NamedPtrVec.obj" \
	"$(INTDIR)\NaturalProduction.obj" \
	"$(INTDIR)\Parser.obj" \
	"$(INTDIR)\parseutil.obj" \
	"$(INTDIR)\Policy.obj" \
	"$(INTDIR)\Production.obj" \
	"$(INTDIR)\RandGen.obj" \
	"$(INTDIR)\RandNorm.obj" \
	"$(INTDIR)\Range.obj" \
	"$(INTDIR)\ReadToken.obj" \
	"$(INTDIR)\Sample.obj" \
	"$(INTDIR)\simple_output.obj" \
	"$(INTDIR)\Simulation.obj" \
	"$(INTDIR)\State.obj" \
	"$(INTDIR)\statistics.obj" \
	"$(INTDIR)\Stock.obj" \
	"$(INTDIR)\StockCalib.obj" \
	"$(INTDIR)\StockConfig.obj" \
	"$(INTDIR)\StockSummary.obj" \
	"$(INTDIR)\String.obj" \
	"$(INTDIR)\Strtools.obj" \
	"$(INTDIR)\Token.obj" \
	"$(INTDIR)\version.obj" \
	"$(INTDIR)\ZasCalibration.obj" \
	"$(INTDIR)\ZasDialogMedBPHR.obj" \
	"$(INTDIR)\ZasDialogMedPNV.obj" \
	"$(INTDIR)\ZasGraphMedMonteCarlo.obj" \
	"$(INTDIR)\ZasGraphUpdateMed.obj" \
	"$(INTDIR)\ZasMapMedCrispHarvest.obj" \
	"$(INTDIR)\ZasMediatorFactory.obj" \
	"$(INTDIR)\ZasMonteCarlo.obj" \
	"$(INTDIR)\ZasTabDialogCeilings.obj" \
	"$(INTDIR)\ZasTabDialogENH.obj" \
	"$(INTDIR)\ZasTabDialogMedCeilings.obj" \
	"$(INTDIR)\ZasTabDialogMedENH.obj" \
	"$(INTDIR)\ZasTabDialogMedEV.obj" \
	"$(INTDIR)\ZasTabDialogMedHRS.obj" \
	"$(INTDIR)\ZasTabDialogMedIDL.obj" \
	"$(INTDIR)\ZasTabDialogMedMR.obj" \
	"$(INTDIR)\ZatCheckBoxGroup.obj" \
	"$(INTDIR)\ZatDialogBase.obj" \
	"$(INTDIR)\ZatDialogMedBase.obj" \
	"$(INTDIR)\ZatEditSliderBase.obj" \
	"$(INTDIR)\ZatEditSliderDouble.obj" \
	"$(INTDIR)\ZatEditSliderLong.obj" \
	"$(INTDIR)\ZatGraphDialog.obj" \
	"$(INTDIR)\ZatGraphicPane.obj" \
	"$(INTDIR)\ZatImplicitScroller.obj" \
	"$(INTDIR)\ZatMapMediator.obj" \
	"$(INTDIR)\ZatMapPane.obj" \
	"$(INTDIR)\ZatMercatorTransform.obj" \
	"$(INTDIR)\ZatPointTransform.obj" \
	"$(INTDIR)\ZatRowColumnBox.obj" \
	"$(INTDIR)\ZatTabDialog.obj" \
	"$(INTDIR)\ZatTabDialogMed.obj" \
	"$(INTDIR)\zcGM_YearAgeGraph.obj" \
	"$(INTDIR)\zcGM_YearGraph.obj" \
	"$(INTDIR)\zcGMF_AbundanceIndex.obj" \
	"$(INTDIR)\zcGMF_CatchPreterm.obj" \
	"$(INTDIR)\zcGMF_CatchTerminal.obj" \
	"$(INTDIR)\zcGMF_CatchTotal.obj" \
	"$(INTDIR)\zcGMF_InMortLegal.obj" \
	"$(INTDIR)\zcGMF_InMortSublegal.obj" \
	"$(INTDIR)\zcGMF_InMortTotal.obj" \
	"$(INTDIR)\zcGMH_HarvestGraphs.obj" \
	"$(INTDIR)\zcGMS_Abundance.obj" \
	"$(INTDIR)\zcGMS_CatchGraphs.obj" \
	"$(INTDIR)\zcGMS_CNRGraphs.obj" \
	"$(INTDIR)\zcGMS_Escapement.obj" \
	"$(INTDIR)\zcGMS_TrueTermRun.obj" \
	"$(INTDIR)\zcGraphMediator.obj" \
	"$(INTDIR)\zcMouseTool.obj" \
	"$(INTDIR)\zcMouseToolCrisp2.obj"

"$(OUTDIR)\crisp2.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

OUTDIR=E:\WORKSHOP\CRISP2\OUTPUT
INTDIR=E:\WORKSHOP\CRISP2\OBJ
# Begin Custom Macros
OutDir=E:\WORKSHOP\CRISP2\OUTPUT
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\crisphv3.exe" "$(OUTDIR)\crisp2.bsc"

!ELSE 

ALL : "$(OUTDIR)\crisphv3.exe" "$(OUTDIR)\crisp2.bsc"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\base_tokens.obj"
	-@erase "$(INTDIR)\base_tokens.sbr"
	-@erase "$(INTDIR)\Bootstrap.obj"
	-@erase "$(INTDIR)\Bootstrap.sbr"
	-@erase "$(INTDIR)\c2main.obj"
	-@erase "$(INTDIR)\c2main.sbr"
	-@erase "$(INTDIR)\Calendar.obj"
	-@erase "$(INTDIR)\Calendar.sbr"
	-@erase "$(INTDIR)\Calibrator.obj"
	-@erase "$(INTDIR)\Calibrator.sbr"
	-@erase "$(INTDIR)\Ceiling.obj"
	-@erase "$(INTDIR)\Ceiling.sbr"
	-@erase "$(INTDIR)\CeilingPolicy.obj"
	-@erase "$(INTDIR)\CeilingPolicy.sbr"
	-@erase "$(INTDIR)\clog.obj"
	-@erase "$(INTDIR)\clog.sbr"
	-@erase "$(INTDIR)\CNR.obj"
	-@erase "$(INTDIR)\CNR.sbr"
	-@erase "$(INTDIR)\Cohort.obj"
	-@erase "$(INTDIR)\Cohort.sbr"
	-@erase "$(INTDIR)\command.obj"
	-@erase "$(INTDIR)\command.sbr"
	-@erase "$(INTDIR)\Crisp2.res"
	-@erase "$(INTDIR)\datFisheryCeilings.obj"
	-@erase "$(INTDIR)\datFisheryCeilings.sbr"
	-@erase "$(INTDIR)\datIntDouble.obj"
	-@erase "$(INTDIR)\datIntDouble.sbr"
	-@erase "$(INTDIR)\debug.obj"
	-@erase "$(INTDIR)\debug.sbr"
	-@erase "$(INTDIR)\engine.obj"
	-@erase "$(INTDIR)\engine.sbr"
	-@erase "$(INTDIR)\Fishery.obj"
	-@erase "$(INTDIR)\Fishery.sbr"
	-@erase "$(INTDIR)\FisheryManagement.obj"
	-@erase "$(INTDIR)\FisheryManagement.sbr"
	-@erase "$(INTDIR)\FisherySummary.obj"
	-@erase "$(INTDIR)\FisherySummary.sbr"
	-@erase "$(INTDIR)\FisheryTactics.obj"
	-@erase "$(INTDIR)\FisheryTactics.sbr"
	-@erase "$(INTDIR)\FixedCombHarv.obj"
	-@erase "$(INTDIR)\FixedCombHarv.sbr"
	-@erase "$(INTDIR)\FixedEscapementPolicy.obj"
	-@erase "$(INTDIR)\FixedEscapementPolicy.sbr"
	-@erase "$(INTDIR)\globals.obj"
	-@erase "$(INTDIR)\globals.sbr"
	-@erase "$(INTDIR)\GUI.obj"
	-@erase "$(INTDIR)\GUI.sbr"
	-@erase "$(INTDIR)\Harvest.obj"
	-@erase "$(INTDIR)\Harvest.sbr"
	-@erase "$(INTDIR)\HarvestList.obj"
	-@erase "$(INTDIR)\HarvestList.sbr"
	-@erase "$(INTDIR)\HarvestTactics.obj"
	-@erase "$(INTDIR)\HarvestTactics.sbr"
	-@erase "$(INTDIR)\HatcheryProduction.obj"
	-@erase "$(INTDIR)\HatcheryProduction.sbr"
	-@erase "$(INTDIR)\HatchSurplusProduction.obj"
	-@erase "$(INTDIR)\HatchSurplusProduction.sbr"
	-@erase "$(INTDIR)\help.obj"
	-@erase "$(INTDIR)\help.sbr"
	-@erase "$(INTDIR)\HvSummary.obj"
	-@erase "$(INTDIR)\HvSummary.sbr"
	-@erase "$(INTDIR)\idcBPHR.obj"
	-@erase "$(INTDIR)\idcBPHR.sbr"
	-@erase "$(INTDIR)\idcCeilings.obj"
	-@erase "$(INTDIR)\idcCeilings.sbr"
	-@erase "$(INTDIR)\idcENH.obj"
	-@erase "$(INTDIR)\idcENH.sbr"
	-@erase "$(INTDIR)\idcEV.obj"
	-@erase "$(INTDIR)\idcEV.sbr"
	-@erase "$(INTDIR)\idcHRS.obj"
	-@erase "$(INTDIR)\idcHRS.sbr"
	-@erase "$(INTDIR)\idcIDL.obj"
	-@erase "$(INTDIR)\idcIDL.sbr"
	-@erase "$(INTDIR)\idcMR.obj"
	-@erase "$(INTDIR)\idcMR.sbr"
	-@erase "$(INTDIR)\idcPNV.obj"
	-@erase "$(INTDIR)\idcPNV.sbr"
	-@erase "$(INTDIR)\implicit_base.obj"
	-@erase "$(INTDIR)\implicit_base.sbr"
	-@erase "$(INTDIR)\include.obj"
	-@erase "$(INTDIR)\include.sbr"
	-@erase "$(INTDIR)\init.obj"
	-@erase "$(INTDIR)\init.sbr"
	-@erase "$(INTDIR)\IOCrud.obj"
	-@erase "$(INTDIR)\IOCrud.sbr"
	-@erase "$(INTDIR)\log.obj"
	-@erase "$(INTDIR)\log.sbr"
	-@erase "$(INTDIR)\mapController.obj"
	-@erase "$(INTDIR)\mapController.sbr"
	-@erase "$(INTDIR)\mapObject.obj"
	-@erase "$(INTDIR)\mapObject.sbr"
	-@erase "$(INTDIR)\monte_tokens.obj"
	-@erase "$(INTDIR)\monte_tokens.sbr"
	-@erase "$(INTDIR)\MonteControl.obj"
	-@erase "$(INTDIR)\MonteControl.sbr"
	-@erase "$(INTDIR)\MonteDataItem.obj"
	-@erase "$(INTDIR)\MonteDataItem.sbr"
	-@erase "$(INTDIR)\MonteOutputItem.obj"
	-@erase "$(INTDIR)\MonteOutputItem.sbr"
	-@erase "$(INTDIR)\MonteStockIntrfc.obj"
	-@erase "$(INTDIR)\MonteStockIntrfc.sbr"
	-@erase "$(INTDIR)\MonteStockTracking.obj"
	-@erase "$(INTDIR)\MonteStockTracking.sbr"
	-@erase "$(INTDIR)\MonteTrackingItem.obj"
	-@erase "$(INTDIR)\MonteTrackingItem.sbr"
	-@erase "$(INTDIR)\MultiCeilingPolicy.obj"
	-@erase "$(INTDIR)\MultiCeilingPolicy.sbr"
	-@erase "$(INTDIR)\NamedPtrVec.obj"
	-@erase "$(INTDIR)\NamedPtrVec.sbr"
	-@erase "$(INTDIR)\NaturalProduction.obj"
	-@erase "$(INTDIR)\NaturalProduction.sbr"
	-@erase "$(INTDIR)\Parser.obj"
	-@erase "$(INTDIR)\Parser.sbr"
	-@erase "$(INTDIR)\parseutil.obj"
	-@erase "$(INTDIR)\parseutil.sbr"
	-@erase "$(INTDIR)\Policy.obj"
	-@erase "$(INTDIR)\Policy.sbr"
	-@erase "$(INTDIR)\Production.obj"
	-@erase "$(INTDIR)\Production.sbr"
	-@erase "$(INTDIR)\RandGen.obj"
	-@erase "$(INTDIR)\RandGen.sbr"
	-@erase "$(INTDIR)\RandNorm.obj"
	-@erase "$(INTDIR)\RandNorm.sbr"
	-@erase "$(INTDIR)\Range.obj"
	-@erase "$(INTDIR)\Range.sbr"
	-@erase "$(INTDIR)\ReadToken.obj"
	-@erase "$(INTDIR)\ReadToken.sbr"
	-@erase "$(INTDIR)\Sample.obj"
	-@erase "$(INTDIR)\Sample.sbr"
	-@erase "$(INTDIR)\simple_output.obj"
	-@erase "$(INTDIR)\simple_output.sbr"
	-@erase "$(INTDIR)\Simulation.obj"
	-@erase "$(INTDIR)\Simulation.sbr"
	-@erase "$(INTDIR)\State.obj"
	-@erase "$(INTDIR)\State.sbr"
	-@erase "$(INTDIR)\statistics.obj"
	-@erase "$(INTDIR)\statistics.sbr"
	-@erase "$(INTDIR)\Stock.obj"
	-@erase "$(INTDIR)\Stock.sbr"
	-@erase "$(INTDIR)\StockCalib.obj"
	-@erase "$(INTDIR)\StockCalib.sbr"
	-@erase "$(INTDIR)\StockConfig.obj"
	-@erase "$(INTDIR)\StockConfig.sbr"
	-@erase "$(INTDIR)\StockSummary.obj"
	-@erase "$(INTDIR)\StockSummary.sbr"
	-@erase "$(INTDIR)\String.obj"
	-@erase "$(INTDIR)\String.sbr"
	-@erase "$(INTDIR)\Strtools.obj"
	-@erase "$(INTDIR)\Strtools.sbr"
	-@erase "$(INTDIR)\Token.obj"
	-@erase "$(INTDIR)\Token.sbr"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\vc50.pdb"
	-@erase "$(INTDIR)\version.obj"
	-@erase "$(INTDIR)\version.sbr"
	-@erase "$(INTDIR)\ZasCalibration.obj"
	-@erase "$(INTDIR)\ZasCalibration.sbr"
	-@erase "$(INTDIR)\ZasDialogMedBPHR.obj"
	-@erase "$(INTDIR)\ZasDialogMedBPHR.sbr"
	-@erase "$(INTDIR)\ZasDialogMedPNV.obj"
	-@erase "$(INTDIR)\ZasDialogMedPNV.sbr"
	-@erase "$(INTDIR)\ZasGraphMedMonteCarlo.obj"
	-@erase "$(INTDIR)\ZasGraphMedMonteCarlo.sbr"
	-@erase "$(INTDIR)\ZasGraphUpdateMed.obj"
	-@erase "$(INTDIR)\ZasGraphUpdateMed.sbr"
	-@erase "$(INTDIR)\ZasMapMedCrispHarvest.obj"
	-@erase "$(INTDIR)\ZasMapMedCrispHarvest.sbr"
	-@erase "$(INTDIR)\ZasMediatorFactory.obj"
	-@erase "$(INTDIR)\ZasMediatorFactory.sbr"
	-@erase "$(INTDIR)\ZasMonteCarlo.obj"
	-@erase "$(INTDIR)\ZasMonteCarlo.sbr"
	-@erase "$(INTDIR)\ZasTabDialogCeilings.obj"
	-@erase "$(INTDIR)\ZasTabDialogCeilings.sbr"
	-@erase "$(INTDIR)\ZasTabDialogENH.obj"
	-@erase "$(INTDIR)\ZasTabDialogENH.sbr"
	-@erase "$(INTDIR)\ZasTabDialogMedCeilings.obj"
	-@erase "$(INTDIR)\ZasTabDialogMedCeilings.sbr"
	-@erase "$(INTDIR)\ZasTabDialogMedENH.obj"
	-@erase "$(INTDIR)\ZasTabDialogMedENH.sbr"
	-@erase "$(INTDIR)\ZasTabDialogMedEV.obj"
	-@erase "$(INTDIR)\ZasTabDialogMedEV.sbr"
	-@erase "$(INTDIR)\ZasTabDialogMedHRS.obj"
	-@erase "$(INTDIR)\ZasTabDialogMedHRS.sbr"
	-@erase "$(INTDIR)\ZasTabDialogMedIDL.obj"
	-@erase "$(INTDIR)\ZasTabDialogMedIDL.sbr"
	-@erase "$(INTDIR)\ZasTabDialogMedMR.obj"
	-@erase "$(INTDIR)\ZasTabDialogMedMR.sbr"
	-@erase "$(INTDIR)\ZatCheckBoxGroup.obj"
	-@erase "$(INTDIR)\ZatCheckBoxGroup.sbr"
	-@erase "$(INTDIR)\ZatDialogBase.obj"
	-@erase "$(INTDIR)\ZatDialogBase.sbr"
	-@erase "$(INTDIR)\ZatDialogMedBase.obj"
	-@erase "$(INTDIR)\ZatDialogMedBase.sbr"
	-@erase "$(INTDIR)\ZatEditSliderBase.obj"
	-@erase "$(INTDIR)\ZatEditSliderBase.sbr"
	-@erase "$(INTDIR)\ZatEditSliderDouble.obj"
	-@erase "$(INTDIR)\ZatEditSliderDouble.sbr"
	-@erase "$(INTDIR)\ZatEditSliderLong.obj"
	-@erase "$(INTDIR)\ZatEditSliderLong.sbr"
	-@erase "$(INTDIR)\ZatGraphDialog.obj"
	-@erase "$(INTDIR)\ZatGraphDialog.sbr"
	-@erase "$(INTDIR)\ZatGraphicPane.obj"
	-@erase "$(INTDIR)\ZatGraphicPane.sbr"
	-@erase "$(INTDIR)\ZatImplicitScroller.obj"
	-@erase "$(INTDIR)\ZatImplicitScroller.sbr"
	-@erase "$(INTDIR)\ZatMapMediator.obj"
	-@erase "$(INTDIR)\ZatMapMediator.sbr"
	-@erase "$(INTDIR)\ZatMapPane.obj"
	-@erase "$(INTDIR)\ZatMapPane.sbr"
	-@erase "$(INTDIR)\ZatMercatorTransform.obj"
	-@erase "$(INTDIR)\ZatMercatorTransform.sbr"
	-@erase "$(INTDIR)\ZatPointTransform.obj"
	-@erase "$(INTDIR)\ZatPointTransform.sbr"
	-@erase "$(INTDIR)\ZatRowColumnBox.obj"
	-@erase "$(INTDIR)\ZatRowColumnBox.sbr"
	-@erase "$(INTDIR)\ZatTabDialog.obj"
	-@erase "$(INTDIR)\ZatTabDialog.sbr"
	-@erase "$(INTDIR)\ZatTabDialogMed.obj"
	-@erase "$(INTDIR)\ZatTabDialogMed.sbr"
	-@erase "$(INTDIR)\zcGM_YearAgeGraph.obj"
	-@erase "$(INTDIR)\zcGM_YearAgeGraph.sbr"
	-@erase "$(INTDIR)\zcGM_YearGraph.obj"
	-@erase "$(INTDIR)\zcGM_YearGraph.sbr"
	-@erase "$(INTDIR)\zcGMF_AbundanceIndex.obj"
	-@erase "$(INTDIR)\zcGMF_AbundanceIndex.sbr"
	-@erase "$(INTDIR)\zcGMF_CatchPreterm.obj"
	-@erase "$(INTDIR)\zcGMF_CatchPreterm.sbr"
	-@erase "$(INTDIR)\zcGMF_CatchTerminal.obj"
	-@erase "$(INTDIR)\zcGMF_CatchTerminal.sbr"
	-@erase "$(INTDIR)\zcGMF_CatchTotal.obj"
	-@erase "$(INTDIR)\zcGMF_CatchTotal.sbr"
	-@erase "$(INTDIR)\zcGMF_InMortLegal.obj"
	-@erase "$(INTDIR)\zcGMF_InMortLegal.sbr"
	-@erase "$(INTDIR)\zcGMF_InMortSublegal.obj"
	-@erase "$(INTDIR)\zcGMF_InMortSublegal.sbr"
	-@erase "$(INTDIR)\zcGMF_InMortTotal.obj"
	-@erase "$(INTDIR)\zcGMF_InMortTotal.sbr"
	-@erase "$(INTDIR)\zcGMH_HarvestGraphs.obj"
	-@erase "$(INTDIR)\zcGMH_HarvestGraphs.sbr"
	-@erase "$(INTDIR)\zcGMS_Abundance.obj"
	-@erase "$(INTDIR)\zcGMS_Abundance.sbr"
	-@erase "$(INTDIR)\zcGMS_CatchGraphs.obj"
	-@erase "$(INTDIR)\zcGMS_CatchGraphs.sbr"
	-@erase "$(INTDIR)\zcGMS_CNRGraphs.obj"
	-@erase "$(INTDIR)\zcGMS_CNRGraphs.sbr"
	-@erase "$(INTDIR)\zcGMS_Escapement.obj"
	-@erase "$(INTDIR)\zcGMS_Escapement.sbr"
	-@erase "$(INTDIR)\zcGMS_TrueTermRun.obj"
	-@erase "$(INTDIR)\zcGMS_TrueTermRun.sbr"
	-@erase "$(INTDIR)\zcGraphMediator.obj"
	-@erase "$(INTDIR)\zcGraphMediator.sbr"
	-@erase "$(INTDIR)\zcMouseTool.obj"
	-@erase "$(INTDIR)\zcMouseTool.sbr"
	-@erase "$(INTDIR)\zcMouseToolCrisp2.obj"
	-@erase "$(INTDIR)\zcMouseToolCrisp2.sbr"
	-@erase "$(OUTDIR)\crisp2.bsc"
	-@erase "$(OUTDIR)\crisphv3.exe"
	-@erase "$(OUTDIR)\crisphv3.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D RW_NO_STL=1 /D\
 "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=E:\WORKSHOP\CRISP2\OBJ/
CPP_SBRS=E:\WORKSHOP\CRISP2\OBJ/

.c{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\Crisp2.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\crisp2.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\base_tokens.sbr" \
	"$(INTDIR)\Bootstrap.sbr" \
	"$(INTDIR)\c2main.sbr" \
	"$(INTDIR)\Calendar.sbr" \
	"$(INTDIR)\Calibrator.sbr" \
	"$(INTDIR)\Ceiling.sbr" \
	"$(INTDIR)\CeilingPolicy.sbr" \
	"$(INTDIR)\clog.sbr" \
	"$(INTDIR)\CNR.sbr" \
	"$(INTDIR)\Cohort.sbr" \
	"$(INTDIR)\command.sbr" \
	"$(INTDIR)\datFisheryCeilings.sbr" \
	"$(INTDIR)\datIntDouble.sbr" \
	"$(INTDIR)\debug.sbr" \
	"$(INTDIR)\engine.sbr" \
	"$(INTDIR)\Fishery.sbr" \
	"$(INTDIR)\FisheryManagement.sbr" \
	"$(INTDIR)\FisherySummary.sbr" \
	"$(INTDIR)\FisheryTactics.sbr" \
	"$(INTDIR)\FixedCombHarv.sbr" \
	"$(INTDIR)\FixedEscapementPolicy.sbr" \
	"$(INTDIR)\globals.sbr" \
	"$(INTDIR)\GUI.sbr" \
	"$(INTDIR)\Harvest.sbr" \
	"$(INTDIR)\HarvestList.sbr" \
	"$(INTDIR)\HarvestTactics.sbr" \
	"$(INTDIR)\HatcheryProduction.sbr" \
	"$(INTDIR)\HatchSurplusProduction.sbr" \
	"$(INTDIR)\help.sbr" \
	"$(INTDIR)\HvSummary.sbr" \
	"$(INTDIR)\idcBPHR.sbr" \
	"$(INTDIR)\idcCeilings.sbr" \
	"$(INTDIR)\idcENH.sbr" \
	"$(INTDIR)\idcEV.sbr" \
	"$(INTDIR)\idcHRS.sbr" \
	"$(INTDIR)\idcIDL.sbr" \
	"$(INTDIR)\idcMR.sbr" \
	"$(INTDIR)\idcPNV.sbr" \
	"$(INTDIR)\implicit_base.sbr" \
	"$(INTDIR)\include.sbr" \
	"$(INTDIR)\init.sbr" \
	"$(INTDIR)\IOCrud.sbr" \
	"$(INTDIR)\log.sbr" \
	"$(INTDIR)\mapController.sbr" \
	"$(INTDIR)\mapObject.sbr" \
	"$(INTDIR)\monte_tokens.sbr" \
	"$(INTDIR)\MonteControl.sbr" \
	"$(INTDIR)\MonteDataItem.sbr" \
	"$(INTDIR)\MonteOutputItem.sbr" \
	"$(INTDIR)\MonteStockIntrfc.sbr" \
	"$(INTDIR)\MonteStockTracking.sbr" \
	"$(INTDIR)\MonteTrackingItem.sbr" \
	"$(INTDIR)\MultiCeilingPolicy.sbr" \
	"$(INTDIR)\NamedPtrVec.sbr" \
	"$(INTDIR)\NaturalProduction.sbr" \
	"$(INTDIR)\Parser.sbr" \
	"$(INTDIR)\parseutil.sbr" \
	"$(INTDIR)\Policy.sbr" \
	"$(INTDIR)\Production.sbr" \
	"$(INTDIR)\RandGen.sbr" \
	"$(INTDIR)\RandNorm.sbr" \
	"$(INTDIR)\Range.sbr" \
	"$(INTDIR)\ReadToken.sbr" \
	"$(INTDIR)\Sample.sbr" \
	"$(INTDIR)\simple_output.sbr" \
	"$(INTDIR)\Simulation.sbr" \
	"$(INTDIR)\State.sbr" \
	"$(INTDIR)\statistics.sbr" \
	"$(INTDIR)\Stock.sbr" \
	"$(INTDIR)\StockCalib.sbr" \
	"$(INTDIR)\StockConfig.sbr" \
	"$(INTDIR)\StockSummary.sbr" \
	"$(INTDIR)\String.sbr" \
	"$(INTDIR)\Strtools.sbr" \
	"$(INTDIR)\Token.sbr" \
	"$(INTDIR)\version.sbr" \
	"$(INTDIR)\ZasCalibration.sbr" \
	"$(INTDIR)\ZasDialogMedBPHR.sbr" \
	"$(INTDIR)\ZasDialogMedPNV.sbr" \
	"$(INTDIR)\ZasGraphMedMonteCarlo.sbr" \
	"$(INTDIR)\ZasGraphUpdateMed.sbr" \
	"$(INTDIR)\ZasMapMedCrispHarvest.sbr" \
	"$(INTDIR)\ZasMediatorFactory.sbr" \
	"$(INTDIR)\ZasMonteCarlo.sbr" \
	"$(INTDIR)\ZasTabDialogCeilings.sbr" \
	"$(INTDIR)\ZasTabDialogENH.sbr" \
	"$(INTDIR)\ZasTabDialogMedCeilings.sbr" \
	"$(INTDIR)\ZasTabDialogMedENH.sbr" \
	"$(INTDIR)\ZasTabDialogMedEV.sbr" \
	"$(INTDIR)\ZasTabDialogMedHRS.sbr" \
	"$(INTDIR)\ZasTabDialogMedIDL.sbr" \
	"$(INTDIR)\ZasTabDialogMedMR.sbr" \
	"$(INTDIR)\ZatCheckBoxGroup.sbr" \
	"$(INTDIR)\ZatDialogBase.sbr" \
	"$(INTDIR)\ZatDialogMedBase.sbr" \
	"$(INTDIR)\ZatEditSliderBase.sbr" \
	"$(INTDIR)\ZatEditSliderDouble.sbr" \
	"$(INTDIR)\ZatEditSliderLong.sbr" \
	"$(INTDIR)\ZatGraphDialog.sbr" \
	"$(INTDIR)\ZatGraphicPane.sbr" \
	"$(INTDIR)\ZatImplicitScroller.sbr" \
	"$(INTDIR)\ZatMapMediator.sbr" \
	"$(INTDIR)\ZatMapPane.sbr" \
	"$(INTDIR)\ZatMercatorTransform.sbr" \
	"$(INTDIR)\ZatPointTransform.sbr" \
	"$(INTDIR)\ZatRowColumnBox.sbr" \
	"$(INTDIR)\ZatTabDialog.sbr" \
	"$(INTDIR)\ZatTabDialogMed.sbr" \
	"$(INTDIR)\zcGM_YearAgeGraph.sbr" \
	"$(INTDIR)\zcGM_YearGraph.sbr" \
	"$(INTDIR)\zcGMF_AbundanceIndex.sbr" \
	"$(INTDIR)\zcGMF_CatchPreterm.sbr" \
	"$(INTDIR)\zcGMF_CatchTerminal.sbr" \
	"$(INTDIR)\zcGMF_CatchTotal.sbr" \
	"$(INTDIR)\zcGMF_InMortLegal.sbr" \
	"$(INTDIR)\zcGMF_InMortSublegal.sbr" \
	"$(INTDIR)\zcGMF_InMortTotal.sbr" \
	"$(INTDIR)\zcGMH_HarvestGraphs.sbr" \
	"$(INTDIR)\zcGMS_Abundance.sbr" \
	"$(INTDIR)\zcGMS_CatchGraphs.sbr" \
	"$(INTDIR)\zcGMS_CNRGraphs.sbr" \
	"$(INTDIR)\zcGMS_Escapement.sbr" \
	"$(INTDIR)\zcGMS_TrueTermRun.sbr" \
	"$(INTDIR)\zcGraphMediator.sbr" \
	"$(INTDIR)\zcMouseTool.sbr" \
	"$(INTDIR)\zcMouseToolCrisp2.sbr"

"$(OUTDIR)\crisp2.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=zvcntd.lib zipvntd.lib zh32vcsd.lib mtlg.lib uuid.lib ctl3d32s.lib\
 libcd.lib libcid.lib oldnames.lib kernel32.lib advapi32.lib user32.lib\
 gdi32.lib comdlg32.lib winspool.lib shell32.lib ole32.lib oleaut32.lib\
 odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)\crisphv3.pdb" /debug /machine:I386 /nodefaultlib\
 /out:"$(OUTDIR)\crisphv3.exe" 
LINK32_OBJS= \
	"$(INTDIR)\base_tokens.obj" \
	"$(INTDIR)\Bootstrap.obj" \
	"$(INTDIR)\c2main.obj" \
	"$(INTDIR)\Calendar.obj" \
	"$(INTDIR)\Calibrator.obj" \
	"$(INTDIR)\Ceiling.obj" \
	"$(INTDIR)\CeilingPolicy.obj" \
	"$(INTDIR)\clog.obj" \
	"$(INTDIR)\CNR.obj" \
	"$(INTDIR)\Cohort.obj" \
	"$(INTDIR)\command.obj" \
	"$(INTDIR)\Crisp2.res" \
	"$(INTDIR)\datFisheryCeilings.obj" \
	"$(INTDIR)\datIntDouble.obj" \
	"$(INTDIR)\debug.obj" \
	"$(INTDIR)\engine.obj" \
	"$(INTDIR)\Fishery.obj" \
	"$(INTDIR)\FisheryManagement.obj" \
	"$(INTDIR)\FisherySummary.obj" \
	"$(INTDIR)\FisheryTactics.obj" \
	"$(INTDIR)\FixedCombHarv.obj" \
	"$(INTDIR)\FixedEscapementPolicy.obj" \
	"$(INTDIR)\globals.obj" \
	"$(INTDIR)\GUI.obj" \
	"$(INTDIR)\Harvest.obj" \
	"$(INTDIR)\HarvestList.obj" \
	"$(INTDIR)\HarvestTactics.obj" \
	"$(INTDIR)\HatcheryProduction.obj" \
	"$(INTDIR)\HatchSurplusProduction.obj" \
	"$(INTDIR)\help.obj" \
	"$(INTDIR)\HvSummary.obj" \
	"$(INTDIR)\idcBPHR.obj" \
	"$(INTDIR)\idcCeilings.obj" \
	"$(INTDIR)\idcENH.obj" \
	"$(INTDIR)\idcEV.obj" \
	"$(INTDIR)\idcHRS.obj" \
	"$(INTDIR)\idcIDL.obj" \
	"$(INTDIR)\idcMR.obj" \
	"$(INTDIR)\idcPNV.obj" \
	"$(INTDIR)\implicit_base.obj" \
	"$(INTDIR)\include.obj" \
	"$(INTDIR)\init.obj" \
	"$(INTDIR)\IOCrud.obj" \
	"$(INTDIR)\log.obj" \
	"$(INTDIR)\mapController.obj" \
	"$(INTDIR)\mapObject.obj" \
	"$(INTDIR)\monte_tokens.obj" \
	"$(INTDIR)\MonteControl.obj" \
	"$(INTDIR)\MonteDataItem.obj" \
	"$(INTDIR)\MonteOutputItem.obj" \
	"$(INTDIR)\MonteStockIntrfc.obj" \
	"$(INTDIR)\MonteStockTracking.obj" \
	"$(INTDIR)\MonteTrackingItem.obj" \
	"$(INTDIR)\MultiCeilingPolicy.obj" \
	"$(INTDIR)\NamedPtrVec.obj" \
	"$(INTDIR)\NaturalProduction.obj" \
	"$(INTDIR)\Parser.obj" \
	"$(INTDIR)\parseutil.obj" \
	"$(INTDIR)\Policy.obj" \
	"$(INTDIR)\Production.obj" \
	"$(INTDIR)\RandGen.obj" \
	"$(INTDIR)\RandNorm.obj" \
	"$(INTDIR)\Range.obj" \
	"$(INTDIR)\ReadToken.obj" \
	"$(INTDIR)\Sample.obj" \
	"$(INTDIR)\simple_output.obj" \
	"$(INTDIR)\Simulation.obj" \
	"$(INTDIR)\State.obj" \
	"$(INTDIR)\statistics.obj" \
	"$(INTDIR)\Stock.obj" \
	"$(INTDIR)\StockCalib.obj" \
	"$(INTDIR)\StockConfig.obj" \
	"$(INTDIR)\StockSummary.obj" \
	"$(INTDIR)\String.obj" \
	"$(INTDIR)\Strtools.obj" \
	"$(INTDIR)\Token.obj" \
	"$(INTDIR)\version.obj" \
	"$(INTDIR)\ZasCalibration.obj" \
	"$(INTDIR)\ZasDialogMedBPHR.obj" \
	"$(INTDIR)\ZasDialogMedPNV.obj" \
	"$(INTDIR)\ZasGraphMedMonteCarlo.obj" \
	"$(INTDIR)\ZasGraphUpdateMed.obj" \
	"$(INTDIR)\ZasMapMedCrispHarvest.obj" \
	"$(INTDIR)\ZasMediatorFactory.obj" \
	"$(INTDIR)\ZasMonteCarlo.obj" \
	"$(INTDIR)\ZasTabDialogCeilings.obj" \
	"$(INTDIR)\ZasTabDialogENH.obj" \
	"$(INTDIR)\ZasTabDialogMedCeilings.obj" \
	"$(INTDIR)\ZasTabDialogMedENH.obj" \
	"$(INTDIR)\ZasTabDialogMedEV.obj" \
	"$(INTDIR)\ZasTabDialogMedHRS.obj" \
	"$(INTDIR)\ZasTabDialogMedIDL.obj" \
	"$(INTDIR)\ZasTabDialogMedMR.obj" \
	"$(INTDIR)\ZatCheckBoxGroup.obj" \
	"$(INTDIR)\ZatDialogBase.obj" \
	"$(INTDIR)\ZatDialogMedBase.obj" \
	"$(INTDIR)\ZatEditSliderBase.obj" \
	"$(INTDIR)\ZatEditSliderDouble.obj" \
	"$(INTDIR)\ZatEditSliderLong.obj" \
	"$(INTDIR)\ZatGraphDialog.obj" \
	"$(INTDIR)\ZatGraphicPane.obj" \
	"$(INTDIR)\ZatImplicitScroller.obj" \
	"$(INTDIR)\ZatMapMediator.obj" \
	"$(INTDIR)\ZatMapPane.obj" \
	"$(INTDIR)\ZatMercatorTransform.obj" \
	"$(INTDIR)\ZatPointTransform.obj" \
	"$(INTDIR)\ZatRowColumnBox.obj" \
	"$(INTDIR)\ZatTabDialog.obj" \
	"$(INTDIR)\ZatTabDialogMed.obj" \
	"$(INTDIR)\zcGM_YearAgeGraph.obj" \
	"$(INTDIR)\zcGM_YearGraph.obj" \
	"$(INTDIR)\zcGMF_AbundanceIndex.obj" \
	"$(INTDIR)\zcGMF_CatchPreterm.obj" \
	"$(INTDIR)\zcGMF_CatchTerminal.obj" \
	"$(INTDIR)\zcGMF_CatchTotal.obj" \
	"$(INTDIR)\zcGMF_InMortLegal.obj" \
	"$(INTDIR)\zcGMF_InMortSublegal.obj" \
	"$(INTDIR)\zcGMF_InMortTotal.obj" \
	"$(INTDIR)\zcGMH_HarvestGraphs.obj" \
	"$(INTDIR)\zcGMS_Abundance.obj" \
	"$(INTDIR)\zcGMS_CatchGraphs.obj" \
	"$(INTDIR)\zcGMS_CNRGraphs.obj" \
	"$(INTDIR)\zcGMS_Escapement.obj" \
	"$(INTDIR)\zcGMS_TrueTermRun.obj" \
	"$(INTDIR)\zcGraphMediator.obj" \
	"$(INTDIR)\zcMouseTool.obj" \
	"$(INTDIR)\zcMouseToolCrisp2.obj"

"$(OUTDIR)\crisphv3.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(CFG)" == "crisp2 - Win32 Release" || "$(CFG)" == "crisp2 - Win32 Debug"
SOURCE=.\base_tokens.cpp
DEP_CPP_BASE_=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	".\base_tokens.h"\
	".\ReadToken.h"\
	".\Strings.h"\
	".\token.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\base_tokens.obj"	"$(INTDIR)\base_tokens.sbr" : $(SOURCE)\
 $(DEP_CPP_BASE_) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\base_tokens.obj"	"$(INTDIR)\base_tokens.sbr" : $(SOURCE)\
 $(DEP_CPP_BASE_) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\Bootstrap.cpp
DEP_CPP_BOOTS=\
	".\Bool.h"\
	".\Bootstrap.h"\
	".\MonteDataItem.h"\
	".\RandGen.h"\
	".\sample.h"\
	".\SeedPod.h"\
	".\UniformInt.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Bootstrap.obj"	"$(INTDIR)\Bootstrap.sbr" : $(SOURCE)\
 $(DEP_CPP_BOOTS) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Bootstrap.obj"	"$(INTDIR)\Bootstrap.sbr" : $(SOURCE)\
 $(DEP_CPP_BOOTS) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\c2main.cpp
DEP_CPP_C2MAI=\
	"..\..\..\devtools\rogue\rw\bintree.h"\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\dlist.h"\
	"..\..\..\devtools\rogue\rw\dlistcol.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gqueue.h"\
	"..\..\..\devtools\rogue\rw\gstack.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stackcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\help\helph\helpapi.hpp"\
	"..\..\..\devtools\zapp\help\zhelp.hpp"\
	"..\..\..\devtools\zapp\intpack\zip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\ctrlpane.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\slot.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\strtable.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\tip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\treectrl.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\vis.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\visctrl.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\ddeclass.hpp"\
	"..\..\..\devtools\zapp\zapph\ddeclass.inl"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\AgeVec.h"\
	".\Args.h"\
	".\Bool.h"\
	".\c2main.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\GUI.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\init.h"\
	".\interfaceDataControl.h"\
	".\log.h"\
	".\mapConstants.h"\
	".\mapController.h"\
	".\mapObject.h"\
	".\mapPoint.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\Simulation.h"\
	".\smart_ptr.h"\
	".\smart_ptr.i"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\UI.h"\
	".\ZasGraphUpdateMed.h"\
	".\ZasMapMedCrispHarvest.h"\
	".\ZasMediatorFactory.h"\
	".\ZasMenuConst.h"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatDialogBase.h"\
	".\ZatDialogConstants.h"\
	".\ZatDialogMedBase.h"\
	".\ZatGraphDialog.h"\
	".\ZatGraphicPane.h"\
	".\ZatItem.h"\
	".\ZatMapMediator.h"\
	".\ZatMapPane.h"\
	".\ZatMercatorTransform.h"\
	".\ZatPointTransform.h"\
	".\ZatRowColumnBox.h"\
	".\zcGraphMediator.h"\
	".\zcMouseTool.h"\
	".\zcMouseToolCrisp2.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\c2main.obj" : $(SOURCE) $(DEP_CPP_C2MAI) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\c2main.obj"	"$(INTDIR)\c2main.sbr" : $(SOURCE) $(DEP_CPP_C2MAI)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Calendar.cpp
DEP_CPP_CALEN=\
	".\Calendar.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Calendar.obj"	"$(INTDIR)\Calendar.sbr" : $(SOURCE) $(DEP_CPP_CALEN)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Calendar.obj"	"$(INTDIR)\Calendar.sbr" : $(SOURCE) $(DEP_CPP_CALEN)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\Calibrator.cpp
DEP_CPP_CALIB=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Calibrator.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\IOCrud.h"\
	".\log.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\Stock.h"\
	".\StockCalib.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\strtools.h"\
	".\Summary.h"\
	".\tokens.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Calibrator.obj"	"$(INTDIR)\Calibrator.sbr" : $(SOURCE)\
 $(DEP_CPP_CALIB) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Calibrator.obj"	"$(INTDIR)\Calibrator.sbr" : $(SOURCE)\
 $(DEP_CPP_CALIB) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\Ceiling.cpp
DEP_CPP_CEILI=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\strtools.h"\
	".\Summary.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Ceiling.obj"	"$(INTDIR)\Ceiling.sbr" : $(SOURCE) $(DEP_CPP_CEILI)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Ceiling.obj"	"$(INTDIR)\Ceiling.sbr" : $(SOURCE) $(DEP_CPP_CEILI)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\CeilingPolicy.cpp
DEP_CPP_CEILIN=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CeilingPolicy.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Policy.h"\
	".\Summary.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\CeilingPolicy.obj"	"$(INTDIR)\CeilingPolicy.sbr" : $(SOURCE)\
 $(DEP_CPP_CEILIN) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\CeilingPolicy.obj"	"$(INTDIR)\CeilingPolicy.sbr" : $(SOURCE)\
 $(DEP_CPP_CEILIN) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\clog.cpp
DEP_CPP_CLOG_=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	".\Bool.h"\
	".\clog.h"\
	".\log.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\clog.obj"	"$(INTDIR)\clog.sbr" : $(SOURCE) $(DEP_CPP_CLOG_)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\clog.obj"	"$(INTDIR)\clog.sbr" : $(SOURCE) $(DEP_CPP_CLOG_)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\CNR.cpp
DEP_CPP_CNR_C=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\cnrVisitor.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\log.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Summary.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\CNR.obj"	"$(INTDIR)\CNR.sbr" : $(SOURCE) $(DEP_CPP_CNR_C)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\CNR.obj"	"$(INTDIR)\CNR.sbr" : $(SOURCE) $(DEP_CPP_CNR_C)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\Cohort.cpp
DEP_CPP_COHOR=\
	".\Cohort.h"\
	".\IEnum.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Cohort.obj"	"$(INTDIR)\Cohort.sbr" : $(SOURCE) $(DEP_CPP_COHOR)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Cohort.obj"	"$(INTDIR)\Cohort.sbr" : $(SOURCE) $(DEP_CPP_COHOR)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\command.cpp
DEP_CPP_COMMA=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	".\Bool.h"\
	".\command.h"\
	".\log.h"\
	".\tokens.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\command.obj"	"$(INTDIR)\command.sbr" : $(SOURCE) $(DEP_CPP_COMMA)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\command.obj"	"$(INTDIR)\command.sbr" : $(SOURCE) $(DEP_CPP_COMMA)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\Crisp2.rc
DEP_RSC_CRISP=\
	".\fish.bmp"\
	".\fopen.bmp"\
	".\fsave.bmp"\
	".\goob.bmp"\
	".\grid.bmp"\
	".\help.bmp"\
	".\hook.bmp"\
	".\icon1.ico"\
	".\map.bmp"\
	".\mapBoat.bmp"\
	".\mapBoat2.bmp"\
	".\mapFish.bmp"\
	".\mapFish2.bmp"\
	".\mhelp.bmp"\
	".\mouse.bmp"\
	".\print.bmp"\
	".\refresh.bmp"\
	".\run.bmp"\
	".\wand.bmp"\
	".\ZasMenuConst.h"\
	".\ZatDialogConstants.h"\
	

"$(INTDIR)\Crisp2.res" : $(SOURCE) $(DEP_RSC_CRISP) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


SOURCE=.\datFisheryCeilings.cpp
DEP_CPP_DATFI=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	".\datFisheryCeilings.h"\
	".\datIntDouble.h"\
	".\datTypes.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\datFisheryCeilings.obj" : $(SOURCE) $(DEP_CPP_DATFI) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\datFisheryCeilings.obj"	"$(INTDIR)\datFisheryCeilings.sbr" : \
$(SOURCE) $(DEP_CPP_DATFI) "$(INTDIR)"


!ENDIF 

SOURCE=.\datIntDouble.cpp
DEP_CPP_DATIN=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	".\datIntDouble.h"\
	".\datTypes.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\datIntDouble.obj" : $(SOURCE) $(DEP_CPP_DATIN) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\datIntDouble.obj"	"$(INTDIR)\datIntDouble.sbr" : $(SOURCE)\
 $(DEP_CPP_DATIN) "$(INTDIR)"


!ENDIF 

SOURCE=.\debug.cpp

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\debug.obj"	"$(INTDIR)\debug.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\debug.obj"	"$(INTDIR)\debug.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\engine.cpp
DEP_CPP_ENGIN=\
	"..\..\..\devtools\rogue\rw\bitref.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tbitvec.cc"\
	"..\..\..\devtools\rogue\rw\tbitvec.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisheryManagement.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\init.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Policy.h"\
	".\Production.h"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\engine.obj"	"$(INTDIR)\engine.sbr" : $(SOURCE) $(DEP_CPP_ENGIN)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\engine.obj"	"$(INTDIR)\engine.sbr" : $(SOURCE) $(DEP_CPP_ENGIN)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\Fishery.cpp
DEP_CPP_FISHE=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Fishery.obj"	"$(INTDIR)\Fishery.sbr" : $(SOURCE) $(DEP_CPP_FISHE)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Fishery.obj"	"$(INTDIR)\Fishery.sbr" : $(SOURCE) $(DEP_CPP_FISHE)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\FisheryManagement.cpp
DEP_CPP_FISHER=\
	"..\..\..\devtools\rogue\rw\bitref.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tbitvec.cc"\
	"..\..\..\devtools\rogue\rw\tbitvec.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CeilingPolicy.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisheryManagement.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedCombHarv.h"\
	".\FixedEscapementPolicy.h"\
	".\FixedEscStock.h"\
	".\FixedHarvestPolicy.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\log.h"\
	".\MultiCeilingPolicy.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Policy.h"\
	".\Production.h"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\FisheryManagement.obj"	"$(INTDIR)\FisheryManagement.sbr" : $(SOURCE)\
 $(DEP_CPP_FISHER) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\FisheryManagement.obj"	"$(INTDIR)\FisheryManagement.sbr" : $(SOURCE)\
 $(DEP_CPP_FISHER) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\FisherySummary.cpp
DEP_CPP_FISHERY=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Summary.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\FisherySummary.obj"	"$(INTDIR)\FisherySummary.sbr" : $(SOURCE)\
 $(DEP_CPP_FISHERY) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\FisherySummary.obj"	"$(INTDIR)\FisherySummary.sbr" : $(SOURCE)\
 $(DEP_CPP_FISHERY) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\FisheryTactics.cpp
DEP_CPP_FISHERYT=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\FisheryTactics.h"\
	".\IEnum.h"\
	".\Phase.h"\
	".\strtools.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\FisheryTactics.obj"	"$(INTDIR)\FisheryTactics.sbr" : $(SOURCE)\
 $(DEP_CPP_FISHERYT) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\FisheryTactics.obj"	"$(INTDIR)\FisheryTactics.sbr" : $(SOURCE)\
 $(DEP_CPP_FISHERYT) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\FixedCombHarv.cpp
DEP_CPP_FIXED=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedCombHarv.h"\
	".\FixedEscapementPolicy.h"\
	".\FixedEscStock.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Policy.h"\
	".\Production.h"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\FixedCombHarv.obj"	"$(INTDIR)\FixedCombHarv.sbr" : $(SOURCE)\
 $(DEP_CPP_FIXED) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\FixedCombHarv.obj"	"$(INTDIR)\FixedCombHarv.sbr" : $(SOURCE)\
 $(DEP_CPP_FIXED) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\FixedEscapementPolicy.cpp
DEP_CPP_FIXEDE=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscapementPolicy.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\log.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Policy.h"\
	".\Production.h"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\FixedEscapementPolicy.obj"	"$(INTDIR)\FixedEscapementPolicy.sbr" : \
$(SOURCE) $(DEP_CPP_FIXEDE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\FixedEscapementPolicy.obj"	"$(INTDIR)\FixedEscapementPolicy.sbr" : \
$(SOURCE) $(DEP_CPP_FIXEDE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\globals.cpp
DEP_CPP_GLOBA=\
	"..\..\..\devtools\rogue\rw\bitref.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tbitvec.cc"\
	"..\..\..\devtools\rogue\rw\tbitvec.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Calibrator.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisheryManagement.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Policy.h"\
	".\Production.h"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\tokens.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\globals.obj"	"$(INTDIR)\globals.sbr" : $(SOURCE) $(DEP_CPP_GLOBA)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\globals.obj"	"$(INTDIR)\globals.sbr" : $(SOURCE) $(DEP_CPP_GLOBA)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\GUI.cpp
DEP_CPP_GUI_C=\
	".\Args.h"\
	".\Bool.h"\
	".\GUI.h"\
	".\UI.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\GUI.obj"	"$(INTDIR)\GUI.sbr" : $(SOURCE) $(DEP_CPP_GUI_C)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\GUI.obj"	"$(INTDIR)\GUI.sbr" : $(SOURCE) $(DEP_CPP_GUI_C)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\Harvest.cpp
DEP_CPP_HARVE=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\log.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Harvest.obj"	"$(INTDIR)\Harvest.sbr" : $(SOURCE) $(DEP_CPP_HARVE)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Harvest.obj"	"$(INTDIR)\Harvest.sbr" : $(SOURCE) $(DEP_CPP_HARVE)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\HarvestList.cpp
DEP_CPP_HARVES=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Cohort.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\Phase.h"\
	".\Summary.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\HarvestList.obj"	"$(INTDIR)\HarvestList.sbr" : $(SOURCE)\
 $(DEP_CPP_HARVES) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\HarvestList.obj"	"$(INTDIR)\HarvestList.sbr" : $(SOURCE)\
 $(DEP_CPP_HARVES) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\HarvestTactics.cpp
DEP_CPP_HARVEST=\
	".\Calendar.h"\
	".\HarvestTactics.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\HarvestTactics.obj"	"$(INTDIR)\HarvestTactics.sbr" : $(SOURCE)\
 $(DEP_CPP_HARVEST) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\HarvestTactics.obj"	"$(INTDIR)\HarvestTactics.sbr" : $(SOURCE)\
 $(DEP_CPP_HARVEST) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\HatcheryProduction.cpp
DEP_CPP_HATCH=\
	".\Calendar.h"\
	".\HatcheryProduction.h"\
	".\Production.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\HatcheryProduction.obj"	"$(INTDIR)\HatcheryProduction.sbr" : \
$(SOURCE) $(DEP_CPP_HATCH) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\HatcheryProduction.obj"	"$(INTDIR)\HatcheryProduction.sbr" : \
$(SOURCE) $(DEP_CPP_HATCH) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\HatchSurplusProduction.cpp
DEP_CPP_HATCHS=\
	".\Bool.h"\
	".\Calendar.h"\
	".\HatcheryProduction.h"\
	".\HatchSurplusProduction.h"\
	".\NaturalProduction.h"\
	".\NonNeg.h"\
	".\Production.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\HatchSurplusProduction.obj"	"$(INTDIR)\HatchSurplusProduction.sbr" :\
 $(SOURCE) $(DEP_CPP_HATCHS) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\HatchSurplusProduction.obj"	"$(INTDIR)\HatchSurplusProduction.sbr" :\
 $(SOURCE) $(DEP_CPP_HATCHS) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\help.c

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\help.obj"	"$(INTDIR)\help.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\help.obj"	"$(INTDIR)\help.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\HvSummary.cpp
DEP_CPP_HVSUM=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Cohort.h"\
	".\Harvest.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\Phase.h"\
	".\strtools.h"\
	".\Summary.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\HvSummary.obj"	"$(INTDIR)\HvSummary.sbr" : $(SOURCE)\
 $(DEP_CPP_HVSUM) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\HvSummary.obj"	"$(INTDIR)\HvSummary.sbr" : $(SOURCE)\
 $(DEP_CPP_HVSUM) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\idcBPHR.cpp
DEP_CPP_IDCBP=\
	"..\..\..\devtools\rogue\rw\bintree.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gqueue.h"\
	"..\..\..\devtools\rogue\rw\gstack.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\datHarvestBPHR.h"\
	".\datIntDouble.h"\
	".\datTypes.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\idcBPHR.h"\
	".\IEnum.h"\
	".\interfaceDataControl.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\idcBPHR.obj" : $(SOURCE) $(DEP_CPP_IDCBP) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\idcBPHR.obj"	"$(INTDIR)\idcBPHR.sbr" : $(SOURCE) $(DEP_CPP_IDCBP)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\idcCeilings.cpp
DEP_CPP_IDCCE=\
	"..\..\..\devtools\rogue\rw\bintree.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gqueue.h"\
	"..\..\..\devtools\rogue\rw\gstack.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\datFisheryCeilings.h"\
	".\datIntDouble.h"\
	".\datTypes.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\idcCeilings.h"\
	".\IEnum.h"\
	".\interfaceDataControl.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\idcCeilings.obj" : $(SOURCE) $(DEP_CPP_IDCCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\idcCeilings.obj"	"$(INTDIR)\idcCeilings.sbr" : $(SOURCE)\
 $(DEP_CPP_IDCCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\idcENH.cpp
DEP_CPP_IDCEN=\
	"..\..\..\devtools\rogue\rw\bintree.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gqueue.h"\
	"..\..\..\devtools\rogue\rw\gstack.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\datIntDouble.h"\
	".\datStockENH.h"\
	".\datTypes.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\idcENH.h"\
	".\IEnum.h"\
	".\interfaceDataControl.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\idcENH.obj" : $(SOURCE) $(DEP_CPP_IDCEN) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\idcENH.obj"	"$(INTDIR)\idcENH.sbr" : $(SOURCE) $(DEP_CPP_IDCEN)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\idcEV.cpp
DEP_CPP_IDCEV=\
	"..\..\..\devtools\rogue\rw\bintree.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gqueue.h"\
	"..\..\..\devtools\rogue\rw\gstack.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\datIntDouble.h"\
	".\datStockEV.h"\
	".\datTypes.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\idcEV.h"\
	".\IEnum.h"\
	".\interfaceDataControl.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\idcEV.obj" : $(SOURCE) $(DEP_CPP_IDCEV) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\idcEV.obj"	"$(INTDIR)\idcEV.sbr" : $(SOURCE) $(DEP_CPP_IDCEV)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\idcHRS.cpp
DEP_CPP_IDCHR=\
	"..\..\..\devtools\rogue\rw\bintree.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gqueue.h"\
	"..\..\..\devtools\rogue\rw\gstack.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\datHarvestHRS.h"\
	".\datIntDouble.h"\
	".\datTypes.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\idcHRS.h"\
	".\IEnum.h"\
	".\interfaceDataControl.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\idcHRS.obj" : $(SOURCE) $(DEP_CPP_IDCHR) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\idcHRS.obj"	"$(INTDIR)\idcHRS.sbr" : $(SOURCE) $(DEP_CPP_IDCHR)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\idcIDL.cpp
DEP_CPP_IDCID=\
	"..\..\..\devtools\rogue\rw\bintree.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gqueue.h"\
	"..\..\..\devtools\rogue\rw\gstack.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\datIntDouble.h"\
	".\datStockIDL.h"\
	".\datTypes.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\idcIDL.h"\
	".\IEnum.h"\
	".\interfaceDataControl.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\idcIDL.obj" : $(SOURCE) $(DEP_CPP_IDCID) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\idcIDL.obj"	"$(INTDIR)\idcIDL.sbr" : $(SOURCE) $(DEP_CPP_IDCID)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\idcMR.cpp
DEP_CPP_IDCMR=\
	"..\..\..\devtools\rogue\rw\bintree.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gqueue.h"\
	"..\..\..\devtools\rogue\rw\gstack.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\datIntDouble.h"\
	".\datStockMR.h"\
	".\datTypes.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\idcMR.h"\
	".\IEnum.h"\
	".\interfaceDataControl.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\idcMR.obj" : $(SOURCE) $(DEP_CPP_IDCMR) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\idcMR.obj"	"$(INTDIR)\idcMR.sbr" : $(SOURCE) $(DEP_CPP_IDCMR)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\idcPNV.cpp
DEP_CPP_IDCPN=\
	"..\..\..\devtools\rogue\rw\bintree.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gqueue.h"\
	"..\..\..\devtools\rogue\rw\gstack.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\datFisheryPNV.h"\
	".\datIntDouble.h"\
	".\datTypes.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\idcPNV.h"\
	".\IEnum.h"\
	".\interfaceDataControl.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\idcPNV.obj" : $(SOURCE) $(DEP_CPP_IDCPN) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\idcPNV.obj"	"$(INTDIR)\idcPNV.sbr" : $(SOURCE) $(DEP_CPP_IDCPN)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\implicit_base.cpp
DEP_CPP_IMPLI=\
	".\implicit_base.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\implicit_base.obj" : $(SOURCE) $(DEP_CPP_IMPLI) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\implicit_base.obj"	"$(INTDIR)\implicit_base.sbr" : $(SOURCE)\
 $(DEP_CPP_IMPLI) "$(INTDIR)"


!ENDIF 

SOURCE=.\include.cpp
DEP_CPP_INCLU=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	".\Bool.h"\
	".\include.h"\
	".\log.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\include.obj"	"$(INTDIR)\include.sbr" : $(SOURCE) $(DEP_CPP_INCLU)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\include.obj"	"$(INTDIR)\include.sbr" : $(SOURCE) $(DEP_CPP_INCLU)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\init.cpp
DEP_CPP_INIT_=\
	"..\..\..\devtools\rogue\rw\bitref.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tbitvec.cc"\
	"..\..\..\devtools\rogue\rw\tbitvec.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	".\AgeVec.h"\
	".\Args.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Calibrator.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisheryManagement.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\IOCrud.h"\
	".\MonteControl.h"\
	".\MonteDataItem.h"\
	".\MonteOutputItem.h"\
	".\MonteTrackingItem.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Policy.h"\
	".\Production.h"\
	".\RandGen.h"\
	".\sample.h"\
	".\SeedPod.h"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\tokens.h"\
	".\UI.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\init.obj"	"$(INTDIR)\init.sbr" : $(SOURCE) $(DEP_CPP_INIT_)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\init.obj"	"$(INTDIR)\init.sbr" : $(SOURCE) $(DEP_CPP_INIT_)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\IOCrud.cpp
DEP_CPP_IOCRU=\
	"..\..\..\devtools\rogue\rw\bitref.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tbitvec.cc"\
	"..\..\..\devtools\rogue\rw\tbitvec.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Bootstrap.h"\
	".\Calendar.h"\
	".\Calibrator.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\command.h"\
	".\dir.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisheryManagement.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HatcheryProduction.h"\
	".\HatchSurplusProduction.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\include.h"\
	".\IOCrud.h"\
	".\log.h"\
	".\MonteControl.h"\
	".\MonteDataItem.h"\
	".\MonteOutputItem.h"\
	".\MonteStockIntrfc.h"\
	".\MonteStockTracking.h"\
	".\MonteTrackingItem.h"\
	".\NamedPtrVec.h"\
	".\NaturalProduction.h"\
	".\parseutil.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Policy.h"\
	".\Production.h"\
	".\RandGen.h"\
	".\RandNorm.h"\
	".\sample.h"\
	".\SeedPod.h"\
	".\statistics.h"\
	".\Stochastic.h"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\strtools.h"\
	".\Summary.h"\
	".\tokens.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\IOCrud.obj"	"$(INTDIR)\IOCrud.sbr" : $(SOURCE) $(DEP_CPP_IOCRU)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\IOCrud.obj"	"$(INTDIR)\IOCrud.sbr" : $(SOURCE) $(DEP_CPP_IOCRU)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\log.cpp
DEP_CPP_LOG_C=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	".\Bool.h"\
	".\log.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\log.obj"	"$(INTDIR)\log.sbr" : $(SOURCE) $(DEP_CPP_LOG_C)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\log.obj"	"$(INTDIR)\log.sbr" : $(SOURCE) $(DEP_CPP_LOG_C)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\mapController.cpp
DEP_CPP_MAPCO=\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\dlist.h"\
	"..\..\..\devtools\rogue\rw\dlistcol.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stackcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\mapConstants.h"\
	".\mapController.h"\
	".\mapObject.h"\
	".\mapPoint.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\mapController.obj" : $(SOURCE) $(DEP_CPP_MAPCO) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\mapController.obj"	"$(INTDIR)\mapController.sbr" : $(SOURCE)\
 $(DEP_CPP_MAPCO) "$(INTDIR)"


!ENDIF 

SOURCE=.\mapObject.cpp
DEP_CPP_MAPOB=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\dlist.h"\
	"..\..\..\devtools\rogue\rw\dlistcol.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stackcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	".\mapObject.h"\
	".\mapPoint.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\mapObject.obj" : $(SOURCE) $(DEP_CPP_MAPOB) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\mapObject.obj"	"$(INTDIR)\mapObject.sbr" : $(SOURCE)\
 $(DEP_CPP_MAPOB) "$(INTDIR)"


!ENDIF 

SOURCE=.\monte_tokens.cpp
DEP_CPP_MONTE=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	".\AgeVec.h"\
	".\base_tokens.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Cohort.h"\
	".\FixedEscStock.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\monte_tokens.h"\
	".\MonteControl.h"\
	".\MonteDataItem.h"\
	".\MonteOutputItem.h"\
	".\MonteStockIntrfc.h"\
	".\MonteStockTracking.h"\
	".\MonteTrackingItem.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Production.h"\
	".\RandGen.h"\
	".\ReadToken.h"\
	".\sample.h"\
	".\SeedPod.h"\
	".\State.h"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Strings.h"\
	".\Summary.h"\
	".\token.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\monte_tokens.obj"	"$(INTDIR)\monte_tokens.sbr" : $(SOURCE)\
 $(DEP_CPP_MONTE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\monte_tokens.obj"	"$(INTDIR)\monte_tokens.sbr" : $(SOURCE)\
 $(DEP_CPP_MONTE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\MonteControl.cpp
DEP_CPP_MONTEC=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Bootstrap.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\log.h"\
	".\MonteControl.h"\
	".\MonteDataItem.h"\
	".\MonteOutputItem.h"\
	".\MonteStockIntrfc.h"\
	".\MonteStockTracking.h"\
	".\MonteTrackingItem.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\RandGen.h"\
	".\sample.h"\
	".\SeedPod.h"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\MonteControl.obj"	"$(INTDIR)\MonteControl.sbr" : $(SOURCE)\
 $(DEP_CPP_MONTEC) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\MonteControl.obj"	"$(INTDIR)\MonteControl.sbr" : $(SOURCE)\
 $(DEP_CPP_MONTEC) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\MonteDataItem.cpp
DEP_CPP_MONTED=\
	".\MonteDataItem.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\MonteDataItem.obj"	"$(INTDIR)\MonteDataItem.sbr" : $(SOURCE)\
 $(DEP_CPP_MONTED) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\MonteDataItem.obj"	"$(INTDIR)\MonteDataItem.sbr" : $(SOURCE)\
 $(DEP_CPP_MONTED) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\MonteOutputItem.cpp
DEP_CPP_MONTEO=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\log.h"\
	".\MonteDataItem.h"\
	".\MonteOutputItem.h"\
	".\MonteStockIntrfc.h"\
	".\MonteStockTracking.h"\
	".\MonteTrackingItem.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\statistics.h"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\tokens.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\MonteOutputItem.obj"	"$(INTDIR)\MonteOutputItem.sbr" : $(SOURCE)\
 $(DEP_CPP_MONTEO) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\MonteOutputItem.obj"	"$(INTDIR)\MonteOutputItem.sbr" : $(SOURCE)\
 $(DEP_CPP_MONTEO) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\MonteStockIntrfc.cpp
DEP_CPP_MONTES=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Bootstrap.h"\
	".\Calendar.h"\
	".\Cohort.h"\
	".\FixedEscStock.h"\
	".\IEnum.h"\
	".\log.h"\
	".\MonteDataItem.h"\
	".\MonteStockIntrfc.h"\
	".\MonteStockTracking.h"\
	".\MonteTrackingItem.h"\
	".\RandGen.h"\
	".\RandNorm.h"\
	".\sample.h"\
	".\SeedPod.h"\
	".\Stochastic.h"\
	".\StockConfig.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\MonteStockIntrfc.obj"	"$(INTDIR)\MonteStockIntrfc.sbr" : $(SOURCE)\
 $(DEP_CPP_MONTES) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\MonteStockIntrfc.obj"	"$(INTDIR)\MonteStockIntrfc.sbr" : $(SOURCE)\
 $(DEP_CPP_MONTES) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\MonteStockTracking.cpp
DEP_CPP_MONTEST=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Cohort.h"\
	".\IEnum.h"\
	".\MonteDataItem.h"\
	".\MonteStockTracking.h"\
	".\MonteTrackingItem.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\MonteStockTracking.obj"	"$(INTDIR)\MonteStockTracking.sbr" : \
$(SOURCE) $(DEP_CPP_MONTEST) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\MonteStockTracking.obj"	"$(INTDIR)\MonteStockTracking.sbr" : \
$(SOURCE) $(DEP_CPP_MONTEST) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\MonteTrackingItem.cpp
DEP_CPP_MONTET=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	".\Bool.h"\
	".\MonteDataItem.h"\
	".\MonteTrackingItem.h"\
	".\strtools.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\MonteTrackingItem.obj"	"$(INTDIR)\MonteTrackingItem.sbr" : $(SOURCE)\
 $(DEP_CPP_MONTET) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\MonteTrackingItem.obj"	"$(INTDIR)\MonteTrackingItem.sbr" : $(SOURCE)\
 $(DEP_CPP_MONTET) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\MultiCeilingPolicy.cpp
DEP_CPP_MULTI=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\MultiCeilingPolicy.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Policy.h"\
	".\Production.h"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\MultiCeilingPolicy.obj"	"$(INTDIR)\MultiCeilingPolicy.sbr" : \
$(SOURCE) $(DEP_CPP_MULTI) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\MultiCeilingPolicy.obj"	"$(INTDIR)\MultiCeilingPolicy.sbr" : \
$(SOURCE) $(DEP_CPP_MULTI) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\NamedPtrVec.cpp
DEP_CPP_NAMED=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	".\Bool.h"\
	".\NamedPtrVec.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\NamedPtrVec.obj" : $(SOURCE) $(DEP_CPP_NAMED) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\NamedPtrVec.obj"	"$(INTDIR)\NamedPtrVec.sbr" : $(SOURCE)\
 $(DEP_CPP_NAMED) "$(INTDIR)"


!ENDIF 

SOURCE=.\NaturalProduction.cpp
DEP_CPP_NATUR=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Cohort.h"\
	".\FixedEscStock.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\NaturalProduction.h"\
	".\Phase.h"\
	".\Production.h"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\NaturalProduction.obj"	"$(INTDIR)\NaturalProduction.sbr" : $(SOURCE)\
 $(DEP_CPP_NATUR) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\NaturalProduction.obj"	"$(INTDIR)\NaturalProduction.sbr" : $(SOURCE)\
 $(DEP_CPP_NATUR) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\Parser.cpp
DEP_CPP_PARSE=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tstack.h"\
	"..\..\..\devtools\rogue\rw\tvdlist.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvdlist.cc"\
	"..\..\..\devtools\rogue\rw\xvdlist.h"\
	".\Parser.h"\
	".\State.h"\
	".\Strings.h"\
	".\token.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Parser.obj"	"$(INTDIR)\Parser.sbr" : $(SOURCE) $(DEP_CPP_PARSE)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Parser.obj"	"$(INTDIR)\Parser.sbr" : $(SOURCE) $(DEP_CPP_PARSE)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\parseutil.cpp
DEP_CPP_PARSEU=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	".\Bool.h"\
	".\command.h"\
	".\dir.h"\
	".\include.h"\
	".\log.h"\
	".\parseutil.h"\
	".\tokens.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\parseutil.obj" : $(SOURCE) $(DEP_CPP_PARSEU) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\parseutil.obj"	"$(INTDIR)\parseutil.sbr" : $(SOURCE)\
 $(DEP_CPP_PARSEU) "$(INTDIR)"


!ENDIF 

SOURCE=.\Policy.cpp
DEP_CPP_POLIC=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Policy.h"\
	".\Summary.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Policy.obj"	"$(INTDIR)\Policy.sbr" : $(SOURCE) $(DEP_CPP_POLIC)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Policy.obj"	"$(INTDIR)\Policy.sbr" : $(SOURCE) $(DEP_CPP_POLIC)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\Production.cpp
DEP_CPP_PRODU=\
	".\Calendar.h"\
	".\Production.h"\
	".\strtools.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Production.obj"	"$(INTDIR)\Production.sbr" : $(SOURCE)\
 $(DEP_CPP_PRODU) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Production.obj"	"$(INTDIR)\Production.sbr" : $(SOURCE)\
 $(DEP_CPP_PRODU) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\RandGen.cpp
DEP_CPP_RANDG=\
	".\RandGen.h"\
	".\sample.h"\
	".\SeedPod.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\RandGen.obj"	"$(INTDIR)\RandGen.sbr" : $(SOURCE) $(DEP_CPP_RANDG)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\RandGen.obj"	"$(INTDIR)\RandGen.sbr" : $(SOURCE) $(DEP_CPP_RANDG)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\RandNorm.cpp
DEP_CPP_RANDN=\
	".\RandGen.h"\
	".\RandNorm.h"\
	".\sample.h"\
	".\SeedPod.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\RandNorm.obj"	"$(INTDIR)\RandNorm.sbr" : $(SOURCE) $(DEP_CPP_RANDN)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\RandNorm.obj"	"$(INTDIR)\RandNorm.sbr" : $(SOURCE) $(DEP_CPP_RANDN)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\Range.cpp
DEP_CPP_RANGE=\
	".\Range.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\Range.obj" : $(SOURCE) $(DEP_CPP_RANGE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\Range.obj"	"$(INTDIR)\Range.sbr" : $(SOURCE) $(DEP_CPP_RANGE)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\ReadToken.cpp
DEP_CPP_READT=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	".\ReadToken.h"\
	".\Strings.h"\
	".\token.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\ReadToken.obj" : $(SOURCE) $(DEP_CPP_READT) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\ReadToken.obj"	"$(INTDIR)\ReadToken.sbr" : $(SOURCE)\
 $(DEP_CPP_READT) "$(INTDIR)"


!ENDIF 

SOURCE=.\Sample.cpp
DEP_CPP_SAMPL=\
	".\sample.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\Sample.obj" : $(SOURCE) $(DEP_CPP_SAMPL) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\Sample.obj"	"$(INTDIR)\Sample.sbr" : $(SOURCE) $(DEP_CPP_SAMPL)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\simple_output.cpp
DEP_CPP_SIMPL=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\IOCrud.h"\
	".\log.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\tokens.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\simple_output.obj"	"$(INTDIR)\simple_output.sbr" : $(SOURCE)\
 $(DEP_CPP_SIMPL) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\simple_output.obj"	"$(INTDIR)\simple_output.sbr" : $(SOURCE)\
 $(DEP_CPP_SIMPL) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\Simulation.cpp
DEP_CPP_SIMUL=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Calibrator.h"\
	".\Cohort.h"\
	".\FixedEscStock.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\MonteControl.h"\
	".\MonteDataItem.h"\
	".\MonteOutputItem.h"\
	".\MonteTrackingItem.h"\
	".\Phase.h"\
	".\Production.h"\
	".\RandGen.h"\
	".\sample.h"\
	".\SeedPod.h"\
	".\Simulation.h"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\tokens.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Simulation.obj"	"$(INTDIR)\Simulation.sbr" : $(SOURCE)\
 $(DEP_CPP_SIMUL) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Simulation.obj"	"$(INTDIR)\Simulation.sbr" : $(SOURCE)\
 $(DEP_CPP_SIMUL) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\State.cpp
DEP_CPP_STATE=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tstack.h"\
	"..\..\..\devtools\rogue\rw\tvdlist.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvdlist.cc"\
	"..\..\..\devtools\rogue\rw\xvdlist.h"\
	".\Parser.h"\
	".\State.h"\
	".\Strings.h"\
	".\token.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\State.obj"	"$(INTDIR)\State.sbr" : $(SOURCE) $(DEP_CPP_STATE)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\State.obj"	"$(INTDIR)\State.sbr" : $(SOURCE) $(DEP_CPP_STATE)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\statistics.cpp

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\statistics.obj"	"$(INTDIR)\statistics.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\statistics.obj"	"$(INTDIR)\statistics.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\Stock.cpp
DEP_CPP_STOCK=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\log.h"\
	".\MonteDataItem.h"\
	".\MonteStockIntrfc.h"\
	".\MonteStockTracking.h"\
	".\MonteTrackingItem.h"\
	".\NonNeg.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Stock.obj"	"$(INTDIR)\Stock.sbr" : $(SOURCE) $(DEP_CPP_STOCK)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Stock.obj"	"$(INTDIR)\Stock.sbr" : $(SOURCE) $(DEP_CPP_STOCK)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\StockCalib.cpp
DEP_CPP_STOCKC=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Calibrator.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\log.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\Stock.h"\
	".\StockCalib.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\tokens.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\StockCalib.obj"	"$(INTDIR)\StockCalib.sbr" : $(SOURCE)\
 $(DEP_CPP_STOCKC) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\StockCalib.obj"	"$(INTDIR)\StockCalib.sbr" : $(SOURCE)\
 $(DEP_CPP_STOCKC) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\StockConfig.cpp
DEP_CPP_STOCKCO=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Cohort.h"\
	".\FixedEscStock.h"\
	".\IEnum.h"\
	".\log.h"\
	".\StockConfig.h"\
	".\strtools.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\StockConfig.obj"	"$(INTDIR)\StockConfig.sbr" : $(SOURCE)\
 $(DEP_CPP_STOCKCO) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\StockConfig.obj"	"$(INTDIR)\StockConfig.sbr" : $(SOURCE)\
 $(DEP_CPP_STOCKCO) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\StockSummary.cpp
DEP_CPP_STOCKS=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Cohort.h"\
	".\FixedEscStock.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\Phase.h"\
	".\Production.h"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockSummary.h"\
	".\strtools.h"\
	".\Summary.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\StockSummary.obj"	"$(INTDIR)\StockSummary.sbr" : $(SOURCE)\
 $(DEP_CPP_STOCKS) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\StockSummary.obj"	"$(INTDIR)\StockSummary.sbr" : $(SOURCE)\
 $(DEP_CPP_STOCKS) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\String.cpp
DEP_CPP_STRIN=\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	".\Bool.h"\
	".\Strings.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\String.obj"	"$(INTDIR)\String.sbr" : $(SOURCE) $(DEP_CPP_STRIN)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\String.obj"	"$(INTDIR)\String.sbr" : $(SOURCE) $(DEP_CPP_STRIN)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\Strtools.cpp
DEP_CPP_STRTO=\
	".\strtools.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\Strtools.obj" : $(SOURCE) $(DEP_CPP_STRTO) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\Strtools.obj"	"$(INTDIR)\Strtools.sbr" : $(SOURCE) $(DEP_CPP_STRTO)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Token.cpp
DEP_CPP_TOKEN=\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tstack.h"\
	"..\..\..\devtools\rogue\rw\tvdlist.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvdlist.cc"\
	"..\..\..\devtools\rogue\rw\xvdlist.h"\
	".\Parser.h"\
	".\Strings.h"\
	".\token.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\Token.obj" : $(SOURCE) $(DEP_CPP_TOKEN) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\Token.obj"	"$(INTDIR)\Token.sbr" : $(SOURCE) $(DEP_CPP_TOKEN)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\version.cpp

!IF  "$(CFG)" == "crisp2 - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /Ox /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\version.obj"	"$(INTDIR)\version.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"

CPP_SWITCHES=/nologo /G3 /ML /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D\
 RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\crisp2.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\version.obj"	"$(INTDIR)\version.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\ZasCalibration.cpp
DEP_CPP_ZASCA=\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\intpack\zip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\ctrlpane.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\slot.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\strtable.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\tip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\treectrl.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\vis.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\visctrl.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Calibrator.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\Simulation.h"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\tokens.h"\
	".\ZasCalibration.h"\
	".\ZatDefines.h"\
	".\ZatDialogConstants.h"\
	".\ZatEditSliderBase.h"\
	".\ZatEditSliderDouble.h"\
	".\ZatEditSliderLong.h"\
	".\ZatImConScroller.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\ZasCalibration.obj" : $(SOURCE) $(DEP_CPP_ZASCA) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\ZasCalibration.obj"	"$(INTDIR)\ZasCalibration.sbr" : $(SOURCE)\
 $(DEP_CPP_ZASCA) "$(INTDIR)"


!ENDIF 

SOURCE=.\ZasDialogMedBPHR.cpp
DEP_CPP_ZASDI=\
	"..\..\..\devtools\rogue\rw\bintree.h"\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gqueue.h"\
	"..\..\..\devtools\rogue\rw\gstack.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\help\helph\helpapi.hpp"\
	"..\..\..\devtools\zapp\help\zhelp.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\ddeclass.hpp"\
	"..\..\..\devtools\zapp\zapph\ddeclass.inl"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\datHarvestBPHR.h"\
	".\datIntDouble.h"\
	".\datTypes.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\idcBPHR.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\interfaceDataControl.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\smart_ptr.h"\
	".\smart_ptr.i"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\ZasDialogMedBPHR.h"\
	".\ZatCheckBoxGroup.h"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatDialogBase.h"\
	".\ZatDialogMedBase.h"\
	".\ZatEditSliderBase.h"\
	".\ZatEditSliderDouble.h"\
	".\ZatImConScroller.h"\
	".\ZatItem.h"\
	".\ZatRowColumnBox.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\ZasDialogMedBPHR.obj" : $(SOURCE) $(DEP_CPP_ZASDI) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\ZasDialogMedBPHR.obj"	"$(INTDIR)\ZasDialogMedBPHR.sbr" : $(SOURCE)\
 $(DEP_CPP_ZASDI) "$(INTDIR)"


!ENDIF 

SOURCE=.\ZasDialogMedPNV.cpp
DEP_CPP_ZASDIA=\
	"..\..\..\devtools\rogue\rw\bintree.h"\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gqueue.h"\
	"..\..\..\devtools\rogue\rw\gstack.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\help\helph\helpapi.hpp"\
	"..\..\..\devtools\zapp\help\zhelp.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\ddeclass.hpp"\
	"..\..\..\devtools\zapp\zapph\ddeclass.inl"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\datFisheryPNV.h"\
	".\datIntDouble.h"\
	".\datTypes.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\idcPNV.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\interfaceDataControl.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\smart_ptr.h"\
	".\smart_ptr.i"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\ZasDialogMedPNV.h"\
	".\ZatCheckBoxGroup.h"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatDialogBase.h"\
	".\ZatDialogMedBase.h"\
	".\ZatEditSliderBase.h"\
	".\ZatEditSliderDouble.h"\
	".\ZatImConScroller.h"\
	".\ZatItem.h"\
	".\ZatRowColumnBox.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\ZasDialogMedPNV.obj" : $(SOURCE) $(DEP_CPP_ZASDIA) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\ZasDialogMedPNV.obj"	"$(INTDIR)\ZasDialogMedPNV.sbr" : $(SOURCE)\
 $(DEP_CPP_ZASDIA) "$(INTDIR)"


!ENDIF 

SOURCE=.\ZasGraphMedMonteCarlo.cpp
DEP_CPP_ZASGR=\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\intpack\zip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\ctrlpane.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\slot.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\strtable.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\tip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\treectrl.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\vis.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\visctrl.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\MonteControl.h"\
	".\MonteDataItem.h"\
	".\MonteOutputItem.h"\
	".\MonteStockIntrfc.h"\
	".\MonteStockTracking.h"\
	".\MonteTrackingItem.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\RandGen.h"\
	".\sample.h"\
	".\SeedPod.h"\
	".\Simulation.h"\
	".\smart_ptr.h"\
	".\smart_ptr.i"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\ZasGraphMedMonteCarlo.h"\
	".\ZasGraphUpdateMed.h"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatDialogConstants.h"\
	".\ZatGraphDialog.h"\
	".\ZatGraphicPane.h"\
	".\ZatItem.h"\
	".\ZatRowColumnBox.h"\
	".\zcGM_YearGraph.h"\
	".\zcGraphMediator.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\ZasGraphMedMonteCarlo.obj" : $(SOURCE) $(DEP_CPP_ZASGR) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\ZasGraphMedMonteCarlo.obj"	"$(INTDIR)\ZasGraphMedMonteCarlo.sbr" : \
$(SOURCE) $(DEP_CPP_ZASGR) "$(INTDIR)"


!ENDIF 

SOURCE=.\ZasGraphUpdateMed.cpp
DEP_CPP_ZASGRA=\
	".\implicit.h"\
	".\implicit_base.h"\
	".\smart_ptr.h"\
	".\smart_ptr.i"\
	".\ZasGraphUpdateMed.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\ZasGraphUpdateMed.obj" : $(SOURCE) $(DEP_CPP_ZASGRA) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\ZasGraphUpdateMed.obj"	"$(INTDIR)\ZasGraphUpdateMed.sbr" : $(SOURCE)\
 $(DEP_CPP_ZASGRA) "$(INTDIR)"


!ENDIF 

SOURCE=.\ZasMapMedCrispHarvest.cpp
DEP_CPP_ZASMA=\
	"..\..\..\devtools\rogue\rw\bintree.h"\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\dlist.h"\
	"..\..\..\devtools\rogue\rw\dlistcol.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gqueue.h"\
	"..\..\..\devtools\rogue\rw\gstack.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stackcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\datHarvestBPHR.h"\
	".\datIntDouble.h"\
	".\datTypes.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\idcBPHR.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\interfaceDataControl.h"\
	".\mapConstants.h"\
	".\mapController.h"\
	".\mapObject.h"\
	".\mapPoint.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\ZasMapMedCrispHarvest.h"\
	".\ZasMenuConst.h"\
	".\ZatMapMediator.h"\
	".\ZatMapPane.h"\
	".\ZatMercatorTransform.h"\
	".\ZatPointTransform.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\ZasMapMedCrispHarvest.obj" : $(SOURCE) $(DEP_CPP_ZASMA) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\ZasMapMedCrispHarvest.obj"	"$(INTDIR)\ZasMapMedCrispHarvest.sbr" : \
$(SOURCE) $(DEP_CPP_ZASMA) "$(INTDIR)"


!ENDIF 

SOURCE=.\ZasMediatorFactory.cpp
DEP_CPP_ZASME=\
	"..\..\..\devtools\rogue\rw\bintree.h"\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gqueue.h"\
	"..\..\..\devtools\rogue\rw\gstack.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\help\helph\helpapi.hpp"\
	"..\..\..\devtools\zapp\help\zhelp.hpp"\
	"..\..\..\devtools\zapp\intpack\zip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\ctrlpane.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\slot.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\strtable.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\tip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\treectrl.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\vis.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\visctrl.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\ddeclass.hpp"\
	"..\..\..\devtools\zapp\zapph\ddeclass.inl"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\datFisheryCeilings.h"\
	".\datFisheryPNV.h"\
	".\datHarvestBPHR.h"\
	".\datHarvestHRS.h"\
	".\datIntDouble.h"\
	".\datStockENH.h"\
	".\datStockEV.h"\
	".\datStockIDL.h"\
	".\datStockMR.h"\
	".\datTypes.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\idcBPHR.h"\
	".\idcCeilings.h"\
	".\idcENH.h"\
	".\idcEV.h"\
	".\idcHRS.h"\
	".\idcIDL.h"\
	".\idcMR.h"\
	".\idcPNV.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\interfaceDataControl.h"\
	".\mapConstants.h"\
	".\MonteDataItem.h"\
	".\MonteStockTracking.h"\
	".\MonteTrackingItem.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\smart_ptr.h"\
	".\smart_ptr.i"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\ZasCalibration.h"\
	".\ZasDialogMedBPHR.h"\
	".\ZasDialogMedPNV.h"\
	".\ZasGraphMedMonteCarlo.h"\
	".\ZasGraphUpdateMed.h"\
	".\ZasMediatorFactory.h"\
	".\ZasMenuConst.h"\
	".\ZasMonteCarlo.h"\
	".\ZasTabDialogCeilings.h"\
	".\ZasTabDialogENH.h"\
	".\ZasTabDialogMedCeilings.h"\
	".\ZasTabDialogMedENH.h"\
	".\ZasTabDialogMedEV.h"\
	".\ZasTabDialogMedHRS.h"\
	".\ZasTabDialogMedIDL.h"\
	".\ZasTabDialogMedMR.h"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatDialogBase.h"\
	".\ZatDialogConstants.h"\
	".\ZatDialogMedBase.h"\
	".\ZatEditSliderBase.h"\
	".\ZatEditSliderDouble.h"\
	".\ZatEditSliderLong.h"\
	".\ZatGraphDialog.h"\
	".\ZatGraphicPane.h"\
	".\ZatImConScroller.h"\
	".\ZatImpTabCtrl.h"\
	".\ZatItem.h"\
	".\ZatRowColumnBox.h"\
	".\ZatTabDialog.h"\
	".\ZatTabDialogMed.h"\
	".\zcGM_YearAgeGraph.h"\
	".\zcGM_YearGraph.h"\
	".\zcGMF_AbundanceIndex.h"\
	".\zcGMF_CatchGraphs.h"\
	".\zcGMF_InMortGraphs.h"\
	".\zcGMH_HarvestGraphs.h"\
	".\zcGMS_Abundance.h"\
	".\zcGMS_CatchGraphs.h"\
	".\zcGMS_CNRGraphs.h"\
	".\zcGMS_Escapement.h"\
	".\zcGMS_TrueTermRun.h"\
	".\zcGraphMediator.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\ZasMediatorFactory.obj" : $(SOURCE) $(DEP_CPP_ZASME) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\ZasMediatorFactory.obj"	"$(INTDIR)\ZasMediatorFactory.sbr" : \
$(SOURCE) $(DEP_CPP_ZASME) "$(INTDIR)"


!ENDIF 

SOURCE=.\ZasMonteCarlo.cpp
DEP_CPP_ZASMO=\
	"..\..\..\devtools\rogue\rw\bintree.h"\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gqueue.h"\
	"..\..\..\devtools\rogue\rw\gstack.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\help\helph\helpapi.hpp"\
	"..\..\..\devtools\zapp\help\zhelp.hpp"\
	"..\..\..\devtools\zapp\intpack\zip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\ctrlpane.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\slot.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\strtable.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\tip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\treectrl.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\vis.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\visctrl.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\ddeclass.hpp"\
	"..\..\..\devtools\zapp\zapph\ddeclass.inl"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\interfaceDataControl.h"\
	".\mapConstants.h"\
	".\MonteControl.h"\
	".\MonteDataItem.h"\
	".\MonteOutputItem.h"\
	".\MonteTrackingItem.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\RandGen.h"\
	".\sample.h"\
	".\SeedPod.h"\
	".\Simulation.h"\
	".\smart_ptr.h"\
	".\smart_ptr.i"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\ZasGraphUpdateMed.h"\
	".\ZasMediatorFactory.h"\
	".\ZasMenuConst.h"\
	".\ZasMonteCarlo.h"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatDialogBase.h"\
	".\ZatDialogConstants.h"\
	".\ZatDialogMedBase.h"\
	".\ZatEditSliderBase.h"\
	".\ZatEditSliderLong.h"\
	".\ZatGraphDialog.h"\
	".\ZatGraphicPane.h"\
	".\ZatImConScroller.h"\
	".\ZatItem.h"\
	".\ZatRowColumnBox.h"\
	".\zcGraphMediator.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\ZasMonteCarlo.obj" : $(SOURCE) $(DEP_CPP_ZASMO) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\ZasMonteCarlo.obj"	"$(INTDIR)\ZasMonteCarlo.sbr" : $(SOURCE)\
 $(DEP_CPP_ZASMO) "$(INTDIR)"


!ENDIF 

SOURCE=.\ZasTabDialogCeilings.cpp
DEP_CPP_ZASTA=\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\ZasTabDialogCeilings.h"\
	".\ZatCheckBoxGroup.h"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatDialogBase.h"\
	".\ZatEditSliderBase.h"\
	".\ZatEditSliderLong.h"\
	".\ZatImConScroller.h"\
	".\ZatImpTabCtrl.h"\
	".\ZatItem.h"\
	".\ZatRowColumnBox.h"\
	".\ZatTabDialog.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\ZasTabDialogCeilings.obj" : $(SOURCE) $(DEP_CPP_ZASTA) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\ZasTabDialogCeilings.obj"	"$(INTDIR)\ZasTabDialogCeilings.sbr" : \
$(SOURCE) $(DEP_CPP_ZASTA) "$(INTDIR)"


!ENDIF 

SOURCE=.\ZasTabDialogENH.cpp
DEP_CPP_ZASTAB=\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\ZasTabDialogENH.h"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatDialogBase.h"\
	".\ZatEditSliderBase.h"\
	".\ZatEditSliderDouble.h"\
	".\ZatImConScroller.h"\
	".\ZatImpTabCtrl.h"\
	".\ZatItem.h"\
	".\ZatRowColumnBox.h"\
	".\ZatTabDialog.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\ZasTabDialogENH.obj" : $(SOURCE) $(DEP_CPP_ZASTAB) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\ZasTabDialogENH.obj"	"$(INTDIR)\ZasTabDialogENH.sbr" : $(SOURCE)\
 $(DEP_CPP_ZASTAB) "$(INTDIR)"


!ENDIF 

SOURCE=.\ZasTabDialogMedCeilings.cpp
DEP_CPP_ZASTABD=\
	"..\..\..\devtools\rogue\rw\bintree.h"\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gqueue.h"\
	"..\..\..\devtools\rogue\rw\gstack.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\help\helph\helpapi.hpp"\
	"..\..\..\devtools\zapp\help\zhelp.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\ddeclass.hpp"\
	"..\..\..\devtools\zapp\zapph\ddeclass.inl"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\datFisheryCeilings.h"\
	".\datIntDouble.h"\
	".\datStockIDL.h"\
	".\datTypes.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\idcCeilings.h"\
	".\idcIDL.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\interfaceDataControl.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\smart_ptr.h"\
	".\smart_ptr.i"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\ZasTabDialogCeilings.h"\
	".\ZasTabDialogMedCeilings.h"\
	".\ZatCheckBoxGroup.h"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatDialogBase.h"\
	".\ZatDialogMedBase.h"\
	".\ZatEditSliderBase.h"\
	".\ZatEditSliderDouble.h"\
	".\ZatEditSliderLong.h"\
	".\ZatImConScroller.h"\
	".\ZatImpTabCtrl.h"\
	".\ZatItem.h"\
	".\ZatRowColumnBox.h"\
	".\ZatTabDialog.h"\
	".\ZatTabDialogMed.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\ZasTabDialogMedCeilings.obj" : $(SOURCE) $(DEP_CPP_ZASTABD)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\ZasTabDialogMedCeilings.obj"	"$(INTDIR)\ZasTabDialogMedCeilings.sbr"\
 : $(SOURCE) $(DEP_CPP_ZASTABD) "$(INTDIR)"


!ENDIF 

SOURCE=.\ZasTabDialogMedENH.cpp
DEP_CPP_ZASTABDI=\
	"..\..\..\devtools\rogue\rw\bintree.h"\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gqueue.h"\
	"..\..\..\devtools\rogue\rw\gstack.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\help\helph\helpapi.hpp"\
	"..\..\..\devtools\zapp\help\zhelp.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\ddeclass.hpp"\
	"..\..\..\devtools\zapp\zapph\ddeclass.inl"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\datIntDouble.h"\
	".\datStockENH.h"\
	".\datStockIDL.h"\
	".\datTypes.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\idcENH.h"\
	".\idcIDL.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\interfaceDataControl.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\smart_ptr.h"\
	".\smart_ptr.i"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\ZasTabDialogENH.h"\
	".\ZasTabDialogMedENH.h"\
	".\ZatCheckBoxGroup.h"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatDialogBase.h"\
	".\ZatDialogMedBase.h"\
	".\ZatEditSliderBase.h"\
	".\ZatEditSliderDouble.h"\
	".\ZatEditSliderLong.h"\
	".\ZatImConScroller.h"\
	".\ZatImpTabCtrl.h"\
	".\ZatItem.h"\
	".\ZatRowColumnBox.h"\
	".\ZatTabDialog.h"\
	".\ZatTabDialogMed.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\ZasTabDialogMedENH.obj" : $(SOURCE) $(DEP_CPP_ZASTABDI) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\ZasTabDialogMedENH.obj"	"$(INTDIR)\ZasTabDialogMedENH.sbr" : \
$(SOURCE) $(DEP_CPP_ZASTABDI) "$(INTDIR)"


!ENDIF 

SOURCE=.\ZasTabDialogMedEV.cpp
DEP_CPP_ZASTABDIA=\
	"..\..\..\devtools\rogue\rw\bintree.h"\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gqueue.h"\
	"..\..\..\devtools\rogue\rw\gstack.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\help\helph\helpapi.hpp"\
	"..\..\..\devtools\zapp\help\zhelp.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\ddeclass.hpp"\
	"..\..\..\devtools\zapp\zapph\ddeclass.inl"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\datIntDouble.h"\
	".\datStockEV.h"\
	".\datStockIDL.h"\
	".\datTypes.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\idcEV.h"\
	".\idcIDL.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\interfaceDataControl.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\smart_ptr.h"\
	".\smart_ptr.i"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\ZasTabDialogMedEV.h"\
	".\ZatCheckBoxGroup.h"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatDialogBase.h"\
	".\ZatDialogMedBase.h"\
	".\ZatEditSliderBase.h"\
	".\ZatEditSliderDouble.h"\
	".\ZatImConScroller.h"\
	".\ZatImpTabCtrl.h"\
	".\ZatItem.h"\
	".\ZatRowColumnBox.h"\
	".\ZatTabDialog.h"\
	".\ZatTabDialogMed.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\ZasTabDialogMedEV.obj" : $(SOURCE) $(DEP_CPP_ZASTABDIA) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\ZasTabDialogMedEV.obj"	"$(INTDIR)\ZasTabDialogMedEV.sbr" : $(SOURCE)\
 $(DEP_CPP_ZASTABDIA) "$(INTDIR)"


!ENDIF 

SOURCE=.\ZasTabDialogMedHRS.cpp
DEP_CPP_ZASTABDIAL=\
	"..\..\..\devtools\rogue\rw\bintree.h"\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gqueue.h"\
	"..\..\..\devtools\rogue\rw\gstack.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\help\helph\helpapi.hpp"\
	"..\..\..\devtools\zapp\help\zhelp.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\ddeclass.hpp"\
	"..\..\..\devtools\zapp\zapph\ddeclass.inl"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\datHarvestHRS.h"\
	".\datIntDouble.h"\
	".\datStockIDL.h"\
	".\datTypes.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\idcHRS.h"\
	".\idcIDL.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\interfaceDataControl.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\smart_ptr.h"\
	".\smart_ptr.i"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\ZasTabDialogMedHRS.h"\
	".\ZatCheckBoxGroup.h"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatDialogBase.h"\
	".\ZatDialogMedBase.h"\
	".\ZatEditSliderBase.h"\
	".\ZatEditSliderDouble.h"\
	".\ZatImConScroller.h"\
	".\ZatImpTabCtrl.h"\
	".\ZatItem.h"\
	".\ZatRowColumnBox.h"\
	".\ZatTabDialog.h"\
	".\ZatTabDialogMed.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\ZasTabDialogMedHRS.obj" : $(SOURCE) $(DEP_CPP_ZASTABDIAL)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\ZasTabDialogMedHRS.obj"	"$(INTDIR)\ZasTabDialogMedHRS.sbr" : \
$(SOURCE) $(DEP_CPP_ZASTABDIAL) "$(INTDIR)"


!ENDIF 

SOURCE=.\ZasTabDialogMedIDL.cpp
DEP_CPP_ZASTABDIALO=\
	"..\..\..\devtools\rogue\rw\bintree.h"\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gqueue.h"\
	"..\..\..\devtools\rogue\rw\gstack.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\help\helph\helpapi.hpp"\
	"..\..\..\devtools\zapp\help\zhelp.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\ddeclass.hpp"\
	"..\..\..\devtools\zapp\zapph\ddeclass.inl"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\datIntDouble.h"\
	".\datStockIDL.h"\
	".\datTypes.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\idcIDL.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\interfaceDataControl.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\smart_ptr.h"\
	".\smart_ptr.i"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\ZasTabDialogMedIDL.h"\
	".\ZatCheckBoxGroup.h"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatDialogBase.h"\
	".\ZatDialogMedBase.h"\
	".\ZatEditSliderBase.h"\
	".\ZatEditSliderDouble.h"\
	".\ZatImConScroller.h"\
	".\ZatImpTabCtrl.h"\
	".\ZatItem.h"\
	".\ZatRowColumnBox.h"\
	".\ZatTabDialog.h"\
	".\ZatTabDialogMed.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\ZasTabDialogMedIDL.obj" : $(SOURCE) $(DEP_CPP_ZASTABDIALO)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\ZasTabDialogMedIDL.obj"	"$(INTDIR)\ZasTabDialogMedIDL.sbr" : \
$(SOURCE) $(DEP_CPP_ZASTABDIALO) "$(INTDIR)"


!ENDIF 

SOURCE=.\ZasTabDialogMedMR.cpp
DEP_CPP_ZASTABDIALOG=\
	"..\..\..\devtools\rogue\rw\bintree.h"\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gqueue.h"\
	"..\..\..\devtools\rogue\rw\gstack.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\help\helph\helpapi.hpp"\
	"..\..\..\devtools\zapp\help\zhelp.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\ddeclass.hpp"\
	"..\..\..\devtools\zapp\zapph\ddeclass.inl"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\datIntDouble.h"\
	".\datStockIDL.h"\
	".\datStockMR.h"\
	".\datTypes.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\idcIDL.h"\
	".\idcMR.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\interfaceDataControl.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\smart_ptr.h"\
	".\smart_ptr.i"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\ZasTabDialogMedMR.h"\
	".\ZatCheckBoxGroup.h"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatDialogBase.h"\
	".\ZatDialogMedBase.h"\
	".\ZatEditSliderBase.h"\
	".\ZatEditSliderDouble.h"\
	".\ZatImConScroller.h"\
	".\ZatImpTabCtrl.h"\
	".\ZatItem.h"\
	".\ZatRowColumnBox.h"\
	".\ZatTabDialog.h"\
	".\ZatTabDialogMed.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\ZasTabDialogMedMR.obj" : $(SOURCE) $(DEP_CPP_ZASTABDIALOG)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\ZasTabDialogMedMR.obj"	"$(INTDIR)\ZasTabDialogMedMR.sbr" : $(SOURCE)\
 $(DEP_CPP_ZASTABDIALOG) "$(INTDIR)"


!ENDIF 

SOURCE=.\ZatCheckBoxGroup.cpp
DEP_CPP_ZATCH=\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\intpack\zip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\ctrlpane.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\slot.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\strtable.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\tip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\treectrl.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\vis.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\visctrl.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\ZatCheckBoxGroup.h"\
	".\ZatDefines.h"\
	".\ZatItem.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\ZatCheckBoxGroup.obj" : $(SOURCE) $(DEP_CPP_ZATCH) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\ZatCheckBoxGroup.obj"	"$(INTDIR)\ZatCheckBoxGroup.sbr" : $(SOURCE)\
 $(DEP_CPP_ZATCH) "$(INTDIR)"


!ENDIF 

SOURCE=.\ZatDialogBase.cpp
DEP_CPP_ZATDI=\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\intpack\zip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\ctrlpane.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\slot.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\strtable.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\tip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\treectrl.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\vis.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\visctrl.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\ZatCheckBoxGroup.h"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatDialogBase.h"\
	".\ZatDialogConstants.h"\
	".\ZatEditSliderBase.h"\
	".\ZatEditSliderDouble.h"\
	".\ZatEditSliderLong.h"\
	".\ZatImConScroller.h"\
	".\ZatItem.h"\
	".\ZatRowColumnBox.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\ZatDialogBase.obj" : $(SOURCE) $(DEP_CPP_ZATDI) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\ZatDialogBase.obj"	"$(INTDIR)\ZatDialogBase.sbr" : $(SOURCE)\
 $(DEP_CPP_ZATDI) "$(INTDIR)"


!ENDIF 

SOURCE=.\ZatDialogMedBase.cpp
DEP_CPP_ZATDIA=\
	"..\..\..\devtools\rogue\rw\bintree.h"\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gqueue.h"\
	"..\..\..\devtools\rogue\rw\gstack.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\help\helph\helpapi.hpp"\
	"..\..\..\devtools\zapp\help\zhelp.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\ddeclass.hpp"\
	"..\..\..\devtools\zapp\zapph\ddeclass.inl"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\interfaceDataControl.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\smart_ptr.h"\
	".\smart_ptr.i"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\ZatCheckBoxGroup.h"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatDialogBase.h"\
	".\ZatDialogMedBase.h"\
	".\ZatEditSliderBase.h"\
	".\ZatEditSliderDouble.h"\
	".\ZatEditSliderLong.h"\
	".\ZatImConScroller.h"\
	".\ZatItem.h"\
	".\ZatRowColumnBox.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\ZatDialogMedBase.obj" : $(SOURCE) $(DEP_CPP_ZATDIA) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\ZatDialogMedBase.obj"	"$(INTDIR)\ZatDialogMedBase.sbr" : $(SOURCE)\
 $(DEP_CPP_ZATDIA) "$(INTDIR)"


!ENDIF 

SOURCE=.\ZatEditSliderBase.cpp
DEP_CPP_ZATED=\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\intpack\zip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\ctrlpane.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\slot.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\strtable.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\tip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\treectrl.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\vis.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\visctrl.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\ZatDefines.h"\
	".\ZatEditSliderBase.h"\
	".\ZatImConScroller.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\ZatEditSliderBase.obj" : $(SOURCE) $(DEP_CPP_ZATED) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\ZatEditSliderBase.obj"	"$(INTDIR)\ZatEditSliderBase.sbr" : $(SOURCE)\
 $(DEP_CPP_ZATED) "$(INTDIR)"


!ENDIF 

SOURCE=.\ZatEditSliderDouble.cpp
DEP_CPP_ZATEDI=\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\intpack\zip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\ctrlpane.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\slot.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\strtable.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\tip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\treectrl.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\vis.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\visctrl.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\ZatDefines.h"\
	".\ZatEditSliderBase.h"\
	".\ZatEditSliderDouble.h"\
	".\ZatImConScroller.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\ZatEditSliderDouble.obj" : $(SOURCE) $(DEP_CPP_ZATEDI) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\ZatEditSliderDouble.obj"	"$(INTDIR)\ZatEditSliderDouble.sbr" : \
$(SOURCE) $(DEP_CPP_ZATEDI) "$(INTDIR)"


!ENDIF 

SOURCE=.\ZatEditSliderLong.cpp
DEP_CPP_ZATEDIT=\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\intpack\zip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\ctrlpane.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\slot.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\strtable.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\tip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\treectrl.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\vis.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\visctrl.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\ZatDefines.h"\
	".\ZatEditSliderBase.h"\
	".\ZatEditSliderLong.h"\
	".\ZatImConScroller.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\ZatEditSliderLong.obj" : $(SOURCE) $(DEP_CPP_ZATEDIT) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\ZatEditSliderLong.obj"	"$(INTDIR)\ZatEditSliderLong.sbr" : $(SOURCE)\
 $(DEP_CPP_ZATEDIT) "$(INTDIR)"


!ENDIF 

SOURCE=.\ZatGraphDialog.cpp
DEP_CPP_ZATGR=\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\intpack\zip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\ctrlpane.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\slot.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\strtable.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\tip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\treectrl.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\vis.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\visctrl.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\ZasMenuConst.h"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatDialogConstants.h"\
	".\ZatGraphConstants.h"\
	".\ZatGraphDialog.h"\
	".\ZatGraphicPane.h"\
	".\ZatItem.h"\
	".\ZatRowColumnBox.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\ZatGraphDialog.obj" : $(SOURCE) $(DEP_CPP_ZATGR) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\ZatGraphDialog.obj"	"$(INTDIR)\ZatGraphDialog.sbr" : $(SOURCE)\
 $(DEP_CPP_ZATGR) "$(INTDIR)"


!ENDIF 

SOURCE=.\ZatGraphicPane.cpp
DEP_CPP_ZATGRA=\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\ZatDialogConstants.h"\
	".\ZatGraphicPane.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\ZatGraphicPane.obj" : $(SOURCE) $(DEP_CPP_ZATGRA) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\ZatGraphicPane.obj"	"$(INTDIR)\ZatGraphicPane.sbr" : $(SOURCE)\
 $(DEP_CPP_ZATGRA) "$(INTDIR)"


!ENDIF 

SOURCE=.\ZatImplicitScroller.cpp
DEP_CPP_ZATIM=\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\ZatImplicitScroller.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\ZatImplicitScroller.obj" : $(SOURCE) $(DEP_CPP_ZATIM) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\ZatImplicitScroller.obj"	"$(INTDIR)\ZatImplicitScroller.sbr" : \
$(SOURCE) $(DEP_CPP_ZATIM) "$(INTDIR)"


!ENDIF 

SOURCE=.\ZatMapMediator.cpp
DEP_CPP_ZATMA=\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\dlist.h"\
	"..\..\..\devtools\rogue\rw\dlistcol.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stackcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\mapConstants.h"\
	".\mapController.h"\
	".\mapObject.h"\
	".\mapPoint.h"\
	".\ZatDialogConstants.h"\
	".\ZatMapMediator.h"\
	".\ZatMapPane.h"\
	".\ZatMercatorTransform.h"\
	".\ZatPointTransform.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\ZatMapMediator.obj" : $(SOURCE) $(DEP_CPP_ZATMA) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\ZatMapMediator.obj"	"$(INTDIR)\ZatMapMediator.sbr" : $(SOURCE)\
 $(DEP_CPP_ZATMA) "$(INTDIR)"


!ENDIF 

SOURCE=.\ZatMapPane.cpp
DEP_CPP_ZATMAP=\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\intpack\zip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\ctrlpane.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\slot.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\strtable.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\tip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\treectrl.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\vis.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\visctrl.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\ZatMapPane.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\ZatMapPane.obj" : $(SOURCE) $(DEP_CPP_ZATMAP) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\ZatMapPane.obj"	"$(INTDIR)\ZatMapPane.sbr" : $(SOURCE)\
 $(DEP_CPP_ZATMAP) "$(INTDIR)"


!ENDIF 

SOURCE=.\ZatMercatorTransform.cpp
DEP_CPP_ZATME=\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stackcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\mapPoint.h"\
	".\ZatMercatorTransform.h"\
	".\ZatPointTransform.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\ZatMercatorTransform.obj" : $(SOURCE) $(DEP_CPP_ZATME) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\ZatMercatorTransform.obj"	"$(INTDIR)\ZatMercatorTransform.sbr" : \
$(SOURCE) $(DEP_CPP_ZATME) "$(INTDIR)"


!ENDIF 

SOURCE=.\ZatPointTransform.cpp
DEP_CPP_ZATPO=\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stackcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\mapPoint.h"\
	".\ZatPointTransform.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\ZatPointTransform.obj" : $(SOURCE) $(DEP_CPP_ZATPO) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\ZatPointTransform.obj"	"$(INTDIR)\ZatPointTransform.sbr" : $(SOURCE)\
 $(DEP_CPP_ZATPO) "$(INTDIR)"


!ENDIF 

SOURCE=.\ZatRowColumnBox.cpp
DEP_CPP_ZATRO=\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatItem.h"\
	".\ZatRowColumnBox.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\ZatRowColumnBox.obj" : $(SOURCE) $(DEP_CPP_ZATRO) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\ZatRowColumnBox.obj"	"$(INTDIR)\ZatRowColumnBox.sbr" : $(SOURCE)\
 $(DEP_CPP_ZATRO) "$(INTDIR)"


!ENDIF 

SOURCE=.\ZatTabDialog.cpp
DEP_CPP_ZATTA=\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\intpack\zip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\ctrlpane.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\slot.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\strtable.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\tip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\treectrl.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\vis.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\visctrl.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\ZatCheckBoxGroup.h"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatDialogBase.h"\
	".\ZatDialogConstants.h"\
	".\ZatEditSliderBase.h"\
	".\ZatEditSliderDouble.h"\
	".\ZatEditSliderLong.h"\
	".\ZatImConScroller.h"\
	".\ZatImpTabCtrl.h"\
	".\ZatItem.h"\
	".\ZatRowColumnBox.h"\
	".\ZatTabDialog.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\ZatTabDialog.obj" : $(SOURCE) $(DEP_CPP_ZATTA) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\ZatTabDialog.obj"	"$(INTDIR)\ZatTabDialog.sbr" : $(SOURCE)\
 $(DEP_CPP_ZATTA) "$(INTDIR)"


!ENDIF 

SOURCE=.\ZatTabDialogMed.cpp
DEP_CPP_ZATTAB=\
	"..\..\..\devtools\rogue\rw\bintree.h"\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gqueue.h"\
	"..\..\..\devtools\rogue\rw\gstack.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\help\helph\helpapi.hpp"\
	"..\..\..\devtools\zapp\help\zhelp.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\ddeclass.hpp"\
	"..\..\..\devtools\zapp\zapph\ddeclass.inl"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\datIntDouble.h"\
	".\datStockIDL.h"\
	".\datTypes.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\idcIDL.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\interfaceDataControl.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\smart_ptr.h"\
	".\smart_ptr.i"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatDialogBase.h"\
	".\ZatDialogMedBase.h"\
	".\ZatImpTabCtrl.h"\
	".\ZatItem.h"\
	".\ZatRowColumnBox.h"\
	".\ZatTabDialog.h"\
	".\ZatTabDialogMed.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\ZatTabDialogMed.obj" : $(SOURCE) $(DEP_CPP_ZATTAB) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\ZatTabDialogMed.obj"	"$(INTDIR)\ZatTabDialogMed.sbr" : $(SOURCE)\
 $(DEP_CPP_ZATTAB) "$(INTDIR)"


!ENDIF 

SOURCE=.\zcGM_YearAgeGraph.cpp
DEP_CPP_ZCGM_=\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\intpack\zip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\ctrlpane.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\slot.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\strtable.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\tip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\treectrl.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\vis.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\visctrl.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\smart_ptr.h"\
	".\smart_ptr.i"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\ZasGraphUpdateMed.h"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatDialogConstants.h"\
	".\ZatGraphDialog.h"\
	".\ZatGraphicPane.h"\
	".\ZatItem.h"\
	".\ZatRowColumnBox.h"\
	".\zcGM_YearAgeGraph.h"\
	".\zcGraphMediator.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\zcGM_YearAgeGraph.obj" : $(SOURCE) $(DEP_CPP_ZCGM_) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\zcGM_YearAgeGraph.obj"	"$(INTDIR)\zcGM_YearAgeGraph.sbr" : $(SOURCE)\
 $(DEP_CPP_ZCGM_) "$(INTDIR)"


!ENDIF 

SOURCE=.\zcGM_YearGraph.cpp
DEP_CPP_ZCGM_Y=\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\intpack\zip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\ctrlpane.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\slot.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\strtable.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\tip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\treectrl.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\vis.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\visctrl.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\smart_ptr.h"\
	".\smart_ptr.i"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\ZasGraphUpdateMed.h"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatDialogConstants.h"\
	".\ZatGraphDialog.h"\
	".\ZatGraphicPane.h"\
	".\ZatItem.h"\
	".\ZatRowColumnBox.h"\
	".\zcGM_YearGraph.h"\
	".\zcGraphMediator.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\zcGM_YearGraph.obj" : $(SOURCE) $(DEP_CPP_ZCGM_Y) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\zcGM_YearGraph.obj"	"$(INTDIR)\zcGM_YearGraph.sbr" : $(SOURCE)\
 $(DEP_CPP_ZCGM_Y) "$(INTDIR)"


!ENDIF 

SOURCE=.\zcGMF_AbundanceIndex.cpp
DEP_CPP_ZCGMF=\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\intpack\zip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\ctrlpane.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\slot.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\strtable.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\tip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\treectrl.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\vis.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\visctrl.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\smart_ptr.h"\
	".\smart_ptr.i"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\ZasGraphUpdateMed.h"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatDialogConstants.h"\
	".\ZatGraphDialog.h"\
	".\ZatGraphicPane.h"\
	".\ZatItem.h"\
	".\ZatRowColumnBox.h"\
	".\zcGM_YearGraph.h"\
	".\zcGMF_AbundanceIndex.h"\
	".\zcGraphMediator.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\zcGMF_AbundanceIndex.obj" : $(SOURCE) $(DEP_CPP_ZCGMF) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\zcGMF_AbundanceIndex.obj"	"$(INTDIR)\zcGMF_AbundanceIndex.sbr" : \
$(SOURCE) $(DEP_CPP_ZCGMF) "$(INTDIR)"


!ENDIF 

SOURCE=.\zcGMF_CatchPreterm.cpp
DEP_CPP_ZCGMF_=\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\intpack\zip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\ctrlpane.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\slot.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\strtable.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\tip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\treectrl.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\vis.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\visctrl.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\smart_ptr.h"\
	".\smart_ptr.i"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\ZasGraphUpdateMed.h"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatDialogConstants.h"\
	".\ZatGraphDialog.h"\
	".\ZatGraphicPane.h"\
	".\ZatItem.h"\
	".\ZatRowColumnBox.h"\
	".\zcGM_YearGraph.h"\
	".\zcGMF_CatchGraphs.h"\
	".\zcGraphMediator.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\zcGMF_CatchPreterm.obj" : $(SOURCE) $(DEP_CPP_ZCGMF_) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\zcGMF_CatchPreterm.obj"	"$(INTDIR)\zcGMF_CatchPreterm.sbr" : \
$(SOURCE) $(DEP_CPP_ZCGMF_) "$(INTDIR)"


!ENDIF 

SOURCE=.\zcGMF_CatchTerminal.cpp
DEP_CPP_ZCGMF_C=\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\intpack\zip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\ctrlpane.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\slot.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\strtable.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\tip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\treectrl.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\vis.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\visctrl.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\smart_ptr.h"\
	".\smart_ptr.i"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\ZasGraphUpdateMed.h"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatDialogConstants.h"\
	".\ZatGraphDialog.h"\
	".\ZatGraphicPane.h"\
	".\ZatItem.h"\
	".\ZatRowColumnBox.h"\
	".\zcGM_YearGraph.h"\
	".\zcGMF_CatchGraphs.h"\
	".\zcGraphMediator.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\zcGMF_CatchTerminal.obj" : $(SOURCE) $(DEP_CPP_ZCGMF_C) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\zcGMF_CatchTerminal.obj"	"$(INTDIR)\zcGMF_CatchTerminal.sbr" : \
$(SOURCE) $(DEP_CPP_ZCGMF_C) "$(INTDIR)"


!ENDIF 

SOURCE=.\zcGMF_CatchTotal.cpp
DEP_CPP_ZCGMF_CA=\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\intpack\zip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\ctrlpane.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\slot.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\strtable.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\tip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\treectrl.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\vis.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\visctrl.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\smart_ptr.h"\
	".\smart_ptr.i"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\ZasGraphUpdateMed.h"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatDialogConstants.h"\
	".\ZatGraphDialog.h"\
	".\ZatGraphicPane.h"\
	".\ZatItem.h"\
	".\ZatRowColumnBox.h"\
	".\zcGM_YearGraph.h"\
	".\zcGMF_CatchGraphs.h"\
	".\zcGraphMediator.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\zcGMF_CatchTotal.obj" : $(SOURCE) $(DEP_CPP_ZCGMF_CA) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\zcGMF_CatchTotal.obj"	"$(INTDIR)\zcGMF_CatchTotal.sbr" : $(SOURCE)\
 $(DEP_CPP_ZCGMF_CA) "$(INTDIR)"


!ENDIF 

SOURCE=.\zcGMF_InMortLegal.cpp
DEP_CPP_ZCGMF_I=\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\intpack\zip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\ctrlpane.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\slot.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\strtable.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\tip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\treectrl.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\vis.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\visctrl.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\smart_ptr.h"\
	".\smart_ptr.i"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\ZasGraphUpdateMed.h"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatDialogConstants.h"\
	".\ZatGraphDialog.h"\
	".\ZatGraphicPane.h"\
	".\ZatItem.h"\
	".\ZatRowColumnBox.h"\
	".\zcGM_YearGraph.h"\
	".\zcGMF_InMortGraphs.h"\
	".\zcGraphMediator.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\zcGMF_InMortLegal.obj" : $(SOURCE) $(DEP_CPP_ZCGMF_I) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\zcGMF_InMortLegal.obj"	"$(INTDIR)\zcGMF_InMortLegal.sbr" : $(SOURCE)\
 $(DEP_CPP_ZCGMF_I) "$(INTDIR)"


!ENDIF 

SOURCE=.\zcGMF_InMortSublegal.cpp
DEP_CPP_ZCGMF_IN=\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\intpack\zip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\ctrlpane.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\slot.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\strtable.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\tip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\treectrl.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\vis.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\visctrl.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\smart_ptr.h"\
	".\smart_ptr.i"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\ZasGraphUpdateMed.h"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatDialogConstants.h"\
	".\ZatGraphDialog.h"\
	".\ZatGraphicPane.h"\
	".\ZatItem.h"\
	".\ZatRowColumnBox.h"\
	".\zcGM_YearGraph.h"\
	".\zcGMF_InMortGraphs.h"\
	".\zcGraphMediator.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\zcGMF_InMortSublegal.obj" : $(SOURCE) $(DEP_CPP_ZCGMF_IN)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\zcGMF_InMortSublegal.obj"	"$(INTDIR)\zcGMF_InMortSublegal.sbr" : \
$(SOURCE) $(DEP_CPP_ZCGMF_IN) "$(INTDIR)"


!ENDIF 

SOURCE=.\zcGMF_InMortTotal.cpp
DEP_CPP_ZCGMF_INM=\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\intpack\zip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\ctrlpane.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\slot.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\strtable.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\tip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\treectrl.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\vis.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\visctrl.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\smart_ptr.h"\
	".\smart_ptr.i"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\ZasGraphUpdateMed.h"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatDialogConstants.h"\
	".\ZatGraphDialog.h"\
	".\ZatGraphicPane.h"\
	".\ZatItem.h"\
	".\ZatRowColumnBox.h"\
	".\zcGM_YearGraph.h"\
	".\zcGMF_InMortGraphs.h"\
	".\zcGraphMediator.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\zcGMF_InMortTotal.obj" : $(SOURCE) $(DEP_CPP_ZCGMF_INM) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\zcGMF_InMortTotal.obj"	"$(INTDIR)\zcGMF_InMortTotal.sbr" : $(SOURCE)\
 $(DEP_CPP_ZCGMF_INM) "$(INTDIR)"


!ENDIF 

SOURCE=.\zcGMH_HarvestGraphs.cpp
DEP_CPP_ZCGMH=\
	"..\..\..\devtools\rogue\rw\bintree.h"\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gqueue.h"\
	"..\..\..\devtools\rogue\rw\gstack.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\intpack\zip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\ctrlpane.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\slot.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\strtable.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\tip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\treectrl.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\vis.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\visctrl.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\datHarvestBPHR.h"\
	".\datIntDouble.h"\
	".\datTypes.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\idcBPHR.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\interfaceDataControl.h"\
	".\mapConstants.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\smart_ptr.h"\
	".\smart_ptr.i"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\ZasGraphUpdateMed.h"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatDialogConstants.h"\
	".\ZatGraphDialog.h"\
	".\ZatGraphicPane.h"\
	".\ZatItem.h"\
	".\ZatRowColumnBox.h"\
	".\zcGM_YearAgeGraph.h"\
	".\zcGM_YearGraph.h"\
	".\zcGMH_HarvestGraphs.h"\
	".\zcGraphMediator.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\zcGMH_HarvestGraphs.obj" : $(SOURCE) $(DEP_CPP_ZCGMH) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\zcGMH_HarvestGraphs.obj"	"$(INTDIR)\zcGMH_HarvestGraphs.sbr" : \
$(SOURCE) $(DEP_CPP_ZCGMH) "$(INTDIR)"


!ENDIF 

SOURCE=.\zcGMS_Abundance.cpp
DEP_CPP_ZCGMS=\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\intpack\zip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\ctrlpane.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\slot.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\strtable.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\tip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\treectrl.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\vis.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\visctrl.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\smart_ptr.h"\
	".\smart_ptr.i"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\ZasGraphUpdateMed.h"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatDialogConstants.h"\
	".\ZatGraphDialog.h"\
	".\ZatGraphicPane.h"\
	".\ZatItem.h"\
	".\ZatRowColumnBox.h"\
	".\zcGM_YearGraph.h"\
	".\zcGMS_Abundance.h"\
	".\zcGraphMediator.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\zcGMS_Abundance.obj" : $(SOURCE) $(DEP_CPP_ZCGMS) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\zcGMS_Abundance.obj"	"$(INTDIR)\zcGMS_Abundance.sbr" : $(SOURCE)\
 $(DEP_CPP_ZCGMS) "$(INTDIR)"


!ENDIF 

SOURCE=.\zcGMS_CatchGraphs.cpp
DEP_CPP_ZCGMS_=\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\intpack\zip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\ctrlpane.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\slot.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\strtable.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\tip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\treectrl.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\vis.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\visctrl.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\smart_ptr.h"\
	".\smart_ptr.i"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\ZasGraphUpdateMed.h"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatDialogConstants.h"\
	".\ZatGraphDialog.h"\
	".\ZatGraphicPane.h"\
	".\ZatItem.h"\
	".\ZatRowColumnBox.h"\
	".\zcGM_YearAgeGraph.h"\
	".\zcGMS_CatchGraphs.h"\
	".\zcGraphMediator.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\zcGMS_CatchGraphs.obj" : $(SOURCE) $(DEP_CPP_ZCGMS_) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\zcGMS_CatchGraphs.obj"	"$(INTDIR)\zcGMS_CatchGraphs.sbr" : $(SOURCE)\
 $(DEP_CPP_ZCGMS_) "$(INTDIR)"


!ENDIF 

SOURCE=.\zcGMS_CNRGraphs.cpp
DEP_CPP_ZCGMS_C=\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\intpack\zip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\ctrlpane.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\slot.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\strtable.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\tip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\treectrl.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\vis.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\visctrl.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\smart_ptr.h"\
	".\smart_ptr.i"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\ZasGraphUpdateMed.h"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatDialogConstants.h"\
	".\ZatGraphDialog.h"\
	".\ZatGraphicPane.h"\
	".\ZatItem.h"\
	".\ZatRowColumnBox.h"\
	".\zcGM_YearAgeGraph.h"\
	".\zcGMS_CNRGraphs.h"\
	".\zcGraphMediator.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\zcGMS_CNRGraphs.obj" : $(SOURCE) $(DEP_CPP_ZCGMS_C) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\zcGMS_CNRGraphs.obj"	"$(INTDIR)\zcGMS_CNRGraphs.sbr" : $(SOURCE)\
 $(DEP_CPP_ZCGMS_C) "$(INTDIR)"


!ENDIF 

SOURCE=.\zcGMS_Escapement.cpp
DEP_CPP_ZCGMS_E=\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\intpack\zip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\ctrlpane.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\slot.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\strtable.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\tip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\treectrl.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\vis.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\visctrl.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\smart_ptr.h"\
	".\smart_ptr.i"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\ZasGraphUpdateMed.h"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatDialogConstants.h"\
	".\ZatGraphDialog.h"\
	".\ZatGraphicPane.h"\
	".\ZatItem.h"\
	".\ZatRowColumnBox.h"\
	".\zcGM_YearGraph.h"\
	".\zcGMS_Escapement.h"\
	".\zcGraphMediator.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\zcGMS_Escapement.obj" : $(SOURCE) $(DEP_CPP_ZCGMS_E) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\zcGMS_Escapement.obj"	"$(INTDIR)\zcGMS_Escapement.sbr" : $(SOURCE)\
 $(DEP_CPP_ZCGMS_E) "$(INTDIR)"


!ENDIF 

SOURCE=.\zcGMS_TrueTermRun.cpp
DEP_CPP_ZCGMS_T=\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\intpack\zip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\ctrlpane.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\slot.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\strtable.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\tip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\treectrl.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\vis.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\visctrl.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\smart_ptr.h"\
	".\smart_ptr.i"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\ZasGraphUpdateMed.h"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatDialogConstants.h"\
	".\ZatGraphDialog.h"\
	".\ZatGraphicPane.h"\
	".\ZatItem.h"\
	".\ZatRowColumnBox.h"\
	".\zcGM_YearGraph.h"\
	".\zcGMS_TrueTermRun.h"\
	".\zcGraphMediator.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\zcGMS_TrueTermRun.obj" : $(SOURCE) $(DEP_CPP_ZCGMS_T) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\zcGMS_TrueTermRun.obj"	"$(INTDIR)\zcGMS_TrueTermRun.sbr" : $(SOURCE)\
 $(DEP_CPP_ZCGMS_T) "$(INTDIR)"


!ENDIF 

SOURCE=.\zcGraphMediator.cpp
DEP_CPP_ZCGRA=\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\intpack\zip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\ctrlpane.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\slot.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\strtable.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\tip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\treectrl.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\vis.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\visctrl.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\smart_ptr.h"\
	".\smart_ptr.i"\
	".\ZasGraphUpdateMed.h"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatDialogConstants.h"\
	".\ZatGraphDialog.h"\
	".\ZatGraphicPane.h"\
	".\ZatItem.h"\
	".\ZatRowColumnBox.h"\
	".\zcGraphMediator.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\zcGraphMediator.obj" : $(SOURCE) $(DEP_CPP_ZCGRA) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\zcGraphMediator.obj"	"$(INTDIR)\zcGraphMediator.sbr" : $(SOURCE)\
 $(DEP_CPP_ZCGRA) "$(INTDIR)"


!ENDIF 

SOURCE=.\zcMouseTool.cpp
DEP_CPP_ZCMOU=\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\ZatDialogConstants.h"\
	".\zcMouseTool.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\zcMouseTool.obj" : $(SOURCE) $(DEP_CPP_ZCMOU) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\zcMouseTool.obj"	"$(INTDIR)\zcMouseTool.sbr" : $(SOURCE)\
 $(DEP_CPP_ZCMOU) "$(INTDIR)"


!ENDIF 

SOURCE=.\zcMouseToolCrisp2.cpp
DEP_CPP_ZCMOUS=\
	"..\..\..\devtools\rogue\rw\bintree.h"\
	"..\..\..\devtools\rogue\rw\btree.h"\
	"..\..\..\devtools\rogue\rw\cacheman.h"\
	"..\..\..\devtools\rogue\rw\colclass.h"\
	"..\..\..\devtools\rogue\rw\collect.h"\
	"..\..\..\devtools\rogue\rw\collstr.h"\
	"..\..\..\devtools\rogue\rw\compiler.h"\
	"..\..\..\devtools\rogue\rw\cstring.h"\
	"..\..\..\devtools\rogue\rw\ctoken.h"\
	"..\..\..\devtools\rogue\rw\defs.h"\
	"..\..\..\devtools\rogue\rw\disktree.h"\
	"..\..\..\devtools\rogue\rw\edefs.h"\
	"..\..\..\devtools\rogue\rw\epersist.cc"\
	"..\..\..\devtools\rogue\rw\epersist.h"\
	"..\..\..\devtools\rogue\rw\filemgr.h"\
	"..\..\..\devtools\rogue\rw\generic.h"\
	"..\..\..\devtools\rogue\rw\gqueue.h"\
	"..\..\..\devtools\rogue\rw\gstack.h"\
	"..\..\..\devtools\rogue\rw\gvector.h"\
	"..\..\..\devtools\rogue\rw\hashtab.h"\
	"..\..\..\devtools\rogue\rw\idlist.h"\
	"..\..\..\devtools\rogue\rw\islist.h"\
	"..\..\..\devtools\rogue\rw\iterator.h"\
	"..\..\..\devtools\rogue\rw\mempool.h"\
	"..\..\..\devtools\rogue\rw\message.h"\
	"..\..\..\devtools\rogue\rw\pvector.h"\
	"..\..\..\devtools\rogue\rw\ref.h"\
	"..\..\..\devtools\rogue\rw\rstream.h"\
	"..\..\..\devtools\rogue\rw\rwdate.h"\
	"..\..\..\devtools\rogue\rw\rwerr.h"\
	"..\..\..\devtools\rogue\rw\rwfile.h"\
	"..\..\..\devtools\rogue\rw\rwset.h"\
	"..\..\..\devtools\rogue\rw\rwstore.h"\
	"..\..\..\devtools\rogue\rw\rwtime.h"\
	"..\..\..\devtools\rogue\rw\rwwind.h"\
	"..\..\..\devtools\rogue\rw\seqcltn.h"\
	"..\..\..\devtools\rogue\rw\slist.h"\
	"..\..\..\devtools\rogue\rw\slistcol.h"\
	"..\..\..\devtools\rogue\rw\stringid.h"\
	"..\..\..\devtools\rogue\rw\strmshft.h"\
	"..\..\..\devtools\rogue\rw\tidlist.cc"\
	"..\..\..\devtools\rogue\rw\tidlist.h"\
	"..\..\..\devtools\rogue\rw\tislist.cc"\
	"..\..\..\devtools\rogue\rw\tislist.h"\
	"..\..\..\devtools\rogue\rw\tooldefs.h"\
	"..\..\..\devtools\rogue\rw\toolerr.h"\
	"..\..\..\devtools\rogue\rw\tpdlist.h"\
	"..\..\..\devtools\rogue\rw\tpordvec.h"\
	"..\..\..\devtools\rogue\rw\tpslist.h"\
	"..\..\..\devtools\rogue\rw\tpvector.cc"\
	"..\..\..\devtools\rogue\rw\tpvector.h"\
	"..\..\..\devtools\rogue\rw\tvordvec.h"\
	"..\..\..\devtools\rogue\rw\tvslist.h"\
	"..\..\..\devtools\rogue\rw\tvvector.cc"\
	"..\..\..\devtools\rogue\rw\tvvector.h"\
	"..\..\..\devtools\rogue\rw\vstream.h"\
	"..\..\..\devtools\rogue\rw\xpdlist.cc"\
	"..\..\..\devtools\rogue\rw\xpdlist.h"\
	"..\..\..\devtools\rogue\rw\xpordvec.cc"\
	"..\..\..\devtools\rogue\rw\xpordvec.h"\
	"..\..\..\devtools\rogue\rw\xpslist.cc"\
	"..\..\..\devtools\rogue\rw\xpslist.h"\
	"..\..\..\devtools\rogue\rw\xvordvec.cc"\
	"..\..\..\devtools\rogue\rw\xvordvec.h"\
	"..\..\..\devtools\rogue\rw\xvslist.cc"\
	"..\..\..\devtools\rogue\rw\xvslist.h"\
	"..\..\..\devtools\rogue\rw\zone.h"\
	"..\..\..\devtools\zapp\help\helph\helpapi.hpp"\
	"..\..\..\devtools\zapp\help\zhelp.hpp"\
	"..\..\..\devtools\zapp\intpack\zip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\ctrlpane.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\progress.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\slot.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\statline.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\strtable.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\table.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\tip.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\toolbar.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\treectrl.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\valueset.inl"\
	"..\..\..\devtools\zapp\intpack\ziph\vis.hpp"\
	"..\..\..\devtools\zapp\intpack\ziph\visctrl.hpp"\
	"..\..\..\devtools\zapp\zapp.hpp"\
	"..\..\..\devtools\zapp\zapph\app.hpp"\
	"..\..\..\devtools\zapp\zapph\assert.hpp"\
	"..\..\..\devtools\zapp\zapph\caret.hpp"\
	"..\..\..\devtools\zapp\zapph\childfr.hpp"\
	"..\..\..\devtools\zapp\zapph\childwin.hpp"\
	"..\..\..\devtools\zapp\zapph\clip.hpp"\
	"..\..\..\devtools\zapp\zapph\comdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\control.hpp"\
	"..\..\..\devtools\zapp\zapph\control.inl"\
	"..\..\..\devtools\zapp\zapph\cursor.hpp"\
	"..\..\..\devtools\zapp\zapph\darray.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobj.hpp"\
	"..\..\..\devtools\zapp\zapph\dataobji.hpp"\
	"..\..\..\devtools\zapp\zapph\ddeclass.hpp"\
	"..\..\..\devtools\zapp\zapph\ddeclass.inl"\
	"..\..\..\devtools\zapp\zapph\defs.hpp"\
	"..\..\..\devtools\zapp\zapph\device.hpp"\
	"..\..\..\devtools\zapp\zapph\dialog.hpp"\
	"..\..\..\devtools\zapp\zapph\display.hpp"\
	"..\..\..\devtools\zapp\zapph\display.inl"\
	"..\..\..\devtools\zapp\zapph\dlist.hpp"\
	"..\..\..\devtools\zapp\zapph\dlist.inl"\
	"..\..\..\devtools\zapp\zapph\drgdrpi.hpp"\
	"..\..\..\devtools\zapp\zapph\drgsrc.hpp"\
	"..\..\..\devtools\zapp\zapph\drptrg.hpp"\
	"..\..\..\devtools\zapp\zapph\editor.hpp"\
	"..\..\..\devtools\zapp\zapph\enumdef.hpp"\
	"..\..\..\devtools\zapp\zapph\events.hpp"\
	"..\..\..\devtools\zapp\zapph\events.inl"\
	"..\..\..\devtools\zapp\zapph\evh.hpp"\
	"..\..\..\devtools\zapp\zapph\formdlg.hpp"\
	"..\..\..\devtools\zapp\zapph\framewin.hpp"\
	"..\..\..\devtools\zapp\zapph\general.hpp"\
	"..\..\..\devtools\zapp\zapph\lastdefs.hpp"\
	"..\..\..\devtools\zapp\zapph\llink.hpp"\
	"..\..\..\devtools\zapp\zapph\mail.hpp"\
	"..\..\..\devtools\zapp\zapph\mdi.hpp"\
	"..\..\..\devtools\zapp\zapph\memmgr.hpp"\
	"..\..\..\devtools\zapp\zapph\message.hpp"\
	"..\..\..\devtools\zapp\zapph\multi.hpp"\
	"..\..\..\devtools\zapp\zapph\pane.hpp"\
	"..\..\..\devtools\zapp\zapph\persist.hpp"\
	"..\..\..\devtools\zapp\zapph\platform.hpp"\
	"..\..\..\devtools\zapp\zapph\popupfr.hpp"\
	"..\..\..\devtools\zapp\zapph\presys.hpp"\
	"..\..\..\devtools\zapp\zapph\prjob.hpp"\
	"..\..\..\devtools\zapp\zapph\regimp.hpp"\
	"..\..\..\devtools\zapp\zapph\registry.hpp"\
	"..\..\..\devtools\zapp\zapph\resid.hpp"\
	"..\..\..\devtools\zapp\zapph\scroll.hpp"\
	"..\..\..\devtools\zapp\zapph\scroller.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.hpp"\
	"..\..\..\devtools\zapp\zapph\sizer.inl"\
	"..\..\..\devtools\zapp\zapph\string.hpp"\
	"..\..\..\devtools\zapp\zapph\tab.hpp"\
	"..\..\..\devtools\zapp\zapph\task.hpp"\
	"..\..\..\devtools\zapp\zapph\text.hpp"\
	"..\..\..\devtools\zapp\zapph\timer.hpp"\
	"..\..\..\devtools\zapp\zapph\w32plat.hpp"\
	"..\..\..\devtools\zapp\zapph\window.hpp"\
	"..\..\..\devtools\zapp\zapph\winmap.hpp"\
	"..\..\..\devtools\zapp\zapph\zapp.inl"\
	"..\..\..\devtools\zapp\zapph\zappole.hpp"\
	"..\..\..\devtools\zapp\zapph\zbase.hpp"\
	"..\..\..\devtools\zapp\zapph\zslist.hpp"\
	".\AgeVec.h"\
	".\Bool.h"\
	".\Calendar.h"\
	".\Ceiling.h"\
	".\CNR.h"\
	".\Cohort.h"\
	".\Fishery.h"\
	".\FisheryList.h"\
	".\FisherySummary.h"\
	".\FisheryTactics.h"\
	".\FixedEscStock.h"\
	".\globals.h"\
	".\Harvest.h"\
	".\HarvestList.h"\
	".\HarvestTactics.h"\
	".\HvSummary.h"\
	".\IEnum.h"\
	".\implicit.h"\
	".\implicit_base.h"\
	".\interfaceDataControl.h"\
	".\NamedPtrVec.h"\
	".\Phase.h"\
	".\Policies.h"\
	".\Production.h"\
	".\smart_ptr.h"\
	".\smart_ptr.i"\
	".\Stock.h"\
	".\StockConfig.h"\
	".\StockList.h"\
	".\StockSummary.h"\
	".\Summary.h"\
	".\ZasGraphUpdateMed.h"\
	".\ZasMediatorFactory.h"\
	".\ZasMenuConst.h"\
	".\ZatConstants.h"\
	".\ZatDefines.h"\
	".\ZatDialogBase.h"\
	".\ZatDialogConstants.h"\
	".\ZatDialogMedBase.h"\
	".\ZatGraphDialog.h"\
	".\ZatGraphicPane.h"\
	".\ZatItem.h"\
	".\ZatRowColumnBox.h"\
	".\zcGraphMediator.h"\
	".\zcMouseTool.h"\
	".\zcMouseToolCrisp2.h"\
	

!IF  "$(CFG)" == "crisp2 - Win32 Release"


"$(INTDIR)\zcMouseToolCrisp2.obj" : $(SOURCE) $(DEP_CPP_ZCMOUS) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "crisp2 - Win32 Debug"


"$(INTDIR)\zcMouseToolCrisp2.obj"	"$(INTDIR)\zcMouseToolCrisp2.sbr" : $(SOURCE)\
 $(DEP_CPP_ZCMOUS) "$(INTDIR)"


!ENDIF 


!ENDIF 

