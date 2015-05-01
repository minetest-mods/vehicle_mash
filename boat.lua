vehicle_mash:register_car("vehicle_mash:boat", {
	description = "Boat",
	is_boat = true,
	drop_on_destroy = "default:wood 3",
	inventory_image = "boat_inventory.png",
	wield_image = "boat_wield.png",
	wield_scale = {x=2, y=2, z=1},
	visual = "mesh",
	mesh = "boat.x",
	visual_size = {x=1, y=1},
	textures = {"default_wood.png"},
	stepheight = 0, -- Stepheight, 0.6 = climb slabs, 1.1 = climb nodes
	max_speed_forward = 10,
	max_speed_reverse = 5,
	accel = 1,
	braking = 1,
	turn_speed = 2,
	collisionbox = {-0.5, -0.4, -0.5, 0.5, 0.3, 0.5},
})