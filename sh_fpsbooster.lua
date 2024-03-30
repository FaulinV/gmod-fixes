
-- Bucket's Anti-Lag No bullshit kablamo optimization code (Some code is taken from Facepunch so don't get pissed pls k thx)
hook.Add("InitPostEntity","NoWidgets",function()
 timer.Simple(60, function()
 	-- Usually the cause of some if not most lag.
 	hook.Remove("PlayerTick", "TickWidgets")
 
 	if SERVER then
 		if timer.Exists("CheckHookTimes") then
 			timer.Remove("CheckHookTimes")
 		end

	for k, v in pairs(ents.FindByClass("env_fire")) do v:Remove() end
	for k, v in pairs(ents.FindByClass("trigger_hurt")) do v:Remove() end
	for k, v in pairs(ents.FindByClass("prop_physics")) do v:Remove() end
	for k, v in pairs(ents.FindByClass("prop_ragdoll")) do v:Remove() end
	for k, v in pairs(ents.FindByClass("beam")) do v:Remove() end
	for k, v in pairs(ents.FindByClass("env_sprite")) do v:Remove() end
	for k, v in pairs(ents.FindByClass("func_tracktrain")) do v:Remove() end
	for k, v in pairs(ents.FindByClass("point_template")) do v:Remove() end
	for k, v in pairs(ents.FindByClass("func_breakable_surf")) do v:Remove() end
    for k, v in pairs(ents.FindByClass("env_soundscape")) do v:Remove() end   
 	end
	
 	hook.Remove("PlayerTick","TickWidgets")
	hook.Remove( "Think", "CheckSchedules")
	timer.Destroy("HostnameThink")
	hook.Remove("LoadGModSave", "LoadGModSave")
	
	// Remove a bunch of useless map stuff 
	
	
	 if CLIENT then
 		-- These call on bloated convar getting methods and aren't ever used anyway outside of sandbox.
 		hook.Remove("RenderScreenspaceEffects", "RenderColorModify")
 		hook.Remove("RenderScreenspaceEffects", "RenderBloom")
 		hook.Remove("RenderScreenspaceEffects", "RenderToyTown")
 		hook.Remove("RenderScreenspaceEffects", "RenderTexturize")
 		hook.Remove("RenderScreenspaceEffects", "RenderSunbeams")
 		hook.Remove("RenderScreenspaceEffects", "RenderSobel")
 		hook.Remove("RenderScreenspaceEffects", "RenderSharpen")
 		hook.Remove("RenderScreenspaceEffects", "RenderMaterialOverlay")
 		hook.Remove("RenderScreenspaceEffects", "RenderMotionBlur")
 		hook.Remove("RenderScene", "RenderStereoscopy")
 		hook.Remove("RenderScene", "RenderSuperDoF")
 		hook.Remove("GUIMousePressed", "SuperDOFMouseDown")
 		hook.Remove("GUIMouseReleased", "SuperDOFMouseUp")
 		hook.Remove("PreventScreenClicks", "SuperDOFPreventClicks")
 		hook.Remove("PostRender", "RenderFrameBlend")
 		hook.Remove("PreRender", "PreRenderFrameBlend")
 		hook.Remove("Think", "DOFThink")
 		hook.Remove("RenderScreenspaceEffects", "RenderBokeh")
 		hook.Remove("NeedsDepthPass", "NeedsDepthPass_Bokeh")
 		hook.Remove("PostDrawEffects", "RenderWidgets")  		-- We don't need this, but what the hell.
 	end
 end)
end)

hook.Add("OnEntityCreated","WidgetInit",function(ent) -- C+P from Facepunch
	if ent:IsWidget() then
		hook.Add( "PlayerTick", "TickWidgets", function( pl, mv ) widgets.PlayerTick( pl, mv ) end ) -- needed code.
		hook.Remove("OnEntityCreated","WidgetInit") -- calls it only once
	end
end)
