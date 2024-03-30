-- Removes commands that may be useful for a player to enter your RCON
-- I recommended to set rcon_password "" before you upload this script to your server. that means no any password for rcon!
-- You don't need it in 2024 =)

if CLIENT then 
	hook.Add("PlayerInitialSpawn", "What do we want? No RCON", function( ply )
		concommand.Remove( "rcon_password" )
		concommand.Remove( "rcon" )
	end)
end