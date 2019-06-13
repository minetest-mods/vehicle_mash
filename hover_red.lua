
local name = "hover_red"

local definition = ...

definition.description = "Red hovercraft"
definition.inventory_image = "hovercraft_red_inv.png"
definition.wield_image = "hovercraft_red_inv.png"
definition.textures = {"hovercraft_red.png"}

vehicle_mash.register_vehicle("vehicle_mash:"..name, definition)
