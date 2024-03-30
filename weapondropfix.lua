-- Prohibits to drop any weapons that you received through donation or the admin system (very useful if you sell donated weapons on your server)
hook.Add("Think", "wepdrop", function()
hook.Remove("Think", "wepdrop")

local function CCGiveSWEP(ply, command, arguments)
    if not IsValid(ply) then
        return
    end

    if arguments[1] == nil then
        return
    end
    if not ply:Alive() then
        return
    end

    local swep = list.Get("Weapon")[arguments[1]]
    if swep == nil then
        return
    end

    if (not swep.Spawnable and not ply:IsAdmin()) or (swep.AdminOnly and not ply:IsAdmin()) then
        return
    end

    if not hook.Run("PlayerGiveSWEP", ply, arguments[1], swep) then
        return
    end

    if not ply:HasWeapon(swep.ClassName) then
        MsgAll("Giving " .. ply:Nick() .. " a " .. swep.ClassName .. "\n")
        local ent = ply:Give(swep.ClassName)
        hook.Run("PlayerGivedSWEP", ply, arguments[1], swep, ent)
    end

    ply:SelectWeapon(swep.ClassName)
end
concommand.Add( "gm_giveswep", CCGiveSWEP)

hook.Add(
    "PlayerGivedSWEP",
    "_RestrictPlayerDropWep",
    function(ply, _, _, swep)
            swep:SetVar("restricted_to_drop", true)
        end
)

hook.Add(
    "PlayerSpawnedSWEP",
    "_RestrictPlayerDropWep",
    function(ply, swep)
            swep:SetVar("restricted_to_drop", true)
        end
)
end)

hook.Add('CanTool', 'remove_duplicator', function( ply, tr, tool )
   if tool == "duplicator" then
      return false
   end
end)

hook.Add('PlayerGiveSWEP', 'disableDonateDrop', function(ply, weapon)
    timer.Simple(0.1, function()
        if not IsValid(ply) then return end
        for _, v in pairs(ply:GetWeapons() or {}) do
            if v:GetClass() == weapon then
                v:SetVar("restricted_to_drop", true)
            end
        end
    end)
end)

hook.Add('WeaponEquip', 'setDropDelay', function(weapon, ply)
    weapon.EquipTime = CurTime()
end)

hook.Add('canDropWeapon', 'disableDonateDrop', function(ply, swep)
    if CurTime() - swep.EquipTime < 1 then return false end
end)

hook.Add('FAdmin_OnCommandExecuted', 'disableDonateDrop', function(ply, cmd, args, res)
    if cmd ~= 'giveweapon' then return end
    if not res[1] then return end

    for _, v in pairs(res[2]) do
        for _, wep in pairs(v:GetWeapons() or {}) do
            if wep:GetClass() == res[3] then
                wep:SetVar("restricted_to_drop", true)
            end
        end
    end
end)
