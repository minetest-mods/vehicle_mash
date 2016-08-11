vehicle_mash = {}

local function get_sign(i)
	if i == 0 then
		return 0
	else
		return i / math.abs(i)
	end
end

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

local function get_v(v)
	return math.sqrt(v.x^2 + v.z^2)
end

local function is_water(pos)
	local nn = minetest.get_node(pos).name
	return minetest.get_item_group(nn, "water") ~= 0
end

local function AttachPlayer(self, clicker, is_driver)
	local pname = clicker:get_player_name()
	local attach_at
	if is_driver then
		attach_at = self.driver_attach_at
	else
		attach_at = self.passenger_attach_at
		clicker:set_eye_offset(self.passenger_eye_offset, {x=0, y=0, z=0})
	end
	clicker:set_attach(self.object, "", attach_at, self.player_rotation)
	default.player_attached[pname] = true
	minetest.after(0.2, function()
		default.player_set_animation(clicker, "sit" , 30)
	end)
	if self.is_boat then
		self.object:setyaw(clicker:get_look_yaw() - math.pi/2)
	else
		self.object:setyaw(clicker:get_look_yaw())
	end
	return clicker
end

local function DetachPlayer(self, clicker, is_driver)
	local pname = clicker:get_player_name()
	clicker:set_detach()
	default.player_attached[pname] = false
	default.player_set_animation(clicker, "stand" , 30)
	if not is_driver then
		clicker:set_eye_offset({x=0, y=0, z=0}, {x=0, y=0, z=0})
	end
	return nil
end

function vehicle_mash:register_vehicle(name, def)
	minetest.register_entity(name, {
		collisionbox = def.collisionbox,
		is_boat = def.is_boat,
		player_rotation = def.player_rotation,
		driver_attach_at = def.driver_attach_at,
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
		drop_on_destroy = def.drop_on_destroy,
		driver = nil,
		passenge = nil,
		v = 0,
		v2 = 0,
		mouselook = 1,
		physical = true,
		removed = false,
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
						self.passenger = DetachPlayer(self, self.passenger, false)
					end
					-- detach driver
					self.driver = DetachPlayer(self, clicker, true)
				-- if clicker is not the driver
				else
					-- if clicker is pasenger
					if clicker == self.passenger then
						-- detach passenger
						self.passenger = DetachPlayer(self, clicker, false)
					-- if clicker is not passenger
					else
						-- attach passenger if possible
						if not self.passenger and self.number_of_passengers > 0 then
							self.passenger = AttachPlayer(self, clicker, false)
						end
					end
				end
			-- if there is no driver
			else
				-- attach driver
				if self.owner == clicker:get_player_name() then
				  self.driver = AttachPlayer(self, clicker, true)
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
			-- Acelerating, braking, and rotating
			self.v = get_v(self.object:getvelocity()) * get_sign(self.v)
			if self.driver then
				local ctrl = self.driver:get_player_control()
				if ctrl.up then
					if get_sign(self.v) >= 0 then
						self.v = self.v + self.accel / 10
					else
						self.v = self.v + self.braking / 10
					end
				end
				if ctrl.down then
					if get_sign(self.v) < 0 then
						self.v = self.v - self.accel / 10
					else
						self.v = self.v - self.braking / 10
					end
				end
				if ctrl.left then
					self.object:setyaw(self.object:getyaw()+get_sign(self.v)*math.rad(1+dtime)*self.turn_spd)
				end
				if ctrl.right then
					self.object:setyaw(self.object:getyaw()-get_sign(self.v)*math.rad(1+dtime)*self.turn_spd)
				end
				if ctrl.jump then
					self.mouselook = -self.mouselook
				end
				if self.mouselook == -1 then
					self.driver:set_look_yaw(self.object:getyaw()-math.pi/2)
				end
			end
			local velo = self.object:getvelocity()
			if self.v == 0 and velo.x == 0 and velo.y == 0 and velo.z == 0 then
				self.object:setpos(self.object:getpos())
				return
			end
			-- Stop damn car!
			local s = get_sign(self.v)
			self.v = self.v - 0.03 * s
			if s ~= get_sign(self.v) then
				self.object:setvelocity({x=0, y=0, z=0})
				self.v = 0
				return
			end
			-- Speed limit forward and reverse
			local max_spd = self.max_spd_r
			if get_sign(self.v) >= 0 then
				max_spd = self.max_spd_f
			end
			if math.abs(self.v) > max_spd then
				self.v = self.v - get_sign(self.v)
			end
			-- Set position, velocity and acceleration	
			local p = self.object:getpos()
			local new_velo = {x = 0, y = 0, z = 0}
			local new_acce = {x = 0, y = 0, z = 0}

			if self.is_boat then
				p.y = p.y - 0.5
				if not is_water(p) then
					local nodedef = minetest.registered_nodes[minetest.get_node(p).name]
					if (not nodedef) or nodedef.walkable then
						self.v = 0
						new_acce = {x = 0, y = 1, z = 0}
					else
						new_acce = {x = 0, y = -9.8, z = 0}
					end
					new_velo = get_velocity_b(self.v, self.object:getyaw(), self.object:getvelocity().y)
					self.object:setpos(self.object:getpos())
				else
					p.y = p.y + 1
					if is_water(p) then
						local y = self.object:getvelocity().y
						if y >= 4.5 then
							y = 4.5
						elseif y < 0 then
							new_acce = {x = 0, y = 20, z = 0}
						else
							new_acce = {x = 0, y = 5, z = 0}
						end
						new_velo = get_velocity_b(self.v, self.object:getyaw(), y)
						self.object:setpos(self.object:getpos())
					else
						new_acce = {x = 0, y = 0, z = 0}
						if math.abs(self.object:getvelocity().y) < 1 then
							local pos = self.object:getpos()
							pos.y = math.floor(pos.y) + 0.5
							self.object:setpos(pos)
							new_velo = get_velocity_b(self.v, self.object:getyaw(), 0)
						else
							new_velo = get_velocity_b(self.v, self.object:getyaw(), self.object:getvelocity().y)
							self.object:setpos(self.object:getpos())
						end
					end
				end

			else
				self.object:setpos({x=p.x, y=p.y, z=p.z})
				new_velo = get_velocity_a(self.v, self.object:getyaw(), self.object:getvelocity().y)
				new_acce = {x=0, y=-9.81, z=0}
			end
			self.object:setvelocity(new_velo)
			self.object:setacceleration(new_acce)
			if self.is_boat then
				-- if boat comes to sudden stop then it has crashed, destroy boat and drop 3x wood
				if self.v2 - self.v >= 3 then
					if self.driver then
						self.driver = DetachPlayer(self, self.driver, true)
					end
					local pos = self.object:getpos()
					self.object:remove()
					minetest.add_item(pos, self.drop_on_destroy)
				end
				self.v2 = self.v
			end
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
			if def.is_boat then
				if is_water(pointed_thing.under) then
					pointed_thing.under.y = pointed_thing.under.y + 0.5
					minetest.add_entity(pointed_thing.under, name)
				else
					return
				end
			else
				pointed_thing.above.y = pointed_thing.above.y + onplace_position_adj
				minetest.env:add_entity(pointed_thing.above, name)
			end
			itemstack:take_item()
			return itemstack
		end
	})

--	minetest.register_craft({
--		output = name,
--		recipe = def.recipe
--	})
end

