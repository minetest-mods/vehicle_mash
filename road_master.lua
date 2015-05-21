
local name = "car_road_master"

local definition = {
	description = "Road Master car",
	collisionbox = {-1.6, -0.05, -1.3, 1.0, 1, 0.5},
	onplace_position_adj = -0.45,
	is_boat = false,
	player_rotation = {x=0,y=90,z=0},
	driver_attach_at = {x=0,y=12,z=0},
	number_of_passengers = 1,
	passenger_attach_at = {x=0,y=12,z=-8},
	passenger_eye_offset = {x=8, y=0, z=0},
	inventory_image = "inv_car_brown.png",
	wield_image = "inv_car_brown.png",
	wield_scale = {x=1, y=1, z=1},
	visual = "mesh",
	mesh = "car.x",
	textures = {"road_master.png"},
	visual_size = {x=1, y=1},
	stepheight = 1.1,
	max_speed_forward = 20,
	max_speed_reverse = 10,
	accel = 2,
	braking = 4,
	turn_speed = 2,
	drop_on_destroy = "",
	recipe = {}
}

vehicle_mash:register_vehicle("vehicle_mash:"..name, definition)
