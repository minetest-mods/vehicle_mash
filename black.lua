vehicle_mash:register_car("vehicle_mash:car_black", {
	description = "Black car",
	inventory_image = "inv_car_black.png",
	is_boat = false,
	player_attach_at = {x=0,y=12,z=0},
	player_rotation = {x=0,y=90,z=0},
	onplace_position_adj = -0.45,
	drop_on_destroy = "",
	recipe = {},
	wield_image = "inv_car_black.png",
	wield_scale = {x=1, y=1, z=1},
	visual = "mesh",
	mesh = "car.x",
	visual_size = {x=1, y=1},
	textures = {"car_black.png"},
	stepheight = 1.1, -- Stepheight, 0.6 = climb slabs, 1.1 = climb nodes
	max_speed_forward = 20,
	max_speed_reverse = 10,
	accel = 2,
	braking = 4,
	turn_speed = 2,
	collisionbox = {-1.6, -0.05, -1.3, 1.0, 1, 0.5},
--                  back, bottom, starboard, front, top, port
})
