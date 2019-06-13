
local name = "hover_yellow"

local definition = ...

definition.description = "Yellow hovercraft"
definition.inventory_image = "hovercraft_yellow_inv.png"
definition.wield_image = "hovercraft_yellow_inv.png"
definition.textures = {"hovercraft_yellow.png"}

vehicle_mash.register_vehicle("vehicle_mash:"..name, definition)
