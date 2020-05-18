
-- get modpath
local mpath = minetest.get_modpath("vehicle_mash")

-- load framework
dofile(mpath.."/framework.lua")

-- load crafts
--dofile(mpath.."/crafts.lua")

-- ***********************
-- load vehicles down here
-- ***********************

-- ** 126r and F1 **
------------------------------------------------------------------------------
-- create Cars common def
local cars_def = {
	--adjust to change how vehicle reacts while driving
	terrain_type = 1,	-- 0 = air, 1 = land, 2 = liquid, 3 = land + liquid
	--model specific stuff
	visual = "mesh",
	visual_size = {x=1, y=1},
	wield_scale = {x=1, y=1, z=1},
	--player specific stuff
	player_rotation = {x=0,y=0,z=0},
	driver_eye_offset = {x=0, y=0, z=0},
	number_of_passengers = 0,
	passenger_attach_at = {x=0,y=0,z=0},
	passenger_eye_offset = {x=0, y=0, z=0},
	--drop and recipe
	drop_on_destroy = "",
	recipe = nil
}

local other_car_names = {
	"126r",
	"f1",
}

for _, name in ipairs(other_car_names) do
	if minetest.settings:get_bool("vehicle_mash.enable_" .. name .. "_car") then
		loadfile(mpath.. "/other_cars/" .. name .. ".lua")(table.copy(cars_def))
	end
end

-- ** CAR01s **
------------------------------------------------------------------------------
-- create CAR01 common def
local car01_def = {
	--adjust to change how vehicle reacts while driving
	terrain_type = 1,
	max_speed_forward = 10,
	max_speed_reverse = 7,
	accel = 2,
	braking = 4,
	turn_speed = 2,
	stepheight = 1.1,
	--model specific stuff
	visual = "mesh",
	mesh = "car.x",
	visual_size = {x=1, y=1},
	wield_scale = {x=1, y=1, z=1},
	collisionbox = {-0.6, -0.05, -0.6, 0.6, 1, 0.6},
	onplace_position_adj = -0.45,
	--player specific stuff
	player_rotation = {x=0,y=90,z=0},
	driver_attach_at = {x=3.5,y=3.7,z=3.5},
	driver_eye_offset = {x=-4, y=0, z=0},
	number_of_passengers = 1,
	passenger_attach_at = {x=3.5,y=3.7,z=-3.5},
	passenger_eye_offset = {x=4, y=0, z=0},
	--drop and recipe
	drop_on_destroy = "",
	recipe = nil
}

local car01_names = {
	"black", "blue", "brown", "cyan",
	"dark_green", "dark_grey", "green",
	"grey", "magenta", "orange",
	"pink", "red", "violet",
	"white", "yellow", "hot_rod",
	"nyan_ride", "oerkki_bliss", "road_master",
}

-- Load all CAR01's cars if enabled
for _, name in ipairs(car01_names) do
	if minetest.settings:get_bool("vehicle_mash.enable_" .. name .. "_car") then
		loadfile(mpath .. "/car01s/" .. name .. ".lua")(table.copy(car01_def))
	end
end

-- ** MeseCars **
------------------------------------------------------------------------------
-- create Mesecar common def
local mesecar_def = {
	--adjust to change how vehicle reacts while driving
	terrain_type = 1,
	max_speed_forward = 10,
	max_speed_reverse = 7,
	accel = 3,
	braking = 6,
	turn_speed = 4,
	stepheight = 0.6,
	--model specific stuff
	visual = "cube",
	mesh = "",
	visual_size = {x=1.5, y=1.5},
	wield_scale = {x=1, y=1, z=1},
	collisionbox = {-0.75, -0.75, -0.75, 0.75, 0.75, 0.75},
	onplace_position_adj = 0.25,
	--player specific stuff
	player_rotation = {x=0,y=0,z=0},
	driver_attach_at = {x=0,y=0,z=-2.0},
	driver_eye_offset = {x=0, y=0, z=0},
	number_of_passengers = 0,
	passenger_attach_at = {x=0,y=0,z=0},
	passenger_eye_offset = {x=0, y=0, z=0},
	--drop and recipe
	drop_on_destroy = "",
	recipe = nil
}

local mesecar_names = {
	"mese_blue",
	"mese_pink",
	"mese_purple",
	"mese_yellow",
}

-- Load all Mese Cars if enabled
for _, name in ipairs(mesecar_names) do
	if minetest.settings:get_bool("vehicle_mash.enable_" .. name .. "_car") then
		loadfile(mpath .. "/mesecars/mese_" .. name .. ".lua")(table.copy(mesecar_def))
	end
end

-- ** Boats **
------------------------------------------------------------------------------
-- create boats common def
local boat_def = {
	--adjust to change how vehicle reacts while driving
	terrain_type = 2,
	max_speed_forward = 3,
	max_speed_reverse = 3,
	accel = 3,
	braking = 3,
	turn_speed = 3,
	stepheight = 0,
	--model specific stuff
	visual = "mesh",
	visual_size = {x=1, y=1},
	wield_scale = {x=1, y=1, z=1},
	collisionbox = {-0.5, -0.35, -0.5, 0.5, 0.3, 0.5},
	onplace_position_adj = 0,
	textures = {"default_wood.png"},
	--player specific stuff
	player_rotation = {x=0, y=0, z=0},
	driver_attach_at = {x=0.5,y=1,z=-3},
	driver_eye_offset = {x=0, y=0, z=0},
	number_of_passengers = 0,
	passenger_attach_at = {x=0,y=0,z=0},
	passenger_eye_offset = {x=0, y=0, z=0}
}

local boat_names = {
	"boat",
	"rowboat",
}

-- Load boats if enabled
for _, name in ipairs(boat_names) do
	if minetest.settings:get_bool("vehicle_mash.enable_" .. name) then
		loadfile(mpath .. "/boats/" .. name .. ".lua")(table.copy(boat_def))
	end
end

-- ** Hovercraft **
------------------------------------------------------------------------------
-- create hovercraft common def
local hover_def = {
	--adjust to change how vehicle reacts while driving
	terrain_type = 3,
	max_speed_forward = 10,
	max_speed_reverse = 0,
	accel = 3,
	braking = 1,
	turn_speed = 2,
	stepheight = 1.1,
	--model specific stuff
	visual = "mesh",
	mesh = "hovercraft.x",
	visual_size = {x=1, y=1},
	wield_scale = {x=1, y=1, z=1},
	collisionbox = {-0.8, -0.25, -0.8, 0.8, 1.2, 0.8},
	onplace_position_adj = -0.25,
	--player specific stuff
	player_rotation = {x=0,y=90,z=0},
	driver_attach_at = {x=-2,y=6.3,z=0},
	driver_eye_offset = {x=0, y=0, z=0},
	number_of_passengers = 0,
	passenger_attach_at = {x=0,y=0,z=0},
	passenger_eye_offset = {x=0, y=0, z=0},
	--drop and recipe
	drop_on_destroy = "",
	recipe = nil
}

local hover_names = {
	"hover_blue",
	"hover_green",
	"hover_red",
	"hover_yellow",
}

-- Load hovercrafts if enabled
for _, name in ipairs(hover_names) do
	if minetest.settings:get_bool("vehicle_mash.enable_" .. name) then
		loadfile(mpath .. "/hovers/" .. name .. ".lua")(table.copy(hover_def))
	end
end

-- free unneeded global(s)
core.after(10, function()
	vehicle_mash.register_vehicle = nil
end)
