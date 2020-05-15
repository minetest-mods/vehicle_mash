
local name = "hover_green"

local definition = ...

definition.description = "Green hovercraft"
definition.inventory_image = "hovercraft_green_inv.png"
definition.wield_image = "hovercraft_green_inv.png"
definition.textures = {"hovercraft_green.png"}

vehicle_mash.register_vehicle("vehicle_mash:"..name, definition)
