cars = {}

local function get_sign(i)
	if i == 0 then
		return 0
	else
		return i/math.abs(i)
	end
end

local function get_velocity(v, yaw, y, r, f)
	local x = (math.cos(yaw) + math.abs(r)*math.cos(yaw+r*math.rad(105))*f)*v
	local z = (math.sin(yaw) + math.abs(r)*math.sin(yaw+r*math.rad(105))*f)*v
	return {x=x, y=y, z=z}
end

local function get_v(v)
	return math.sqrt(v.x^2+v.z^2)
end

function cars:register_car(name, def)
	minetest.register_entity(name, {
		textures = def.textures,
		name = name,
		physical = true,
		collisionbox = def.collisionbox,
		visual = def.visual,
		visual_size = def.visual_size,
		mesh = def.mesh,
		stepheight = def.stepheight,
		driver = nil,
		v = 0,
		timer = 0,
		mouselook = 1,
		max_spd_f = def.max_speed_forward,
		max_spd_r = def.max_speed_reverse,
		accel = def.accel,
		braking = def.braking,
		turn_spd = def.turn_speed,
		f = 0,
		on_rightclick = function(self, clicker)
			if not clicker or not clicker:is_player() then
				return
			end
			local pname = clicker:get_player_name()
			if self.driver and clicker == self.driver then
				self.driver = nil
				clicker:set_detach()
				default.player_attached[pname] = false
				default.player_set_animation(clicker, "stand" , 30)
			elseif not self.driver then
				self.driver = clicker
				clicker:set_attach(self.object, "", {x=0,y=5,z=0}, {x=0,y=0,z=0})
				default.player_attached[pname] = true
				minetest.after(0.2, function()
					default.player_set_animation(clicker, "sit" , 30)
				end)
				self.object:setyaw(clicker:get_look_yaw()) --  - math.pi / 2
			end
		end,
		on_activate = function(self, staticdata, dtime_s)
			self.object:set_armor_groups({immortal = 1})
			if staticdata then
				self.v = tonumber(staticdata)
			end
		end,
		get_staticdata = function(self)
			return tostring(self.v)
		end,
		on_punch = function(self, puncher, time_from_last_punch, tool_capabilities, direction)

			if not puncher or not puncher:is_player() or self.removed then
				return
			end
			if self.driver and puncher == self.driver then
				self.driver = nil
				puncher:set_detach()
				default.player_attached[puncher:get_player_name()] = false
			end
			if not self.driver then
				self.removed = true
				-- delay remove to ensure player is detached
				minetest.after(0.1, function()
					self.object:remove()
				end)
				if not minetest.setting_getbool("creative_mode") then
					puncher:get_inventory():add_item("main", self.name)
				end
			end
		end,
		on_step = function(self, dtime)
			-- Acelerating, braking, rotating and skidding
			self.v = get_v(self.object:getvelocity())*get_sign(self.v)
			self.timer = self.timer + dtime
			if self.timer > 1 then
				self.timer = 0
		        end
			local r = 0
			if self.driver then
				local ctrl = self.driver:get_player_control()
				if ctrl.up then
					if get_sign(self.v) >= 0 then
						self.v = self.v+self.accel/10
					else
						self.v = self.v+self.braking/10
					end
				end
				if ctrl.down then
					if get_sign(self.v) < 0 then
						self.v = self.v-self.accel/10
					else
						self.v = self.v-self.braking/10
					end
				end
				if ctrl.left then
					self.object:setyaw(self.object:getyaw()+get_sign(self.v)*math.rad(1+dtime)*self.turn_spd)
					r = -1
					self.f = self.f+0.01
				end
				if ctrl.right then
					self.object:setyaw(self.object:getyaw()-get_sign(self.v)*math.rad(1+dtime)*self.turn_spd)
					r = 1
					self.f = self.f+0.01
				end
				if not (ctrl.up or ctrl.down) then
					self.f = self.f-0.02
				end
				if (ctrl.jump and self.timer == 0) then
					self.mouselook = -self.mouselook
				end
				if self.mouselook == -1 then
					self.driver:set_look_yaw(self.object:getyaw()-math.pi/2)
				end
			end
			if self.f == nil or self.f < 0 then
				self.f = 0
			elseif self.f > 0.5 then
				self.f = 0.5
			end
			-- Speed limit forward and reverse
			local max_spd = self.max_spd_r
			if get_sign(self.v) >= 0 then
				max_spd = self.max_spd_f
			end
			if math.abs(self.v) > max_spd then
				self.v = self.v-get_sign(self.v)
			end
			-- Set position, velocity and acceleration	
			local p = self.object:getpos()
			self.object:setpos({x=p.x, y=p.y, z=p.z})
			self.object:setvelocity(get_velocity(self.v, self.object:getyaw(), self.object:getvelocity().y, r, self.f))
			self.object:setacceleration({x=0, y=-9.81, z=0})
		end,
	})
	minetest.register_craftitem(name, {
		description = def.description,
		inventory_image = def.inventory_image,
		wield_image = def.wield_image,
		wield_scale = def.wield_scale,
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return
			end
			minetest.env:add_entity(pointed_thing.above, name)
			itemstack:take_item()
			return itemstack
		end,
	})

end
