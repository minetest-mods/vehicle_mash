# **Vehicle_mash**
- Current version: 2.1.0
- By blert2112

A merge of all the vehicles from:
- "Cars" by Radoslaw Slowik.
- "Mesecars" by paramat.
- "Car" by Esteban.
- "Boats" by PilzAdam.
- "Hovercraft" by Stuart Jones.

- 30 vehicles currently.
- Certain vehicles can now carry passengers. Currently one passenger max.

- Disable vehicles by commenting out it's 'dofile' line in init.lua
- Adding new vehicles is a simple matter of:
	- create/aquire vehicle model and textures
	- create, and name appropriately, a new .lua file for the vehicle based on one of the existing ones
	- change settings in the file you created to reflect the new vehicle
	- add a new line to init.lua to load the vehicle 'dofile(minetest.get_modpath("vehicle_mash").."/NAME_OF_VEHICLE.lua")'

## **Installation**
- Unzip the archive, rename the folder to "vehicle_mash" (**without the quotes**) and place it in
../minetest/mods/

- GNU/Linux: If you use a system-wide installation place
it in ~/.minetest/mods/.

- If you only want this to be used in a single world, place
the folder in worldmods/ in your world directory.


For further information or help, see:
https://wiki.minetest.net/Installing_Mods

## **License**
All licenses of previous works, of course, apply. (see credits below)
As far as the work I did... It's really just a fork of a fork of a fork of a fork, tossed it all into a blender and spun it on puree for a bit. Baked it for a while and set it on the counter to cool. What I mean is, make what you will of it, it matters not to me.

## **Dependencies**
- default (included in minetest_game)
- lib_mount

## **Requirements**
* "vehicle_mash" 2.1.0 for MT/MTG 5.0.0+.
* "vehicle_mash" 2.0 for MT/MTG 0.4.12+ (may work on older versions).

## **To-Do**
- crafting

## **Changelog** 


v2.1 6/10/2019

*	 Fix attachment positions for drivers/passengers on all vehicles.
*	 Adds red, green, and yellow hovercrafts.
*	 Use "mod.conf" for name, description and dependencies.
*	 Support for MT/MTG 5.0.0+ (may not work with official dev-builds).
	
	
v2.0 8/13/2016

*	 converted to use the lib_mount mod for "driving"
*	 enlarged F1 and 126r models x2.5
*	 added yellow Mesecar
*	 updated boat model from default boat mod
*	 various speed/braking/turning/acceleration tweaks
*	 various collision box tweaks
*	 various other tweaks I probably forgot about
*	 last version supporting MT/MTG 0.4.12+.
	
		
v1.4 5/19/2015

*	 attach (one) passenger added
*	 reorganized vehicle definition file code and added some variables pertaining to passengers
*	 added a vehicle definition file template with comments
*	 cleaned up to remove code dulplication
	
	
v1.3 5/5/2015

*	 player now sits forward in vehicles
*	 tweaked player sit positions
*	 tweaked collison boxes
*	 proper placement on_ground/in_water
	
	
v1.2 5/1/2015

*	 added boats
*	 changed name so  to not conflict with other mods
	
	
v1.1 4/25/2015

*	 car won't come to a complete stop (fixed)
	
	
v1.0 4/24/2015

*	first release



## **Bugs, suggestions and new features**
Report bugs or suggest ideas by [creating an issue](https://github.com/blert2112/vehicle_mash/issues/new).      
If you know how to fix an issue, consider opening a [pull request](https://github.com/blert2112/vehicle_mash/compare).


## **Credit where credit is due**
- F1 and 126R cars from: "Cars" by Radoslaw Slowik
	- https://forum.minetest.net/viewtopic.php?f=9&t=8698
	- License: Code WTFPL, modeles/textures CC BY-NC-ND 4.0

- Black, Blue, Brown, Cyan, Dark Green, Dark Grey, Green, Grey, Magenta, Orange, Pink, Red, Violet, White, Yellow, Hot Rod, Nyan Ride, Oerkki Bliss, and Road Master from: "Car" by Esteban
	- https://forum.minetest.net/viewtopic.php?f=13&t=7407
	- License:
		- No info given in that mod but I am going to assume the credit for the original model goes to:
		- Melcor and his CAR01 model
		- https://forum.minetest.net/viewtopic.php?f=9&t=6512
		- License: CC-BY-NC-SA

- MeseCars from: "Mesecars" by paramat
	- https://forum.minetest.net/viewtopic.php?f=11&t=7967
	- Licenses: Code WTFPL, textures CC BY-SA

- Boats from "Boats" by PilzAdam
	- textures: Zeg9
	- model: thetoon and Zeg9, modified by PavelS(SokolovPavel)
	- License: WTFPL

- Hovercraft from "Hovercraft" by Stuart Jones
	- Licenses:
		- textures: CC-BY-SA
		- sounds: freesound.org
			- Rocket Boost Engine Loop by qubodup - CC0
			- CARTOON-BING-LOW by kantouth - CC-BY-3.0
			- All other sounds: Copyright Stuart Jones - CC-BY-SA

I am sure many others deserve mention. If you feel left out let me know and I will add you in.

Enjoy!
