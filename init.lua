
-- get mod path
local mpath = minetest.get_modpath("vehicle_mash")

-- load framework
dofile(mpath.."/framework.lua")

-- ***********************
-- load vehicles down here
-- ***********************

-- ** 126r and F1 **
------------------------------------------------------------------------------
-- create Cars common def
local cars_def = {
	--model specific stuff
	is_boat = false,
	visual = "mesh",
	visual_size = {x=1, y=1},
	wield_scale = {x=1, y=1, z=1},
	--player specific stuff
	player_rotation = {x=0,y=90,z=0},
	driver_eye_offset = {x=0, y=0, z=0},
	number_of_passengers = 0,
	passenger_attach_at = {x=0,y=0,z=0},
	passenger_eye_offset = {x=0, y=0, z=0},
	--drop
	drop_on_destroy = ""
}

-- change definition values in the following files if
-- you want a specific vehicle to act differently
loadfile(mpath.."/126r.lua")(table.copy(cars_def))
loadfile(mpath.."/f1.lua")(table.copy(cars_def))


-- ** CAR01s **
------------------------------------------------------------------------------
-- create CAR01 common def
local car01_def = {
	--adjust to change how vehicle reacts while driving
	max_speed_forward = 10,
	max_speed_reverse = 5,
	accel = 2,
	braking = 4,
	turn_speed = 2,
	stepheight = 1.1,
	--model specific stuff
	is_boat = false,
	visual = "mesh",
	mesh = "car.x",
	visual_size = {x=1, y=1},
	wield_scale = {x=1, y=1, z=1},
	collisionbox = {-0.6, -0.05, -0.6, 0.6, 1, 0.6},
	onplace_position_adj = -0.45,
	--player specific stuff
	player_rotation = {x=0,y=90,z=0},
	driver_attach_at = {x=3.5,y=12,z=3.5},
	driver_eye_offset = {x=-4, y=0, z=0},
	number_of_passengers = 1,
	passenger_attach_at = {x=3.5,y=12,z=-3.5},
	passenger_eye_offset = {x=4, y=0, z=0},
	--drop and recipe
	drop_on_destroy = "",
	recipe = {}
}

-- change definition values in the following files if
-- you want a specific vehicle to act differently
loadfile(mpath.."/black.lua")(table.copy(car01_def))
loadfile(mpath.."/blue.lua")(table.copy(car01_def))
loadfile(mpath.."/brown.lua")(table.copy(car01_def))
loadfile(mpath.."/cyan.lua")(table.copy(car01_def))
loadfile(mpath.."/dark_green.lua")(table.copy(car01_def))
loadfile(mpath.."/dark_grey.lua")(table.copy(car01_def))
loadfile(mpath.."/green.lua")(table.copy(car01_def))
loadfile(mpath.."/grey.lua")(table.copy(car01_def))
loadfile(mpath.."/magenta.lua")(table.copy(car01_def))
loadfile(mpath.."/orange.lua")(table.copy(car01_def))
loadfile(mpath.."/pink.lua")(table.copy(car01_def))
loadfile(mpath.."/red.lua")(table.copy(car01_def))
loadfile(mpath.."/violet.lua")(table.copy(car01_def))
loadfile(mpath.."/white.lua")(table.copy(car01_def))
loadfile(mpath.."/yellow.lua")(table.copy(car01_def))
loadfile(mpath.."/hot_rod.lua")(table.copy(car01_def))
loadfile(mpath.."/nyan_ride.lua")(table.copy(car01_def))
loadfile(mpath.."/oerkki_bliss.lua")(table.copy(car01_def))
loadfile(mpath.."/road_master.lua")(table.copy(car01_def))


-- ** MeseCars **
------------------------------------------------------------------------------
-- create Mesecar common def
local mese_def = {
	--adjust to change how vehicle reacts while driving
	max_speed_forward = 15,
	max_speed_reverse = 7,
	accel = 3,
	braking = 6,
	turn_speed = 4,
	stepheight = 0.6,
	--model specific stuff
	is_boat = false,
	visual = "cube",
	mesh = "",
	visual_size = {x=1.5, y=1.5},
	--visual = "mesh",
	--mesh = "mesecar.b3d",
	--visual_size = {x=0.5, y=0.5},
	wield_scale = {x=1, y=1, z=1},
	collisionbox = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
	onplace_position_adj = 0.2,
	--player specific stuff
	player_rotation = {x=0,y=0,z=0},
	driver_attach_at = {x=0,y=0,z=0},
	driver_eye_offset = {x=0, y=0, z=0},
	number_of_passengers = 0,
	passenger_attach_at = {x=0,y=0,z=0},
	passenger_eye_offset = {x=0, y=0, z=0},
	--drop
	drop_on_destroy = ""
}

-- change definition values in the following files if
-- you want a specific vehicle to act differently
loadfile(mpath.."/mese_blue.lua")(table.copy(mese_def))
loadfile(mpath.."/mese_pink.lua")(table.copy(mese_def))
loadfile(mpath.."/mese_purple.lua")(table.copy(mese_def))
loadfile(mpath.."/mese_Yellow.lua")(table.copy(mese_def))
------------------------------------------------------------------------------

-- Boats
dofile(mpath.."/boat.lua")
dofile(mpath.."/rowboat.lua")

-- Hovercraft
--dofile(mpath.."/hover_blue.lua")

-- free unneeded global(s)
core.after(10, function()
	vehicle_mash.register_vehicle = nil
end)
