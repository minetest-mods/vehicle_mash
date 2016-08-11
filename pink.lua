
local name = "car_pink"
local definition = vehicle_mash_table_copy(vehicle_mash.car01_definition)

definition.description = "Pink car"
definition.inventory_image = "inv_car_pink.png"
definition.wield_image = "inv_car_pink.png"
definition.textures = {"car_pink.png"}

vehicle_mash:register_vehicle("vehicle_mash:"..name, definition)
