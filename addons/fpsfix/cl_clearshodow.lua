net.Receive( "ClearLagsDed", function( len)
    RunConsoleCommand( "r_shadows", 0 )
    RunConsoleCommand( "r_shadowrendertotexture", 0 )
    RunConsoleCommand( "r_shadowmaxrendered", 0 )
    RunConsoleCommand( "mat_shadowstate", 0 )
    RunConsoleCommand( "r_3dsky", 0 )
    RunConsoleCommand( "cl_phys_props_enable" , 0 )
    RunConsoleCommand( "cl_phys_props_max" , 0 )
    RunConsoleCommand( "props_break_max_pieces" , 0 )
    RunConsoleCommand( "r_propsmaxdist" , 1 )
    RunConsoleCommand( "violence_agibs" , 0 )
    RunConsoleCommand( "violence_hgibs" , 0 )
    RunConsoleCommand( "gmod_drawtooleffects" , 0 )
    RunConsoleCommand("cl_threaded_bone_setup", 1)
    RunConsoleCommand("cl_threaded_client_leaf_system", 1)
    RunConsoleCommand("r_threaded_client_shadow_manager", 1)
    RunConsoleCommand("r_threaded_particles", 1)
    RunConsoleCommand("r_threaded_renderables", 1)
    RunConsoleCommand("r_queued_ropes", 1)
    RunConsoleCommand("studio_queue_mode", 1)
    RunConsoleCommand("gmod_mcore_test", 1)
    RunConsoleCommand("cl_threaded_bone_setup", 1)
    RunConsoleCommand("cl_threaded_client_leaf_system" , 1)
    RunConsoleCommand("r_threaded_client_shadow_manager", 1)
    RunConsoleCommand("r_threaded_particles", 1)
    RunConsoleCommand("r_threaded_renderables", 1)
    RunConsoleCommand("r_queued_ropes", 1)
    RunConsoleCommand("studio_queue_mode", 1)
    RunConsoleCommand("gmod_mcore_test", 1)
    RunConsoleCommand("fov_desired", 90)
    RunConsoleCommand("cl_timeout", 600)
    RunConsoleCommand("gmod_mcore_test", 1)
    RunConsoleCommand("mat_queue_mode", -1)
    RunConsoleCommand("cl_threaded_bone_setup", 1)
    RunConsoleCommand("r_drawmodeldecals", 0)
end)