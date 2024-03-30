-- Prevents spawning large props because this may have a large load on the server
-- You can spawn with superadmin rank
hook.Add("PlayerSpawnedProp", "SRP_NoHugeProps", function(ply, mdl, ent)
    if IsValid(ent) then
        local mins, maxs = ent:GetModelBounds()
        local size = maxs - mins
        local vol = size.x * size.y * size.z
        if vol > 1000000 and not ply:IsSuperAdmin() then
            ent:Remove()
            DarkRP.notify(ply, NOTIFY_ERROR, 3, "This prop is too big!")
        end
    end

end)