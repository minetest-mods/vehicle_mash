
vehicle_mash = {}

local function get_velocity_a(v, yaw, y)
	local x = math.cos(yaw) * v
	local z = math.sin(yaw) * v
	return {x=x, y=y, z=z}
end

local function get_velocity_b(v, yaw, y)
	local x = -math.sin(yaw) * v
	local z =  math.cos(yaw) * v
	return {x=x, y=y, z=z}
end

local function is_water(pos)
	local nn = minetest.get_node(pos).name
	return minetest.get_item_group(nn, "water") ~= 0
end

local drive = lib_mount.drive

function vehicle_mash.register_vehicle(name, def)
	minetest.register_entity(name, {
		collisionbox = def.collisionbox,
		is_boat = def.is_boat,
		player_rotation = def.player_rotation,
		driver_attach_at = def.driver_attach_at,
		driver_eye_offset = def.driver_eye_offset,
		driver_detach_pos_offset = def.driver_detach_pos_offset,
		number_of_passengers = def.number_of_passengers,
		passenger_attach_at = def.passenger_attach_at,
		passenger_eye_offset = def.passenger_eye_offset,
		passenger_detach_pos_offset = def.passenger_detach_pos_offset,
		visual = def.visual,
		mesh = def.mesh,
		textures = def.textures,
		tiles = def.tiles,
		visual_size = def.visual_size,
		stepheight = def.stepheight,
		max_spd_f = def.max_speed_forward,
		max_spd_r = def.max_speed_reverse,
		accel = def.accel,
		braking = def.braking,
		turn_spd = def.turn_speed,
		drop_on_destroy = def.drop_on_destroy or function()end,
		driver = nil,
		passenge = nil,
		v = 0,
		v2 = 0,
		mouselook = 1,
		physical = true,
		removed = false,
		offset = {x=0, y=0, z=0},
		on_rightclick = function(self, clicker)
			if not clicker or not clicker:is_player() then
				return
			end
			-- owner set to the player?
			if not self.owner or self.owner == "" then
					self.owner = clicker:get_player_name()
			end
			-- if there is already a driver
			if self.driver then
				-- if clicker is driver detach passenger and driver
				if clicker == self.driver then
					-- if passenger detach first
					if self.passenger then
						lib_mount.detach(self.passenger, self.offset)
						self.passenger = nil
					end
					-- detach driver
					lib_mount.detach(clicker, self.offset)
					self.driver = nil
				-- if clicker is not the driver
				else
					-- if clicker is pasenger
					if clicker == self.passenger then
						-- detach passenger
						lib_mount.detach(clicker, self.offset)
						self.passenger = nil
					-- if clicker is not passenger
					else
						-- attach passenger if possible
						if not self.passenger and self.number_of_passengers > 0 then
							lib_mount.attach(self, clicker, self.passenger_attach_at, self.passenger_eye_offset, self.player_rotation)
							self.passenger = clicker
						end
					end
				end
			-- if there is no driver
			else
				-- attach driver
				if self.owner == clicker:get_player_name() then
					lib_mount.attach(self, clicker, self.driver_attach_at, self.driver_eye_offset, self.player_rotation)
					self.driver = clicker
				end
			end
		end,
		on_activate = function(self, staticdata, dtime_s)
			self.object:set_armor_groups({immortal = 1})
			local tmp = minetest.deserialize(staticdata)
			if tmp then
				for _,stat in pairs(tmp) do
					self[_] = stat
				end 
			end
			self.v2 = self.v
		end,
		get_staticdata = function(self)
			return core.serialize({
			v = self.v,
			owner = self.owner,
		})
		end,
		on_punch = function(self, puncher, time_from_last_punch, tool_capabilities, dir)
			if not puncher or not puncher:is_player() or self.removed or self.driver then
				return
			end
			if self.owner == puncher:get_player_name() 
			or minetest.get_player_privs(puncher:get_player_name(), {basic_privs=true}) then
			  self.removed = true
			  -- delay remove to ensure player is detached
			  minetest.after(0.1, function()
			  		self.object:remove()
			  end)
			  puncher:get_inventory():add_item("main", self.name)
			end
		end,
		on_step = function(self, dtime)
			drive(self, dtime, false, nil, nil, 0, false)
		end
	})

	local onplace_position_adj = def.onplace_position_adj
	minetest.register_craftitem(name, {
		description = def.description,
		inventory_image = def.inventory_image,
		wield_image = def.wield_image,
		wield_scale = def.wield_scale,
		liquids_pointable = def.is_boat,
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return
			end
			local ent
			if def.is_boat then
				if is_water(pointed_thing.under) then
					pointed_thing.under.y = pointed_thing.under.y + 0.5
					ent = minetest.add_entity(pointed_thing.under, name)
				else
					return
				end
			else
				pointed_thing.above.y = pointed_thing.above.y + onplace_position_adj
				ent = minetest.add_entity(pointed_thing.above, name)
			end
			if ent:get_luaentity().player_rotation.y == 90 then
				ent:setyaw(placer:get_look_yaw())
			else
				ent:setyaw(placer:get_look_yaw() - math.pi/2)
			end
			itemstack:take_item()
			return itemstack
		end
	})

	if def.recipe then
		minetest.register_craft({
			output = name,
			recipe = def.recipe
		})
	end
end
