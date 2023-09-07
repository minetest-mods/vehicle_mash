local definition = ...
local types = {
    "blue", "green", "red", "yellow"
}

for _, color in pairs(types) do
    if minetest.settings:get_bool("vehicle_mash.enable_hover_" .. color) == false then return end

    local name = "hover_"..color
    local capitalization = color:gsub("^%l", string.upper)
    local style = capitalization:gsub("_", " ")

    definition.description = vehicle_mash.S("@1 Hovercraft", style)
    definition.inventory_image = "hovercraft_" .. color .. "_inv.png"
    definition.wield_image = "hovercraft_" .. color .. "_inv.png"
    definition.textures = { "hovercraft_" .. color .. ".png" }
    definition.drop_on_destroy = { "wool:" .. color, "wool:black 2", "default:steelblock" }

    vehicle_mash.register_vehicle("vehicle_mash:"..name, definition)
end
