hook.Add( 'PreventFadingDoorDudos', 'FadingDoorDudos', function( ent, owner )
	local colliding = ents.FindInSphere(ent:LocalToWorld(ent:OBBCenter()), ent:BoundingRadius())
	for k,v in pairs( colliding ) do
		if v ~= ent and v.isFadingDoor then
			return true, IsValid( owner ) and DarkRP.notify( owner, 1, 3, 'Вы не можете заблокировать этот Fading Door, т.к он сталкивается с другими' ) or false
		end
	end
end)