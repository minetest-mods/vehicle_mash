vehicle_mash:register_car("vehicle_mash:car_126r", {
	description = "126r car",
	is_boat = false,
	player_attach_at = {x=-2,y=10,z=0},
	player_rotation = {x=0,y=90,z=0},
	onplace_position_adj = -0.25,
	drop_on_destroy = "",
	recipe = {},
	inventory_image = "car_126r_inventory.png",
	wield_image = "car_126r_wield.png",
	wield_scale = {x=1, y=1, z=1},
	visual = "mesh",
	mesh = "car_126r.x",
	visual_size = {x=1, y=1},
	textures = {"car_126r.png"},
	stepheight = 1.1, -- Stepheight, 0.6 = climb slabs, 1.1 = climb nodes
	max_speed_forward = 20,
	max_speed_reverse = 10,
	accel = 2,
	braking = 4,
	turn_speed = 2,
	collisionbox = {-0.6, -0.25, -0.3, 0.6, 1/2, 0.3},
--                  back, bottom, port, front, top, starboard
})