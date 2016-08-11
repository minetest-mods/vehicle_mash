
local name = "car_white"
local definition = vehicle_mash_table_copy(vehicle_mash.car01_definition)

definition.description = "White car"
definition.inventory_image = "inv_car_white.png"
definition.wield_image = "inv_car_white.png"
definition.textures = {"car_white.png"}

vehicle_mash:register_vehicle("vehicle_mash:"..name, definition)
