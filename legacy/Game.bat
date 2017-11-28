@echo off
title Mining Game

cd C:\
mkdir LaximGames
cd LaximGames
mkdir MiningGame
cd MiningGame

if exist Save.bat goto LoadFound

:reset

rem Variable Initialization
rem Ore
set /a copperOre = 0
set /a aluminiumOre = 0
set /a ironOre = 0

rem Materials
set /a copper = 0
set /a aluminium = 0
set /a iron = 0

set /a compound = 0
set /a resin = 0

rem Misc
set /a tank = 10
set /a uses = 0
set /a foundStructure = 0
set /a fuel = 0

rem Items
set /a SolPan = 0

rem Base
set /a unlockedFuelC = 0
set /a unlockedPrint = o

rem Buildings
set /a fuelCondBuilt = 0
set /a upgraderBuilt = 0
set /a smelteryBuilt = 0 
set /a PrinterBuilt = 0

rem Base Data
set /a FuelCondPanel = 0

:menu
cls
echo Mining Game
echo.
echo 1) Mine
echo 2) Explore
echo 3) Base
echo 4) Inventory
echo.
echo s) Save
echo l) Load
echo d) Delete Save
set /p i=
if %i% == 1 goto Mine
if %i% == 2 goto Exp
if %i% == 3 goto Base
if %i% == 4 goto Inv
if %i% == s goto Save
If %i% == l goto Load
If %i% == d goto delSave
if %i% == ecsdee goto Cheats
goto menu

:Mine
set /a uses = 0
:Repeat
cls
echo Mining...
set /a uses = %uses%+1
set /a compound=%compound%+%random% %%10 +1
set /a resin=%resin%+%random% %%10 +1
set /a copperOre=%copperOre%+%random% %%5 +1
set /a aluminiumOre=%aluminiumOre%+%random% %%5 +1
set /a ironOre=%ironOre%+%random% %%5 +1
if %uses% == %tank% goto MineFin
goto repeat
:MineFin
cls
echo Mining finished after %tank% minutes!
echo Materials Dug (In Total);
echo.
echo Compound: %compound%
echo Resin: %Resin%
echo Copper Ore: %copperOre%
echo Aluminium Ore: %aluminiumOre%
echo Iron Ore: %ironOre%
echo.
echo Press any key to go to menu...
pause>nul
goto menu

:Exp
set /a uses = 0
:RepeatExp
cls
echo Exploring...
set /a uses = %uses%+1
set /a compound=%compound%+%random% %%3 +1
set /a resin=%resin%+%random% %%3 +1
set /a foundStructure=%random% %%2 +1
if %uses% == %tank% goto ExpFin
goto RepeatExp
:ExpFin
cls
echo Exploring finished after %tank% minutes!
echo Materials Found (In Total);
echo.
echo Compound: %compound%
echo Resin: %Resin%
echo.
if %foundStructure% == 2 goto ExploreStructure
echo Press any key to go to menu
pause>nul
goto menu
:ExploreStructure
echo You found a strange structure, explore? (Y/N)
echo.
set /p i=
if %i% == y goto expStruct
if %i% == n goto menu
goto ExpFin

:expStruct
cls
echo You enter the structure.
echo Outside it looks like a crashed satilite,
echo but inside, it looks like a adandoned space ship.
pause>nul
echo.
if %unlockedFuelC% == 1 goto skipFC
echo You see something that looks like a blueprint
echo for a machine that produces fuel out of energy.
echo.
echo Examine? (Y/N)
:pickItUp
set /p i=
if %i% == y goto pickedItUp
if %i% == n goto didntPickItUp
goto pickItUp
:pickedItUp
echo.
set /a unlockedFuelC = 1
echo You picked it up.
echo You have researched and unlocked Fuel Condenser!
echo Now, you can add it to your base in the build menu.
echo.
echo There's nothing left to explore,
echo Press any key to return to base...
pause>nul
goto menu
:didntPickItUp
echo.
echo It was probably a trap anyway.
echo.
echo There's nothing left to explore,
echo Press any key to return to base...
pause>nul
goto menu
:skipFC
if %unlockedPrint% == 1 goto skipPR
echo You see something that looks like a blueprint
echo for a machine that looks like a 3D printer.
echo.
echo Examine? (Y/N)
:pickItUp
set /p i=
if %i% == y goto pickedItUp2
if %i% == n goto didntPickItUp2
goto pickItUp
:pickedItUp2
echo.
set /a unlockedPrint = 1
echo You picked it up.
echo You have researched and unlocked Printer!
echo Now, you can add it to your base in the build menu.
echo.
echo There's nothing left to explore,
echo Press any key to return to base...
pause>nul
goto menu
:didntPickItUp2
echo.
echo It was probably a trap anyway.
echo.
echo There's nothing left to explore,
echo Press any key to return to base...
pause>nul
goto menu
:skipPR
echo It's empty in here...
echo.
echo Press any key to go back to home base...
pause>nul
goto menu

:Inv
cls
echo Inventory
echo.
echo Compound: %compound%
echo Resin: %Resin%
echo.
echo Ores
echo.
echo Copper Ore: %copperOre%
echo Aluminium Ore: %aluminiumOre%
echo Iron Ore: %ironOre%
echo.
echo Refined Materials
echo.
echo Copper: %copper%
echo Aluminium: %aluminium%
echo Iron: %iron%
echo.
echo Items
echo Solar Panels: %SolPan%
echo.
echo Stats
echo Tank Size: %tank%m
echo Fuel: %fuel%l
echo.
echo Press any key to go to menu...
pause>nul
goto menu

:Base
cls
echo Your Base
echo.
echo 0) Exit to Menu
echo 1) Build new machine
if %smelteryBuilt%== 1 goto bc1
goto skp1
:bc1
echo s) Smeltery
:skp1
if %upgraderBuilt% == 1 goto bc2
goto skp2
:bc2
echo u) Upgrader
:skp2
if %fuelCondBuilt% == 1 goto bc3
goto skp3
:bc3
echo f) Fuel Condenser
:skp3
if %PrinterBuilt% == 1 goto bc4
goto skp4
:bc4
echo p) Printer
:skp4
set /p i=
if %i% == 0 goto menu
if %i% == 1 goto build
if %i% == s goto smelteryCheck
if %i% == u goto upgraderCheck
if %i% == f goto fuelCondCheck
if %i% == p goto printerCheck
goto base

:smelteryCheck
if %smelteryBuilt% == 1 goto smeltery
cls
echo Naughty boy!
echo.
echo You need to build your smeltery first.
echo.
echo Press any key to go back to your base...
pause>nul
goto base

:smeltery 
cls
echo Smeltery
echo Choose a ore to refine;
echo.
echo 0) Exit to Base
echo.
echo 1) Copper
echo 2) Aluminium
echo 3) Iron
set /p i=
if %i% == 1 goto smeltCopper
if %i% == 2 goto smeltAluminium
if %i% == 3 goto smeltIron
if %i% == 0 goto base
goto smeltery
:smeltCopper
set /a copper = %copper%+%copperOre%
set /a copperOre = 0
goto smeltery
:smeltAluminium
set /a aluminium = %aluminium%+%aluminiumOre%
set /a aluminiumOre = 0
goto smeltery
:smeltIron
set /a iron = %iron%+%ironOre%
set /a ironOre = 0
goto smeltery

:upgraderCheck
if %upgraderBuilt% == 1 goto upgrader
cls
echo Naughty boy!
echo.
echo You need to build your upgrader first.
echo.
echo Press any key to go back to your base...
pause>nul
goto base

:Upgrader
cls
echo Upgrader
echo.
echo Do you want to upgrade your air tank?
echo This will give you 10 more minutes of mining.
echo.
echo Craft with 200 compound? (Y/N)
set /p i=
if %i% == y goto upgradeTank
if %i% == n goto base
goto Upgrader

:upgradeTank
if %compound% GEQ 200 goto ec
goto nec
:ec
set /a compound = %compound%-200
set /a tank = %tank%+10
cls
echo Upgrader
echo.
echo Tank Upgraded
echo.
echo Press any key to go back to your base...
pause>nul
goto base

:nec
cls
echo Upgrader
echo.
echo Not enough compound!
echo.
echo Press any key to go back to your base...
pause>nul
goto base

:fuelCondCheck
if %fuelCondBuilt% == 1 goto fuelCond
cls
echo Naughty boy!
echo.
echo You need to build/unlock your fuel condenser first.
echo.
echo Press any key to go back to your base...
pause>nul
goto base

:fuelCond
cls
echo Fuel condenser
echo.
if %FuelCondPanel% == 1 goto fuelCondCont
echo Container [No Solar Panel]
echo.
echo 0) Return to base
echo 1) Insert Solar Panel
echo 2) Collect Fuel
set /p i=
if %i% == 1 goto FuelCondPanelIns
if %i% == 2 goto CollectFuel2
if %i% == 0 goto base
goto fuelCond
:FuelCondPanelIns
if %SolPan% GTR 0 goto FuelCondPanelInsComp
clsglobal 
echo Fuel Condenser
echo.
echo No Solar Panels inside inventory.
echo.
echo Press any key to go back to base...
pause>nul
goto base
:FuelCondPanelInsComp
set /a SolPan = %SolPan%-1
set /a FuelCondPanel = 1
:fuelCondCont
cls
echo Fuel condenser
echo.
echo Container [Solar Panel]
echo.
echo 0) Return to base
echo 1) Remove Solar Panel
echo 2) Collect Fuel
set /p i=
if %i% == 1 goto FuelCondPanelRem
if %i% == 2 goto CollectFuel1
if %i% == 0 goto base
goto fuelCondCont
:FuelCondPanelRem
set /a SolPan = %SolPan%+1
set /a FuelCondPanel = 0
goto fuelCond
:CollectFuel1
cls
echo Fuel Condenser
echo.
set /a fuel = %fuel%+1
echo Recieved [1x Fuel]!
echo.
echo Press any key to go back to fuel condenser...
pause>nul
goto fuelCondCont
:CollectFuel2
cls
echo Fuel Condenser
echo.
echo Please insert a solar panel...
pause>nul
goto fuelCond

:printerCheck
if %printerBuilt% == 1 goto Printer
cls
echo Naughty boy!
echo.
echo You need to build/unlock your printer first.
echo.
echo Press any key to go back to your base...
pause>nul
goto base

:Printer
cls
echo Printer
echo.
echo Choose a item to create.
echo.
echo 0) Back
echo.
echo 1) Solar Panel
set /p i=
if %i% == 1 goto PrintSP
if %i% == 0 goto Menu
goto printer

:PrintSP
cls
echo Printer
echo.
echo Craft [1x Solar Panel] and use 100 Aluminium?
echo (Y/N)
set /p i=
if %i% == y goto PrintSP2
if %i% == n goto Printer
goto PrintSP

:PrintSP2
if %aluminium% LSS 100 goto no1
set /a aluminium = %aluminium%-100
set /a SolPan = %SolPan%+1
cls
echo Printer
echo.
echo You recievied [1x Solar Panel]
echo.
echo Press any key to go back to base...
pause>nul
goto base
:no1
cls
echo Not enough Resources!
pause>nul
goto Printer

:build
cls
echo Building Menu
echo Choose a machine to build;
echo.
echo 0) Back to Base
if %smelteryBuilt%== 0 goto bc1
goto skip1
:bc1
echo s) Smeltery - 100 Resin
:skip1
if %upgraderBuilt% == 0 goto bc2
goto skip2
:bc2
echo u) Upgrader - 200 Resin
:skip2
if %unlockedFuelC% == 1 goto bc3
goto skip3
:bc3
if %fuelCondBuilt% == 1 goto skip3
echo f) Fuel Condenser - 50 Resin
:skip3
if %unlockedPrint% == 1 goto bc4
goto skip4
:bc4
if %PrinterBuilt% == 1 goto skip4
echo p) Printer - 200 Resin
:skip4
set /p i=
if %i% == 0 goto base
if %i% == s goto smelteryBCheck
if %i% == u goto upgraderBCheck
if %i% == f goto fuelCondBCheck
if %i% == p goto PrinterBCheck
goto build

:smelteryBCheck
if %smelteryBuilt% == 1 goto ab1
if %resin% LSS 100 goto ne1
set /a resin = %resin%-100
set /a smelteryBuilt = 1
goto build
:ne1
cls
echo Not enough Resin!
pause>nul
goto build
:ab1
cls
echo Smeltery already built!
pause>nul
goto build

:upgraderBCheck
if %upgraderBuilt% == 1 goto ab2
if %resin% LSS 200 goto ne2
set /a resin = %resin%-200
set /a upgraderBuilt = 1
goto build
:ne2
cls
echo Not enough Resin!
pause>nul
goto build
:ab2
cls
echo Upgrader already built!
pause>nul
goto build

:fuelCondBCheck
if %unlockedFuelC% == 0 goto nu1
if %fuelCondBuilt% == 1 goto ab3
if %resin% LSS 50 goto ne3
set /a resin = %resin%-50
set /a fuelCondBuilt = 1
goto build
:ne3
cls
echo Not enough Resin!
pause>nul
goto build
:ab3
cls
echo Fuel Condenser already built!
pause>nul
goto build
:nu1
cls
echo Not unlocked yet!
pause>nul
goto build

:printerBCheck
if %unlockedPrint% == 0 goto nu2
if %PrinterBuilt% == 1 goto ab4
if %resin% LSS 200 goto ne4
set /a resin = %resin%-200
set /a PrinterBuilt = 1
goto build
:ne4
cls
echo Not enough Resin!
pause>nul
goto build
:ab4
cls
echo Printer already built!
pause>nul
goto build
:nu2
cls
echo Not unlocked yet!
pause>nul
goto build

:Cheats
cls
echo Congratulations!
echo You found the debug menu!
echo.
echo 0) Menu
echo 1) Build Smeltery
echo 2) Build Upgrader
echo 3) Unlock Fuel Condenser
echo 4) Build and Unlock Fuel Condenser
echo 5) Unlock Printer
echo 6) Build and Unlock Printer
set /p i=
if %i% == 1 goto buildSmelteryCheat
if %i% == 2 goto buildUpgraderCheat
if %i% == 3 goto unlockFCCheat
if %i% == 4 goto buildUnlockFCCheat
if %i% == 5 goto unlockPrinterCheat
if %i% == 6 goto buildUnlockPrinterCheat
if %i% == 0 goto menu
goto cheats

:buildSmelteryCheat
@echo on
echo hacking....
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
set /a smelteryBuilt = 1
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
@echo off
goto menu

:buildUpgraderCheat
@echo on
echo hacking....
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
set /a upgraderBuilt = 1
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
@echo off
goto menu

:unlockFCcheat
@echo on
echo hacking....
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
set /a unlockedFuelC = 1
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
@echo off
goto menu

:buildUnlockFCcheat
@echo on
echo hacking....
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
set /a unlockedFuelC = 1
set /a fuelCondBuilt = 1
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
@echo off
goto menu

:unlockPrinterCheat
@echo on
echo hacking....
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
set /a unlockedPrint = 1
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
@echo off
goto menu

:buildUnlockPrinterCheat
@echo on
echo hacking....
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
set /a unlockedPrint = 1
set /a PrinterBuilt = 1
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
echo %random%
@echo off
goto menu

:LoadFound
cls
echo A save has been detected!
echo.
echo Do you want to load? (Y/N)
set /p i=
if %i% == y goto loadConfirm
if %i% == n goto reset
goto LoadFound

:Load
cls
echo Do you want to load?
echo.
echo Your items will get replaced! (Y/N)
set /p i=
if %i% == y goto loadConfirm
if %i% == n goto menu
goto Load

:loadConfirm
cls
echo Loading...
cd C:\LaximGames\MiningGame
if exist Save.bat goto loadSave
goto noLoadFile
:loadSave
call Save.bat
goto menu
:noLoadFile
echo 404 Error! No save file found!
echo.
echo Press any key to go to main menu...
pause>nul
goto menu

:save
cls
echo Saving...
@echo on
cd C:\LaximGames\MiningGame
echo set /a copperOre = %copperOre% > Save.bat
echo set /a aluminiumOre = %aluminiumOre% >> Save.bat
echo set /a ironOre = %ironOre% >> Save.bat
echo set /a copper = %copper% >> Save.bat
echo set /a aluminium = %aluminium% >> Save.bat
echo set /a iron = %iron% >> Save.bat
echo set /a compound = %compound% >> Save.bat
echo set /a resin = %resin% >> Save.bat
echo set /a tank = %tank% >> Save.bat
echo set /a upgraderBuilt = %upgraderBuilt% >> Save.bat
echo set /a smelteryBuilt = %smelteryBuilt% >> Save.bat
echo set /a fuelCondBuilt = %fuelCondBuilt% >> Save.bat
echo set /a unlockedFuelC = %unlockedFuelC% >> Save.bat
echo set /a unlockedPrint = %unlockedPrint% >> Save.bat
echo set /a PrinterBuilt = %PrinterBuilt% >> Save.bat
echo set /a fuel = %fuel% >> Save.bat
echo set /a SolPan = %SolPan% >> Save.bat
echo set /a FuelCondPanel = %FuelCondPanel% >> Save.bat
@echo off
echo.
echo Note: Saving will only occasionally work in administrator mode.
echo If you see 'Access is denied' please restart the game in administrator mode.
echo.
echo Save finished!
echo.
echo Press any key to go to menu...
pause>nul
goto menu

:delSave
cls
echo Delete saved game?
echo.
echo Do you want to wipe your progress? (Y/N)
set /p i=
if %i% == y goto delSaveConfirm
if %i% == n goto menu
goto load

:delSaveConfirm
cls
echo Deleting...
cd C:\LaximGames\MiningGame
if exist Save.bat goto delSaveS1
goto noSaveFile
:delSaveS1
del Save.bat
goto menu
:noSaveFile
echo 404 Error! No save file found!
echo.
echo Press any key to go to main menu...
pause>nul
goto menu