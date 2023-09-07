local definition = ...
local types = {
    "blue", "pink", "purple", "yellow"
}

for _,color in pairs(types) do
    if minetest.settings:get_bool("vehicle_mash.enable_mesecar_" .. color .. "_car") == false then return end

    local name = "mesecar_"..color
    local capitalization = color:gsub("^%l", string.upper)
    local style = capitalization:gsub("_", " ")

    definition.description = vehicle_mash.S("@1 Mesecar", style)
    definition.inventory_image = "mesecar_" .. type .. "_front"
    definition.wield_image = "mesecar_" .. type .. "_front"

    vehicle_mash.register_vehicle("vehicle_mash:"..name, definition)
end
