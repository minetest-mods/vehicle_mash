
-- settings

-- end settings

-- get mod path
local mpath = minetest.get_modpath("vehicle_mash")

-- load framework
dofile(mpath.."/framework.lua")


-- ***********************
-- load vehicles down here
-- ***********************

-- Cars
dofile(mpath.."/126r.lua")
dofile(mpath.."/f1.lua")
dofile(mpath.."/black.lua")
dofile(mpath.."/blue.lua")
dofile(mpath.."/brown.lua")
dofile(mpath.."/cyan.lua")
dofile(mpath.."/dark_green.lua")
dofile(mpath.."/dark_grey.lua")
dofile(mpath.."/green.lua")
dofile(mpath.."/grey.lua")
dofile(mpath.."/magenta.lua")
dofile(mpath.."/orange.lua")
dofile(mpath.."/pink.lua")
dofile(mpath.."/red.lua")
dofile(mpath.."/violet.lua")
dofile(mpath.."/white.lua")
dofile(mpath.."/yellow.lua")
dofile(mpath.."/hot_rod.lua")
dofile(mpath.."/nyan_ride.lua")
dofile(mpath.."/oerkki_bliss.lua")
dofile(mpath.."/road_master.lua")
dofile(mpath.."/mese_blue.lua")
dofile(mpath.."/mese_pink.lua")
dofile(mpath.."/mese_purple.lua")

-- Boats
dofile(mpath.."/boat.lua")
dofile(mpath.."/rowboat.lua")

-- Hovercraft
--dofile(mpath.."/hover_blue.lua")
