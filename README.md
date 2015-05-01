mod for Minetest: Vehicles_mash
by blert2112
version: 1.2

A merge of all the vehicles from:
"Cars" by Radoslaw Slowik
"Mesecars" by paramat
"Car" by Esteban
"Boats" by PilzAdam

- 26 vehicles currently
- Disable vehicles by commenting out it's 'dofile' line in init.lua
- Adding new vehicles is a simple matter of:
	- create/aquire vehicle model and textures
	- create, and name appropriately, a new .lua file for the vehicle based on one of the existing ones
	- change settings in the file you created to reflect the new vehicle
	- add a new line to init.lua to load the vehicle 'dofile(minetest.get_modpath("vehicle_mash").."/NAME_OF_VEHICLE.lua")'

***[i]rename folder to "vehicle_mash" if necessary[/i]***

[b][u]License[/u][/b]
All licenses of previous works, of course, apply. (see credits below)
As far as the work I did... It's really just a fork of a fork of a fork of a fork, tossed it all into a blender and spun it on puree for a bit. Baked it for a while and set it on the counter to cool. What I mean is, make what you will of it, it matters not to me.

[b][u]Dependencies[/u][/b]
- Default

[b][u]To Do[/u][/b]
- make little guy sit straight forward
- crafting

[b][u]Change Log[/u][/b]
v1.2 5/1/2015 
- added boats
- changed name so  to not conflict with other mods
v1.1 4/25/2015
- car won't come to a complete stop (fixed)
v1.0 4/24/2015
- first release

[b][u][i]CREDIT WHERE CREDIT IS DUE[/i][/u][/b]
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

I am sure many others deserve mention. If you feel left out let me know and I will add you in.

Enjoy!