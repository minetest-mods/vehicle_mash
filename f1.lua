
local name = "car_f1"

local definition = {
	description = "F1 car",
	collisionbox = {-0.7, -0.25, -0.4, 0.7, 0.25, 0.4},
	onplace_position_adj = -0.25,
	is_boat = false,
	player_rotation = {x=0,y=90,z=0},
	driver_attach_at = {x=-5,y=11,z=0},
	number_of_passengers = 0,
	passenger_attach_at = {x=0,y=0,z=0},
	passenger_eye_offset = {x=0, y=0, z=0},
	inventory_image = "car_f1_inventory.png",
	wield_image = "car_f1_wield.png",
	wield_scale = {x=1, y=1, z=1},
	visual = "mesh",
	mesh = "car_f1.x",
	textures = {"car_f1.png"},
	visual_size = {x=1, y=1},
	stepheight = 0.6,
	max_speed_forward = 25,
	max_speed_reverse = 15,
	accel = 3,
	braking = 4,
	turn_speed = 4,
	drop_on_destroy = "",
	recipe = {}
}

vehicle_mash:register_vehicle("vehicle_mash:"..name, definition)
