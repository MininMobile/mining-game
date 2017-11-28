# Mining Game (For Python)

# Import Modules
import time
import os
from sys import platform
from random import randint

# Define Variables
copperOre = 0
aluminiumOre = 0
ironOre = 0
copper = 0
aluminium = 0
iron = 0
compound = 0
resin = 0
tank = 10
uses = 0
foundStructure = 0
fuel = 0
solarPanels = 0
unlockedFuelC = False
unlockedPrint = False
fuelCondBuilt = False
upgraderBuilt = False
smelteryBuilt = False
printerBuilt = False
fuelCondPower = "Empty"
_MAIN = True
menu = "N/A"

# Define Functions
# Clear Screen Function
if platform == "linux" or platform == "linux2":
	clear = lambda: os.system("clear")
elif platform == "darwin":
	clear = lambda: os.system("clear && printf '\e[3J'")
elif platform == "win32":
	clear = lambda: os.system("cls")
else:
	cllear = lambda: os.system("clear")

# Wait Function
def wait(x):
	time.sleep(x)

# Create Branches
def main_mine(): # Mine Branch
	clear()
	global compound
	global resin
	global copperOre
	global aluminiumOre
	global ironOre
	for i in range(0, tank):
		compound += randint(1, 10)
		resin += randint(1, 10)
		copperOre += randint(1, 5)
		aluminiumOre += randint(1, 5)
		ironOre += randint(1, 5)
	print("Material Mined (in total)")
	print(" ")
	print("Compound: " + str(compound))
	print("Resin: " + str(resin))
	print("Copper Ore: " + str(copperOre))
	print("Aluminium Ore: " + str(aluminiumOre))
	print("Iron Ore: " + str(ironOre))
	print(" ")
	input("Press enter to return... ")
def main_explore(): # Explore Branch
	clear()
	discover = 0
	global unlockedFuelC
	global unlockedPrint
	global fuelCondBuilt
	global printerBuilt
	for i in range(1, tank):
		discover = randint(0, 1)
	if bool(discover):
		print("You found a strange structure.")
		menu = input("Explore? (Y/N) ")
		if menu == "n":
			print("lol bie")
		else:
			print("You enter the structure.")
			print("Outside it looks like a crashes satellite,")
			print("But inside it looks like an abandoned spaceship.")
			input()
			if not unlockedFuelC: 
				print("You see something that looks like a blueprint")
				print("for a machine that produces fuel out of energy.")
				menu = input("Examine? (Y/N) ")
				if menu == "n":
					print("It was probably a trap anyway...")
				else:
					print("You have picked it up.")
					input()
					unlockedFuelC = True
					print("You have researched and unlocked the Fuel Condenser!")
					print("Now, you can add it to your base in the build menu.")
			elif not unlockedPrint:
				print("You see something that looks like a blueprint")
				print("for a machine that looks like a 3D Printer.")
				menu = input("Examine? (Y/N) ")
				if menu == "n":
					print("It was probably a trap anyway...")
				else:
					print("You have picked it up.")
					input()
					unlockedPrint = True
					print("You have researched and unlocked the Printer!")
					print("Now, you can add it to your base in the build menu.")
			print(" ")
			print("There's nothing left to explore,")
			input("Press enter to return to base... ")
	else:
		print("You didn't find anything of intrest...")
		input("Press enter to return... ")
def main_base(): # Base/Build Branch
	global resin
	global unlockedPrint
	global unlockedFuelC
	global fuelCondBuilt
	global upgraderBuilt
	global smelteryBuilt
	global printerBuilt
	_BASE = True
	while _BASE:
		clear()
		print("Your Base")
		print(" ")
		print("0) Return to Menu")
		print("1) Build Menu")
		if fuelCondBuilt: print("f) Fuel Condenser")
		if upgraderBuilt: print("u) Upgrader")
		if smelteryBuilt: print("s) Smeltery")
		if printerBuilt: print("p) Printer")
		print(" ")
		menu = input()
		if menu == "0":
			_BASE = False
		elif menu == "1":
			_BUILD = True
			while _BUILD:
				clear()
				print("Build Menu")
				print(" ")
				print("0) Return to Base")
				if not fuelCondBuilt and unlockedFuelC: print("f) Fuel Condenser")
				if not printerBuilt and unlockedPrint: print("p) Printer")
				if not upgraderBuilt: print("u) Upgrader")
				if not smelteryBuilt: print("s) Smeltery")
				print(" ")
				menu = input()
				if menu == "0":
					_BUILD = False
				elif menu == "f":
					if not fuelCondBuilt and unlockedFuelC:
						print("Build 'Fuel Condenser' for 50 Resin?")
						menu = input("(Y/N) ")
						if menu == "y":
							if resin >= 50:
								print("Building... (10 Seconds)")
								wait(10)
								resin -= 50
								fuelCondBuilt = True
							else:
								print("Not enough Resin!")
								input()
				elif menu == "p":
					if not printerBuilt and unlockedPrint:
						print("Build 'Printer' for 200 Resin?")
						menu = input("(Y/N) ")
						if menu == "y":
							if resin >= 200:
								print("Building... (10 Seconds)")
								wait(10)
								resin -= 200
								printerBuilt = True
							else:
								print("Not enough Resin!")
								input()
				elif menu == "u":
					if not upgraderBuilt:
						print("Build 'Upgrader' for 200 Resin?")
						menu = input("(Y/N) ")
						if menu == "y":
							if resin >= 200:
								print("Building... (10 Seconds)")
								wait(10)
								resin -= 200
								upgraderBuilt = True
							else:
								print("Not enough Resin!")
								input()
				elif menu == "s":
					if not smelteryBuilt:
						print("Build 'Smeltery' for 100 Resin?")
						menu = input("(Y/N) ")
						if menu == "y":
							if resin >= 100:
								print("Building... (10 Seconds)")
								wait(10)
								resin -= 100
								smelteryBuilt = True
							else:
								print("Not enough Resin!")
								input()
		elif menu == "f":
			if fuelCondBuilt and unlockedFuelC: main_base_fc()
		elif menu == "p":
			if printerBuilt and unlockedPrint: main_base_pr()
		elif menu == "s":
			if smelteryBuilt: main_base_sm()
		elif menu == "u":
			if upgraderBuilt: main_base_up()
def main_base_fc(): # Fuel Condenser Branch
	global fuel
	global solarPanels
	global fuelCondPower
	_CONDENSER = True
	while _CONDENSER:
		clear()
		print("Fuel Condenser")
		print(" ")
		if fuelCondPower == "Empty":
			print("Container [Empty]")
			print(" ")
			print("1) Insert Item")
			print("2) Collect Fuel")
			print("0) Back to Base")
			print(" ")
			menu = input()
			if menu == "0":
				_CONDENSER = False
			elif menu == "1":
				print("Select a Power Source")
				print(" ")
				print("1) Solar Panel")
				print("0) Cancel")
				print(" ")
				menu = input()
				if menu == "0":
					print("Operation Canceled")
				if menu == "1":
					if solarPanels >= 1:
						solarPanels -= 1
						fuelCondPower = "Solar Panel"
					else:
						print("You need at least one solar panel!")
						input()
			elif menu == "2":
				print("Please insert an item into the")
				print("Fuel Condenser to power it.")
				input()
		else:
			print("Container [" + fuelCondPower + "]")
			print(" ")
			print("1) Retrieve " + fuelCondPower)
			print("2) Collect Fuel")
			print("0) Back to Base")
			print(" ")
			menu = input()
			if menu == "0":
				_CONDENSER = False
			elif menu == "1":
				print("Extracting... (3 Seconds)")
				wait(3)
				if fuelCondPower == "Solar Panel": solarPanels += 1
				fuelCondPower = "Empty"
			elif menu == "2":
				print("Collecting... (5 Seconds)")
				wait(5)
				fuel += 1
				print("Recieved [1x Fuel]")
				input()
def main_base_pr(): # Printer Branch
	global solarPanels
	global aluminium
	_PRINT = True
	while _PRINT:
		clear()
		print("Printer")
		print(" ")
		print("1) Solar Panel")
		print("0) Back to Base")
		print(" ")
		menu = input()
		if menu == "0":
			_PRINT = False
		if menu == "1":
			print("Craft [1x Solar Panel] for 100 aluminium?")
			menu = input("(Y/N) ")
			if menu == "y":
				if aluminium >= 100:
					aluminium -= 100
					solarPanels += 1
				else:
					print("Not enough Aluminium!")
					input()
def main_base_up(): # Upgrader Branch
	global compound
	global tank
	_UPGRADE = True
	while _UPGRADE:
		clear()
		print("Upgrader")
		print(" ")
		print("1) Upgrade Tank - Longer Mining Sessions")
		print("0) Back to Base")
		print(" ")
		menu = input()
		if menu == "0":
			_UPGRADE = False
		elif menu == "1":
			print("Upgrade 'Oxygen Tank' for " + str((tank/2)*10) + " compound?")
			menu = input("(Y/N) ")
			if menu == "y":
				if compound >= (tank/2)*10:
					compound -= (tank/2)*10
					tank += 10
				else:
					print("Not enough Compound!")
					input()
def main_base_sm(): # Smelter Branch
	global copperOre
	global aluminiumOre
	global ironOre
	global copper
	global aluminium
	global iron
	_SMELTERY = True
	while _SMELTERY:
		clear()
		print("Smeltery")
		print(" ")
		print("0) Back to Base")
		print("1) Smelt Copper")
		print("2) Smelt Aluminium")
		print("3) Smelt Iron")
		print(" ")
		menu = input()
		if menu == "0":
			_SMELTERY = False
		elif menu == "1":
			print("Smelting... (5 seconds)")
			wait(5)
			copper += copperOre
			copperOre = 0
		elif menu == "2":
			print("Smelting... (5 seconds)")
			wait(5)
			aluminium += aluminiumOre
			aluminiumOre = 0
		elif menu == "3":
			print("Smelting... (5 seconds)")
			wait(5)
			iron += ironOre
			ironOre = 0
def main_inventory(): # Inventory Branch
	clear()
	print("Inventory:")
	print(" ")
	print("Ores")
	print("Copper: " + str(copperOre))
	print("Aluminium: " + str(aluminiumOre))
	print("Iron: " + str(ironOre))
	print(" ")
	print("Refined Ores")
	print("Copper: " + str(copper))
	print("Aluminium: " + str(aluminium))
	print("Iron: " + str(iron))
	print(" ")
	print("Materials")
	print("Compound: " + str(compound))
	print("Resin: " + str(resin))
	print(" ")
	print("Items")
	print("Solar Panels: " + str(solarPanels))
	print(" ")
	print("Stats")
	print("Oxygen Tank: " + str(tank) + "m")
	print("Fuel: " + str(fuel) + "l")
	print(" ")
	input("Press enter to return... ")

# Main Process
while _MAIN:
	clear()
	print("Mining Game")
	print(" ")
	print("1) Mine")
	print("2) Explore")
	print("3) Base")
	print("4) Inventory")
	print(" ")
	#print("s) Save Game")
	#print("l) Load Saved Game")
	#print("d) Delete Saved Game")
	#print(" ")
	print("0) Exit")
	print(" ")
	menu = input()
	if menu == "0":
		_MAIN = False
	elif menu == "1":
		main_mine()
	elif menu == "2":
		main_explore()
	elif menu == "3":
	 main_base()
	elif menu == "4":
		main_inventory()