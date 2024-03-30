--by Faulin
local function BlockSuicide(ply)

	ply:ChatPrint("Suicide is prohibited, suicide stinks, go to a psychiatric hospital and get treatment.")

	return false

end

hook.Add( "CanPlayerSuicide", "BlockSuicide", BlockSuicide )















