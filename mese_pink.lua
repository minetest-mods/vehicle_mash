
local name = "mesecar_pink"

local definition = {
	description = "Mesecar pink",
	collisionbox = {-0.75, -0.75, -0.75, 0.75, 0.75, 0.75},
	onplace_position_adj = 0.25,
	is_boat = false,
	player_rotation = {x=0,y=90,z=0},
	driver_attach_at = {x=-2.1,y=3,z=0},
	driver_eye_offset = {x=0, y=0, z=0},
	number_of_passengers = 0,
	passenger_attach_at = {x=0,y=0,z=0},
	passenger_eye_offset = {x=0, y=0, z=0},
	inventory_image = "mesecar_car3front.png",
	wield_image = "mesecar_car3front.png",
	wield_scale = {x=1, y=1, z=1},
	visual = "cube",
	mesh = "",
	textures = {
		"mesecar_car3top.png",
		"mesecar_carbase.png",
		"mesecar_car3front.png",
		"mesecar_car3back.png",
		"mesecar_car3leftside.png",
		"mesecar_car3rightside.png"
	},
	visual_size = {x=1, y=1},
	stepheight = 0.6,
	max_speed_forward = 20,
	max_speed_reverse = 10,
	accel = 2,
	braking = 4,
	turn_speed = 2,
	drop_on_destroy = "",
	recipe = {}
}

vehicle_mash:register_vehicle("vehicle_mash:"..name, definition)
