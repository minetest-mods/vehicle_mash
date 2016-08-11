
local name = "car_dark_green"
local definition = vehicle_mash_table_copy(vehicle_mash.car01_definition)

definition.description = "Dark green car"
definition.inventory_image = "inv_car_dark_green.png"
definition.wield_image = "inv_car_dark_green.png"
definition.textures = {"car_dark_green.png"}

vehicle_mash:register_vehicle("vehicle_mash:"..name, definition)
