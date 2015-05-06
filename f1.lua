vehicle_mash:register_car("vehicle_mash:car_f1", {
	description = "F1 car",
	is_boat = false,
	player_attach_at = {x=-5,y=11,z=0},
	player_rotation = {x=0,y=90,z=0},
	onplace_position_adj = -0.25,
	drop_on_destroy = "",
	recipe = {},
	inventory_image = "car_f1_inventory.png",
	wield_image = "car_f1_wield.png",
	wield_scale = {x=1, y=1, z=1},
	visual = "mesh",
	mesh = "car_f1.x",
	visual_size = {x=1, y=1},
	textures = {"car_f1.png"},
	stepheight = 0.6, -- Stepheight, 0.6 = climb slabs, 1.1 = climb nodes
	max_speed_forward = 20,
	max_speed_reverse = 10,
	accel = 2,
	braking = 4,
	turn_speed = 2,
	collisionbox = {-0.7, -0.25, -0.4, 0.7, 0.25, 0.4},
--                  back, bottom, port, front, top, starboard
})