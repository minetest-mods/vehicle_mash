
local name = "rowboat"

local definition = {
	description = "Rowboat",
	collisionbox = {-0.5, -0.4, -0.5, 0.5, 0.3, 0.5},
	onplace_position_adj = 0,
	is_boat = true,
	player_rotation = {x=0,y=0,z=0},
	driver_attach_at = {x=0,y=11,z=-3},
	driver_eye_offset = {x=0, y=0, z=0},
	number_of_passengers = 0,
	passenger_attach_at = {x=0,y=0,z=0},
	passenger_eye_offset = {x=0, y=0, z=0},
	inventory_image = "rowboat_inventory.png",
	wield_image = "rowboat_wield.png",
	wield_scale = {x=1, y=1, z=1},
	visual = "mesh",
	mesh = "rowboat.x",
	textures = {"default_wood.png"},
	visual_size = {x=1, y=1},
	stepheight = 0,
	max_speed_forward = 10,
	max_speed_reverse = 5,
	accel = 1,
	braking = 1,
	turn_speed = 2,
	drop_on_destroy = "default:wood 3",
	recipe = {
		{"",           "",           ""          },
		{"group:wood", "",           "group:wood"},
		{"group:wood", "group:wood", "group:wood"},
	}
}

vehicle_mash:register_vehicle("vehicle_mash:"..name, definition)
