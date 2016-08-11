
local name = "car_orange"
local definition = vehicle_mash_table_copy(vehicle_mash.car01_definition)

definition.description = "Orange car"
definition.inventory_image = "inv_car_orange.png"
definition.wield_image = "inv_car_orange.png"
definition.textures = {"car_orange.png"}

vehicle_mash:register_vehicle("vehicle_mash:"..name, definition)
