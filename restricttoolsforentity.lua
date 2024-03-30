-- This script prohibits the use of toolgun on certain entities
local limited_tools = { 
    ["advdupe2"] = true, -- Here you can enter the name of your tool (For example I entered advanced duplicator 2 because with it you can cause a lot of crashes on the server or get money in a dishonest way)
    ["color"] = true,
    ["material"] = true
}
 
local disabled_ents = {
    ["derma_printer"] = true, -- Here you can enter entities that will not respond to the tools you entered above
    ["bm2_bitminer_1"] = true,
    ["bm2_bitminer_2"] = true,
    ["bm2_bitminer_rack"] = true,
    ["bm2_bitminer_server"] = true,
    ["bm2_extention_lead"] = true,
    ["bm2_generator"] = true,
    ["bm2_power_lead"] = true,
    ["bm2_extra_fuel_line"] = true,
    ["bm2_extra_fuel_tank"] = true,
    ["bm2_large_fuel"] = true,
    ["bm2_solar_cable"] = true,
    ["bm2_solarconverter"] = true,
    ["bm2_solar_panel"] = true,
    ["blues_decals"] = true,
}
 
hook.Add("CanTool", "disable_for_ents", function(_, tr, tool)
    if limited_tools[tool]
    and IsValid( tr.Entity )
    and disabled_ents[tr.Entity:GetClass()] then
        return false
    end
end)



