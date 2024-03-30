hook.Add("CanPlayerSuicide", "AntiLadderGlitch", function(ply)
	if ply:IsPlayer() then
		if ply:GetMoveType() == MOVETYPE_LADDER then
			return false
		end
	end
end)

hook.Add( "KeyPress", "AntiLadderGlitchFly", function( ply, key )
	if ( key == IN_USE ) then
		if ply:IsPlayer()then
			if ply:GetActiveWeapon():GetClass() == "weapon_physgun" then
				if ply:GetMoveType() == MOVETYPE_LADDER and ply:GetActiveWeapon():GetClass() == "weapon_physgun" then
					ply:ConCommand("-attack")
				end
			end	
		end
	end
end)
