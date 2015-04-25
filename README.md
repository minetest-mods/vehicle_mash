mod for Minetest: Cars
by: blert
version: 1.0.4.24.2015 (major.minor.month.day.year)

A merge of the three car mods I could find on the MineTest forum into a more API-like mod.

Adding new cars is a simple matter of:
	- create/aquire car model and textures
	- create, and name appropriately, a new .lua file for the car based on one of the existing ones
		- change settings in the file you created to reflect the new car
	- add a new line to init.lua to load the car
		- dofile(minetest.get_modpath("cars").."/NAME_OF_CAR.lua")

No crafting yet. Use Creative or /give.

***Compatability***
-------------------
	Good Luck!
	Not tested with other car mods.
	Directly conflicts with the "Cars" mod by Radoslaw Slowik
		because the mod names are the same.


***To Do***
-----------
	- crafting


***CREDIT WHERE CREDIT IS DUE***
--------------------------------
	inspired by MOBS_REDO by TenPlus1
	https://forum.minetest.net/viewtopic.php?f=11&t=991

	F1 and 126R cars from:
		"Cars" by Radoslaw Slowik
		https://forum.minetest.net/viewtopic.php?f=9&t=8698
		License:
			Sourcecode: WTFPL, http://sam.zoy.org/wtfpl/
			Models, Graphics & Sounds: CC BY-NC-ND 4.0 International, http://creativecommons.org/licenses/by-nc-nd/4.0/

	Black, Blue, Brown, Cyan, Dark Green, Dark Grey, Green, Grey, Magenta, Orange,Pink,
	Red, Violet, White, Yellow, Hot Rod, Nyan Ride, Oerkki Bliss, and Road Master from:
		"Car" by Esteban
		https://forum.minetest.net/viewtopic.php?f=13&t=7407
		License:
			No info given in that mod but I am going to assume the credit for the
			original model goes to:
				Melcor and his CAR01 model
				https://forum.minetest.net/viewtopic.php?f=9&t=6512
				License: CC-BY-NC-SA http://creativecommons.org/licenses/by-nc-sa/3.0/

	MeseCars from:
		"Mesecars" by paramat
		https://forum.minetest.net/viewtopic.php?f=11&t=7967
		Licenses:
			Code WTFPL, textures CC BY-SA

	Much of the above is based on (or forked from):
		PilzAdam's boat mod

	I am sure many others deserve mention.
	If you feel left out let me know and I will add you in.


***License***
-------------
	Whatever... blah, blah, blah.
	Respect the work of others and give credit where credit is due.




