local name = "car_cyan"
local definition = ...

definition.description = vehicle_mash.S("Cyan car")
definition.inventory_image = "inv_car_cyan.png"
definition.wield_image = "inv_car_cyan.png"
definition.textures = {"car_cyan.png"}

vehicle_mash.register_vehicle("vehicle_mash:"..name, definition)
