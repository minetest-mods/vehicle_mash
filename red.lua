
local name = "car_red"
local definition = vehicle_mash_table_copy(vehicle_mash.car01_definition)

definition.description = "Red car"
definition.inventory_image = "inv_car_red.png"
definition.wield_image = "inv_car_red.png"
definition.textures = {"car_red.png"}

vehicle_mash:register_vehicle("vehicle_mash:"..name, definition)
