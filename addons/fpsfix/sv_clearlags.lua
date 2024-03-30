util.AddNetworkString("ClearLagsDed")
local function spawn( ply )
    net.Start("ClearLagsDed")
    net.Send(ply)
end
hook.Add( "PlayerInitialSpawn", "clearlag", spawn )