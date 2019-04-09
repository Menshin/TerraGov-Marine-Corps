/obj/effect/landmark/lv624
	icon = 'icons/misc/mark.dmi'


/obj/effect/landmark/lv624/fog_blocker
	name = "fog blocker"
	icon_state = "spawn_event"


/obj/effect/landmark/lv624/fog_blocker/Initialize()
	. = ..()
	GLOB.fog_blocker_locations += loc
	flags_atom |= INITIALIZED
	return INITIALIZE_HINT_QDEL


/obj/effect/landmark/xeno_tunnel
	name = "xeno tunnel"
	icon_state = "spawn_event"


/obj/effect/landmark/xeno_tunnel/Initialize()
	. = ..()
	GLOB.xeno_tunnel_landmarks += src


/obj/effect/landmark/xeno_tunnel/Destroy()
	GLOB.xeno_tunnel_landmarks -= src
	return ..()