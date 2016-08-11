
local name = "car_yellow"
local definition = vehicle_mash_table_copy(vehicle_mash.car01_definition)

definition.description = "Yellow car"
definition.inventory_image = "inv_car_yellow.png"
definition.wield_image = "inv_car_yellow.png"
definition.textures = {"car_yellow.png"}

vehicle_mash:register_vehicle("vehicle_mash:"..name, definition)
