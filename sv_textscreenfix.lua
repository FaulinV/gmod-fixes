concommand.Add("addfunds",function(ply) -- Only if you have gm-donate.ru installed (GMD) if not you can also delete line 1,2,3
    print("Friend, you will not receive free donation currency"..ply:Name())
end)

hook.Add("CanTool", "pizdec50r", function(pl, tr, tool) -- Prohibition on using a toolgun on a car or another vehicle (if you don't need that function just delete the line 5,6,7)
    if IsValid(tr.Entity) and tr.Entity:IsVehicle() then return false end 
end)

hook.Add("CanTool", "AntiPermaText", function(pl, tr, tool) -- If you have the textscreen addon installed then this function will be very useful to you if you use fading door on the textscreen it will be an permanent textscreen and you will not delete it in any way
    if tool == "fading_door" and IsValid( tr.Entity ) and tr.Entity:GetClass() == "sammyservers_textscreen" then return false end 
end)