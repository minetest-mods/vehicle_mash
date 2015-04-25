cars:register_car("cars:car_f1", {
	description = "Car: f1",
	inventory_image = "car_f1_inventory.png",
	wield_image = "car_f1_wield.png",
	wield_scale = {x=1, y=1, z=1},
	visual = "mesh",
	mesh = "car_f1.x",
	visual_size = {x=2, y=2},
	textures = {"car_f1.png"},
	stepheight = 0.6, -- Stepheight, 0.6 = climb slabs, 1.1 = climb nodes
	max_speed_forward = 20,
	max_speed_reverse = 10,
	accel = 2,
	braking = 4,
	turn_speed = 2,
	collisionbox = {-1/2, -1/2, -1/2, 1/2, 1/2, 1/2},
})