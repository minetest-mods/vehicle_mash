
local name = "car_126r"

local definition = {
	description = "126r car",
	collisionbox = {-0.6, -0.25, -0.3, 0.6, 1/2, 0.3},
	onplace_position_adj = -0.25,
	is_boat = false,
	player_rotation = {x=0,y=90,z=0},
	driver_attach_at = {x=-2,y=10,z=0},
	number_of_passengers = 0,
	passenger_attach_at = {x=0,y=0,z=0},
	passenger_eye_offset = {x=0, y=0, z=0},
	inventory_image = "car_126r_inventory.png",
	wield_image = "car_126r_wield.png",
	wield_scale = {x=1, y=1, z=1},
	visual = "mesh",
	mesh = "car_126r.x",
	textures = {"car_126r.png"},
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
