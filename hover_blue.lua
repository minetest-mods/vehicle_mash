
local name = "hover_blue"

local definition = {
	description = "Blue hovercraft",
	collisionbox = {-0.8,0,-0.8, 0.8,1.2,0.8},
	onplace_position_adj = 0,
	is_boat = false,
	player_rotation = {x=0,y=90,z=0},
	driver_attach_at = {x=-2,y=16.5,z=0},
	number_of_passengers = 0,
	passenger_attach_at = {x=0,y=0,z=0},
	passenger_eye_offset = {x=0, y=0, z=0},
	inventory_image = "hovercraft_blue_inv.png",
	wield_image = "hovercraft_blue_inv.png",
	wield_scale = {x=1, y=1, z=1},
	visual = "mesh",
	mesh = "hovercraft.x",
	textures = {"hovercraft_blue.png"},
	visual_size = {x=1, y=1},
	stepheight = 0.6,
	max_speed_forward = 12,
	max_speed_reverse = 0,
	accel = 2.5,
	braking = 1,
	turn_speed = 2,
	drop_on_destroy = "",
	recipe = {}
}

vehicle_mash:register_vehicle("vehicle_mash:"..name, definition)
