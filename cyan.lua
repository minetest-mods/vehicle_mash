
local name = "car_cyan"
local definition = vehicle_mash_table_copy(vehicle_mash.car01_definition)

definition.description = "Cyan car"
definition.inventory_image = "inv_car_cyan.png"
definition.wield_image = "inv_car_cyan.png"
definition.textures = {"car_cyan.png"}

vehicle_mash:register_vehicle("vehicle_mash:"..name, definition)
