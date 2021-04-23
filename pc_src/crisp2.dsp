# Microsoft Developer Studio Project File - Name="crisp2" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 5.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

CFG=crisp2 - Win32 Release
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "crisp2.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "crisp2.mak" CFG="crisp2 - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "crisp2 - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE "crisp2 - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE 

# Begin Project
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "crisp2 - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "\WORKSHOP\CRISP2\OUTPUT"
# PROP Intermediate_Dir "\WORKSHOP\CRISP2\OBJ"
# PROP Ignore_Export_Lib 0
# ADD BASE CPP /nologo /W3 /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /FR /YX /c
# ADD CPP /nologo /MTd /W3 /Gm /Gi /GX /Zi /Od /I "\rwav\workspaces\Winnt4\Msvc50\15s\include" /I "\rwav\workspaces\Winnt4\Msvc50\15s" /D _X86_=1 /D "NOMINMAX" /D "OEMRESOURCE" /D "_DEBUG" /D Z_DB=1 /D RW_RWV12_STDLIB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR /YX /FD /c
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 zap15s.lib zip15s.lib zhp15s.lib tls15s.lib mth15s.lib std15s.lib uuid.lib ctl3d32s.lib libcmtd.lib libcimtd.lib oldnames.lib kernel32.lib advapi32.lib user32.lib gdi32.lib comdlg32.lib comctl32.lib winspool.lib shell32.lib ole32.lib oleaut32.lib /nologo /subsystem:windows /incremental:no /debug /machine:I386 /nodefaultlib /out:"\WORKSHOP\CRISP2\OUTPUT/crisphv3.exe" /libpath:"\rwav\workspaces\Winnt4\Msvc50\15s\lib"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "crisp2 - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "crisp2__"
# PROP BASE Intermediate_Dir "crisp2__"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "RelOutput"
# PROP Intermediate_Dir "RelObj"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /G3 /ML /W3 /GX /Zi /Od /D _X86_=1 /D "NOMINMAX" /D RW_NO_STL=1 /D "_DEBUG" /D Z_DB=1 /D BMODE=DEBUG /D "RWDEBUG" /D "WIN32" /D "_WINDOWS" /D "_WIN32" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /FR /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "\rwav\workspaces\Winnt4\Msvc50\12s\include" /I "\rwav\workspaces\Winnt4\Msvc50\12s" /D _X86_=1 /D "NOMINMAX" /D "OEMRESOURCE" /D RW_RWV12_STDLIB=1 /D "WIN32" /D "_WINDOWS" /D "_WIN32" /D "NDEBUG" /D Z_NP=1 /D __NT__=1 /D "_ZAPP_GUI_" /YX /FD /c
# SUBTRACT CPP /u /Fr
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 zap3s.lib zip3s.lib zhp3s.lib tls3s.lib uuid.lib ctl3d32s.lib libcd.lib libcid.lib oldnames.lib kernel32.lib advapi32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib shell32.lib ole32.lib oleaut32.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:no /debug /machine:I386 /nodefaultlib /out:"C:\WORKSHOP\CRISP2\OUTPUT/crisphv3.exe"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 zap12s.lib zip12s.lib zhp12s.lib tls12s.lib mth12s.lib std12s.lib uuid.lib ctl3d32s.lib libcmt.lib libcimt.lib oldnames.lib kernel32.lib advapi32.lib user32.lib gdi32.lib comdlg32.lib comctl32.lib winspool.lib shell32.lib ole32.lib oleaut32.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386 /nodefaultlib /out:"\WORKSHOP\CRISP2\RelOutput/crisphv3.exe" /libpath:"\rwav\workspaces\Winnt4\Msvc50\12s\lib"
# SUBTRACT LINK32 /pdb:none /debug

!ENDIF 

# Begin Target

# Name "crisp2 - Win32 Debug"
# Name "crisp2 - Win32 Release"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=.\Args.cpp
# End Source File
# Begin Source File

SOURCE=.\base_tokens.cpp
# End Source File
# Begin Source File

SOURCE=.\Bootstrap.cpp
# End Source File
# Begin Source File

SOURCE=.\c2main.cpp
# End Source File
# Begin Source File

SOURCE=.\Calendar.cpp
# End Source File
# Begin Source File

SOURCE=.\Calibrator.cpp
# End Source File
# Begin Source File

SOURCE=.\Ceiling.cpp
# End Source File
# Begin Source File

SOURCE=.\CeilingPolicy.cpp
# End Source File
# Begin Source File

SOURCE=.\clog.cpp
# End Source File
# Begin Source File

SOURCE=.\CNR.cpp
# End Source File
# Begin Source File

SOURCE=.\Cohort.cpp
# End Source File
# Begin Source File

SOURCE=.\command.cpp
# End Source File
# Begin Source File

SOURCE=.\Crisp2.rc
# End Source File
# Begin Source File

SOURCE=.\datFisheryCeilings.cpp
# End Source File
# Begin Source File

SOURCE=.\datIntDouble.cpp
# End Source File
# Begin Source File

SOURCE=.\debug.cpp
# End Source File
# Begin Source File

SOURCE=.\engine.cpp
# End Source File
# Begin Source File

SOURCE=.\Fishery.cpp
# End Source File
# Begin Source File

SOURCE=.\FisheryManagement.cpp
# End Source File
# Begin Source File

SOURCE=.\FisherySummary.cpp
# End Source File
# Begin Source File

SOURCE=.\FisheryTactics.cpp
# End Source File
# Begin Source File

SOURCE=.\FixedCombHarv.cpp
# End Source File
# Begin Source File

SOURCE=.\FixedEscapementPolicy.cpp
# End Source File
# Begin Source File

SOURCE=.\globals.cpp
# End Source File
# Begin Source File

SOURCE=.\GUI.cpp
# End Source File
# Begin Source File

SOURCE=.\Harvest.cpp
# End Source File
# Begin Source File

SOURCE=.\HarvestList.cpp
# End Source File
# Begin Source File

SOURCE=.\HarvestTactics.cpp
# End Source File
# Begin Source File

SOURCE=.\HatcheryProduction.cpp
# End Source File
# Begin Source File

SOURCE=.\HatchSurplusProduction.cpp
# End Source File
# Begin Source File

SOURCE=.\HvSummary.cpp
# End Source File
# Begin Source File

SOURCE=.\idcBPHR.cpp
# End Source File
# Begin Source File

SOURCE=.\idcCeilings.cpp
# End Source File
# Begin Source File

SOURCE=.\idcENH.cpp
# End Source File
# Begin Source File

SOURCE=.\idcEV.cpp
# End Source File
# Begin Source File

SOURCE=.\idcHRS.cpp
# End Source File
# Begin Source File

SOURCE=.\idcIDL.cpp
# End Source File
# Begin Source File

SOURCE=.\idcMR.cpp
# End Source File
# Begin Source File

SOURCE=.\idcPNV.cpp
# End Source File
# Begin Source File

SOURCE=.\implicit_base.cpp
# End Source File
# Begin Source File

SOURCE=.\include.cpp
# End Source File
# Begin Source File

SOURCE=.\init.cpp
# End Source File
# Begin Source File

SOURCE=.\IOCrud.cpp
# End Source File
# Begin Source File

SOURCE=.\log.cpp
# End Source File
# Begin Source File

SOURCE=.\mapController.cpp
# End Source File
# Begin Source File

SOURCE=.\mapObject.cpp
# End Source File
# Begin Source File

SOURCE=.\monte_tokens.cpp
# End Source File
# Begin Source File

SOURCE=.\MonteControl.cpp
# End Source File
# Begin Source File

SOURCE=.\MonteDataItem.cpp
# End Source File
# Begin Source File

SOURCE=.\MonteOutputItem.cpp
# End Source File
# Begin Source File

SOURCE=.\MonteStockIntrfc.cpp
# End Source File
# Begin Source File

SOURCE=.\MonteStockTracking.cpp
# End Source File
# Begin Source File

SOURCE=.\MonteTrackingItem.cpp
# End Source File
# Begin Source File

SOURCE=.\MultiCeilingPolicy.cpp
# End Source File
# Begin Source File

SOURCE=.\NaturalProduction.cpp
# End Source File
# Begin Source File

SOURCE=.\Parser.cpp
# End Source File
# Begin Source File

SOURCE=.\parseutil.cpp
# End Source File
# Begin Source File

SOURCE=.\Policy.cpp
# End Source File
# Begin Source File

SOURCE=.\Production.cpp
# End Source File
# Begin Source File

SOURCE=.\RandGen.cpp
# End Source File
# Begin Source File

SOURCE=.\RandNorm.cpp
# End Source File
# Begin Source File

SOURCE=.\ReadToken.cpp
# End Source File
# Begin Source File

SOURCE=.\Sample.cpp
# End Source File
# Begin Source File

SOURCE=.\simple_output.cpp
# End Source File
# Begin Source File

SOURCE=.\Simulation.cpp
# End Source File
# Begin Source File

SOURCE=.\State.cpp
# End Source File
# Begin Source File

SOURCE=.\statistics.cpp
# End Source File
# Begin Source File

SOURCE=.\Stock.cpp
# End Source File
# Begin Source File

SOURCE=.\StockCalib.cpp
# End Source File
# Begin Source File

SOURCE=.\StockConfig.cpp
# End Source File
# Begin Source File

SOURCE=.\StockSummary.cpp
# End Source File
# Begin Source File

SOURCE=.\String.cpp
# End Source File
# Begin Source File

SOURCE=.\Strtools.cpp
# End Source File
# Begin Source File

SOURCE=.\Token.cpp
# End Source File
# Begin Source File

SOURCE=.\version.cpp
# End Source File
# Begin Source File

SOURCE=.\ZasCalibration.cpp
# End Source File
# Begin Source File

SOURCE=.\ZasDialogMedBPHR.cpp
# End Source File
# Begin Source File

SOURCE=.\ZasDialogMedPNV.cpp
# End Source File
# Begin Source File

SOURCE=.\ZasGraphMedMonteCarlo.cpp
# End Source File
# Begin Source File

SOURCE=.\ZasGraphUpdateMed.cpp
# End Source File
# Begin Source File

SOURCE=.\ZasMapMedCrispHarvest.cpp
# End Source File
# Begin Source File

SOURCE=.\ZasMediatorFactory.cpp
# End Source File
# Begin Source File

SOURCE=.\ZasMonteCarlo.cpp
# End Source File
# Begin Source File

SOURCE=.\ZasTabDialogCeilings.cpp
# End Source File
# Begin Source File

SOURCE=.\ZasTabDialogENH.cpp
# End Source File
# Begin Source File

SOURCE=.\ZasTabDialogMedCeilings.cpp
# End Source File
# Begin Source File

SOURCE=.\ZasTabDialogMedENH.cpp
# End Source File
# Begin Source File

SOURCE=.\ZasTabDialogMedEV.cpp
# End Source File
# Begin Source File

SOURCE=.\ZasTabDialogMedHRS.cpp
# End Source File
# Begin Source File

SOURCE=.\ZasTabDialogMedIDL.cpp
# End Source File
# Begin Source File

SOURCE=.\ZasTabDialogMedMR.cpp
# End Source File
# Begin Source File

SOURCE=.\ZatCheckBoxGroup.cpp
# End Source File
# Begin Source File

SOURCE=.\ZatDialogBase.cpp
# End Source File
# Begin Source File

SOURCE=.\ZatDialogMedBase.cpp
# End Source File
# Begin Source File

SOURCE=.\ZatEditSliderBase.cpp
# End Source File
# Begin Source File

SOURCE=.\ZatEditSliderDouble.cpp
# End Source File
# Begin Source File

SOURCE=.\ZatEditSliderLong.cpp
# End Source File
# Begin Source File

SOURCE=.\ZatGraphDialog.cpp
# End Source File
# Begin Source File

SOURCE=.\ZatGraphicPane.cpp
# End Source File
# Begin Source File

SOURCE=.\ZatImplicitScroller.cpp
# End Source File
# Begin Source File

SOURCE=.\ZatMapMediator.cpp
# End Source File
# Begin Source File

SOURCE=.\ZatMapPane.cpp
# End Source File
# Begin Source File

SOURCE=.\ZatMercatorTransform.cpp
# End Source File
# Begin Source File

SOURCE=.\ZatPointTransform.cpp
# End Source File
# Begin Source File

SOURCE=.\ZatRowColumnBox.cpp
# End Source File
# Begin Source File

SOURCE=.\ZatTabDialog.cpp
# End Source File
# Begin Source File

SOURCE=.\ZatTabDialogMed.cpp
# End Source File
# Begin Source File

SOURCE=.\zcGM_YearAgeGraph.cpp
# End Source File
# Begin Source File

SOURCE=.\zcGM_YearGraph.cpp
# End Source File
# Begin Source File

SOURCE=.\zcGMF_AbundanceIndex.cpp
# End Source File
# Begin Source File

SOURCE=.\zcGMF_CatchPreterm.cpp
# End Source File
# Begin Source File

SOURCE=.\zcGMF_CatchTerminal.cpp
# End Source File
# Begin Source File

SOURCE=.\zcGMF_CatchTotal.cpp
# End Source File
# Begin Source File

SOURCE=.\zcGMF_InMortLegal.cpp
# End Source File
# Begin Source File

SOURCE=.\zcGMF_InMortSublegal.cpp
# End Source File
# Begin Source File

SOURCE=.\zcGMF_InMortTotal.cpp
# End Source File
# Begin Source File

SOURCE=.\zcGMH_HarvestGraphs.cpp
# End Source File
# Begin Source File

SOURCE=.\zcGMS_Abundance.cpp
# End Source File
# Begin Source File

SOURCE=.\zcGMS_CatchGraphs.cpp
# End Source File
# Begin Source File

SOURCE=.\zcGMS_CNRGraphs.cpp
# End Source File
# Begin Source File

SOURCE=.\zcGMS_Escapement.cpp
# End Source File
# Begin Source File

SOURCE=.\zcGMS_TrueTermRun.cpp
# End Source File
# Begin Source File

SOURCE=.\zcGraphMediator.cpp
# End Source File
# Begin Source File

SOURCE=.\zcMouseTool.cpp
# End Source File
# Begin Source File

SOURCE=.\zcMouseToolCrisp2.cpp
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl;fi;fd"
# Begin Source File

SOURCE=.\AgeVec.h
# End Source File
# Begin Source File

SOURCE=.\Args.h
# End Source File
# Begin Source File

SOURCE=.\base_tokens.h
# End Source File
# Begin Source File

SOURCE=.\Bool.h
# End Source File
# Begin Source File

SOURCE=.\Bootstrap.h
# End Source File
# Begin Source File

SOURCE=.\c2main.h
# End Source File
# Begin Source File

SOURCE=.\Calendar.h
# End Source File
# Begin Source File

SOURCE=.\Calibrator.h
# End Source File
# Begin Source File

SOURCE=.\Ceiling.h
# End Source File
# Begin Source File

SOURCE=.\CeilingPolicy.h
# End Source File
# Begin Source File

SOURCE=.\clog.h
# End Source File
# Begin Source File

SOURCE=.\CNR.h
# End Source File
# Begin Source File

SOURCE=.\cnrVisitor.h
# End Source File
# Begin Source File

SOURCE=.\Cohort.h
# End Source File
# Begin Source File

SOURCE=.\command.h
# End Source File
# Begin Source File

SOURCE=.\datFisheryCeilings.h
# End Source File
# Begin Source File

SOURCE=.\datFisheryPNV.h
# End Source File
# Begin Source File

SOURCE=.\datHarvestBPHR.h
# End Source File
# Begin Source File

SOURCE=.\datHarvestHRS.h
# End Source File
# Begin Source File

SOURCE=.\datIntDouble.h
# End Source File
# Begin Source File

SOURCE=.\datStockENH.h
# End Source File
# Begin Source File

SOURCE=.\datStockEV.h
# End Source File
# Begin Source File

SOURCE=.\datStockIDL.h
# End Source File
# Begin Source File

SOURCE=.\datStockMR.h
# End Source File
# Begin Source File

SOURCE=.\datTypes.h
# End Source File
# Begin Source File

SOURCE=.\dir.h
# End Source File
# Begin Source File

SOURCE=.\Fishery.h
# End Source File
# Begin Source File

SOURCE=.\FisheryList.h
# End Source File
# Begin Source File

SOURCE=.\FisheryManagement.h
# End Source File
# Begin Source File

SOURCE=.\FisherySummary.h
# End Source File
# Begin Source File

SOURCE=.\FisheryTactics.h
# End Source File
# Begin Source File

SOURCE=.\FixedCombHarv.h
# End Source File
# Begin Source File

SOURCE=.\FixedEscapementPolicy.h
# End Source File
# Begin Source File

SOURCE=.\FixedEscStock.h
# End Source File
# Begin Source File

SOURCE=.\FixedHarvestPolicy.h
# End Source File
# Begin Source File

SOURCE=.\globals.h
# End Source File
# Begin Source File

SOURCE=.\GUI.h
# End Source File
# Begin Source File

SOURCE=.\Harvest.h
# End Source File
# Begin Source File

SOURCE=.\HarvestList.h
# End Source File
# Begin Source File

SOURCE=.\HarvestTactics.h
# End Source File
# Begin Source File

SOURCE=.\HatcheryProduction.h
# End Source File
# Begin Source File

SOURCE=.\HatchSurplusProduction.h
# End Source File
# Begin Source File

SOURCE=.\HvSummary.h
# End Source File
# Begin Source File

SOURCE=.\idcBPHR.h
# End Source File
# Begin Source File

SOURCE=.\idcCeilings.h
# End Source File
# Begin Source File

SOURCE=.\idcENH.h
# End Source File
# Begin Source File

SOURCE=.\idcEV.h
# End Source File
# Begin Source File

SOURCE=.\idcHRS.h
# End Source File
# Begin Source File

SOURCE=.\idcIDL.h
# End Source File
# Begin Source File

SOURCE=.\idcMR.h
# End Source File
# Begin Source File

SOURCE=.\idcPNV.h
# End Source File
# Begin Source File

SOURCE=.\IEnum.h
# End Source File
# Begin Source File

SOURCE=.\implicit.h
# End Source File
# Begin Source File

SOURCE=.\implicit_base.h
# End Source File
# Begin Source File

SOURCE=.\include.h
# End Source File
# Begin Source File

SOURCE=.\init.h
# End Source File
# Begin Source File

SOURCE=.\interfaceDataControl.h
# End Source File
# Begin Source File

SOURCE=.\IOCrud.h
# End Source File
# Begin Source File

SOURCE=.\log.h
# End Source File
# Begin Source File

SOURCE=.\mapConstants.h
# End Source File
# Begin Source File

SOURCE=.\mapController.h
# End Source File
# Begin Source File

SOURCE=.\mapObject.h
# End Source File
# Begin Source File

SOURCE=.\mapPoint.h
# End Source File
# Begin Source File

SOURCE=.\monte_tokens.h
# End Source File
# Begin Source File

SOURCE=.\MonteControl.h
# End Source File
# Begin Source File

SOURCE=.\MonteDataItem.h
# End Source File
# Begin Source File

SOURCE=.\MonteOutputItem.h
# End Source File
# Begin Source File

SOURCE=.\MonteStockIntrfc.h
# End Source File
# Begin Source File

SOURCE=.\MonteStockTracking.h
# End Source File
# Begin Source File

SOURCE=.\MonteTrackingItem.h
# End Source File
# Begin Source File

SOURCE=.\MultiCeilingPolicy.h
# End Source File
# Begin Source File

SOURCE=.\NamedPtrVec.h
# End Source File
# Begin Source File

SOURCE=.\NaturalProduction.h
# End Source File
# Begin Source File

SOURCE=.\NonNeg.h
# End Source File
# Begin Source File

SOURCE=.\Parser.h
# End Source File
# Begin Source File

SOURCE=.\parseutil.h
# End Source File
# Begin Source File

SOURCE=.\Phase.h
# End Source File
# Begin Source File

SOURCE=.\Policies.h
# End Source File
# Begin Source File

SOURCE=.\Policy.h
# End Source File
# Begin Source File

SOURCE=.\Production.h
# End Source File
# Begin Source File

SOURCE=.\RandGen.h
# End Source File
# Begin Source File

SOURCE=.\RandNorm.h
# End Source File
# Begin Source File

SOURCE=.\ReadToken.h
# End Source File
# Begin Source File

SOURCE=.\sample.h
# End Source File
# Begin Source File

SOURCE=.\SeedPod.h
# End Source File
# Begin Source File

SOURCE=.\Simulation.h
# End Source File
# Begin Source File

SOURCE=.\smart_ptr.h
# End Source File
# Begin Source File

SOURCE=.\State.h
# End Source File
# Begin Source File

SOURCE=.\statistics.h
# End Source File
# Begin Source File

SOURCE=.\Stochastic.h
# End Source File
# Begin Source File

SOURCE=.\Stock.h
# End Source File
# Begin Source File

SOURCE=.\StockCalib.h
# End Source File
# Begin Source File

SOURCE=.\StockConfig.h
# End Source File
# Begin Source File

SOURCE=.\StockList.h
# End Source File
# Begin Source File

SOURCE=.\StockSummary.h
# End Source File
# Begin Source File

SOURCE=.\Strings.h
# End Source File
# Begin Source File

SOURCE=.\strtools.h
# End Source File
# Begin Source File

SOURCE=.\Summary.h
# End Source File
# Begin Source File

SOURCE=.\token.h
# End Source File
# Begin Source File

SOURCE=.\tokens.h
# End Source File
# Begin Source File

SOURCE=.\UI.h
# End Source File
# Begin Source File

SOURCE=.\UniformInt.h
# End Source File
# Begin Source File

SOURCE=.\ZasCalibration.h
# End Source File
# Begin Source File

SOURCE=.\ZasDialogMedBPHR.h
# End Source File
# Begin Source File

SOURCE=.\ZasDialogMedPNV.h
# End Source File
# Begin Source File

SOURCE=.\ZasGraphMedMonteCarlo.h
# End Source File
# Begin Source File

SOURCE=.\ZasGraphUpdateMed.h
# End Source File
# Begin Source File

SOURCE=.\ZasMapMedCrispHarvest.h
# End Source File
# Begin Source File

SOURCE=.\ZasMediatorFactory.h
# End Source File
# Begin Source File

SOURCE=.\ZasMenuConst.h
# End Source File
# Begin Source File

SOURCE=.\ZasMonteCarlo.h
# End Source File
# Begin Source File

SOURCE=.\ZasTabDialogCeilings.h
# End Source File
# Begin Source File

SOURCE=.\ZasTabDialogENH.h
# End Source File
# Begin Source File

SOURCE=.\ZasTabDialogMedCeilings.h
# End Source File
# Begin Source File

SOURCE=.\ZasTabDialogMedENH.h
# End Source File
# Begin Source File

SOURCE=.\ZasTabDialogMedEV.h
# End Source File
# Begin Source File

SOURCE=.\ZasTabDialogMedHRS.h
# End Source File
# Begin Source File

SOURCE=.\ZasTabDialogMedIDL.h
# End Source File
# Begin Source File

SOURCE=.\ZasTabDialogMedMR.h
# End Source File
# Begin Source File

SOURCE=.\ZatCheckBoxGroup.h
# End Source File
# Begin Source File

SOURCE=.\ZatConstants.h
# End Source File
# Begin Source File

SOURCE=.\ZatDefines.h
# End Source File
# Begin Source File

SOURCE=.\ZatDialogBase.h
# End Source File
# Begin Source File

SOURCE=.\ZatDialogConstants.h
# End Source File
# Begin Source File

SOURCE=.\ZatDialogMedBase.h
# End Source File
# Begin Source File

SOURCE=.\ZatEditSliderBase.h
# End Source File
# Begin Source File

SOURCE=.\ZatEditSliderDouble.h
# End Source File
# Begin Source File

SOURCE=.\ZatEditSliderLong.h
# End Source File
# Begin Source File

SOURCE=.\ZatGraphConstants.h
# End Source File
# Begin Source File

SOURCE=.\ZatGraphDialog.h
# End Source File
# Begin Source File

SOURCE=.\ZatGraphicPane.h
# End Source File
# Begin Source File

SOURCE=.\ZatImConScroller.h
# End Source File
# Begin Source File

SOURCE=.\ZatImplicitScroller.h
# End Source File
# Begin Source File

SOURCE=.\ZatImpTabCtrl.h
# End Source File
# Begin Source File

SOURCE=.\ZatItem.h
# End Source File
# Begin Source File

SOURCE=.\ZatMapMediator.h
# End Source File
# Begin Source File

SOURCE=.\ZatMapPane.h
# End Source File
# Begin Source File

SOURCE=.\ZatMercatorTransform.h
# End Source File
# Begin Source File

SOURCE=.\ZatPointTransform.h
# End Source File
# Begin Source File

SOURCE=.\ZatRowColumnBox.h
# End Source File
# Begin Source File

SOURCE=.\ZatTabDialog.h
# End Source File
# Begin Source File

SOURCE=.\ZatTabDialogMed.h
# End Source File
# Begin Source File

SOURCE=.\zcGM_YearAgeGraph.h
# End Source File
# Begin Source File

SOURCE=.\zcGM_YearGraph.h
# End Source File
# Begin Source File

SOURCE=.\zcGMF_AbundanceIndex.h
# End Source File
# Begin Source File

SOURCE=.\zcGMF_CatchGraphs.h
# End Source File
# Begin Source File

SOURCE=.\zcGMF_InMortGraphs.h
# End Source File
# Begin Source File

SOURCE=.\zcGMH_HarvestGraphs.h
# End Source File
# Begin Source File

SOURCE=.\zcGMS_Abundance.h
# End Source File
# Begin Source File

SOURCE=.\zcGMS_CatchGraphs.h
# End Source File
# Begin Source File

SOURCE=.\zcGMS_CNRGraphs.h
# End Source File
# Begin Source File

SOURCE=.\zcGMS_Escapement.h
# End Source File
# Begin Source File

SOURCE=.\zcGMS_TrueTermRun.h
# End Source File
# Begin Source File

SOURCE=.\zcGraphMediator.h
# End Source File
# Begin Source File

SOURCE=.\zcMouseTool.h
# End Source File
# Begin Source File

SOURCE=.\zcMouseToolCrisp2.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;cnt;rtf;gif;jpg;jpeg;jpe"
# Begin Source File

SOURCE=.\fish.bmp
# End Source File
# Begin Source File

SOURCE=.\fopen.bmp
# End Source File
# Begin Source File

SOURCE=.\fsave.bmp
# End Source File
# Begin Source File

SOURCE=.\goob.bmp
# End Source File
# Begin Source File

SOURCE=.\grid.bmp
# End Source File
# Begin Source File

SOURCE=.\help.bmp
# End Source File
# Begin Source File

SOURCE=.\hook.bmp
# End Source File
# Begin Source File

SOURCE=.\icon1.ico
# End Source File
# Begin Source File

SOURCE=.\map.bmp
# End Source File
# Begin Source File

SOURCE=.\mapBoat.bmp
# End Source File
# Begin Source File

SOURCE=.\mapBoat2.bmp
# End Source File
# Begin Source File

SOURCE=.\mapFish.bmp
# End Source File
# Begin Source File

SOURCE=.\mapFish2.bmp
# End Source File
# Begin Source File

SOURCE=.\mhelp.bmp
# End Source File
# Begin Source File

SOURCE=.\mouse.bmp
# End Source File
# Begin Source File

SOURCE=.\print.bmp
# End Source File
# Begin Source File

SOURCE=.\refresh.bmp
# End Source File
# Begin Source File

SOURCE=.\run.bmp
# End Source File
# Begin Source File

SOURCE=.\wand.bmp
# End Source File
# End Group
# Begin Source File

SOURCE=.\smart_ptr.i
# End Source File
# End Target
# End Project
