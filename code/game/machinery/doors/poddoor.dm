/obj/machinery/door/poddoor
	name = "\improper Podlock"
	desc = "That looks like it doesn't open easily."
	icon = 'icons/obj/doors/rapid_pdoor.dmi'
	icon_state = "pdoor1"
	id = ""
	dir = SOUTH
	armor = list("melee" = 50, "bullet" = 100, "laser" = 100, "energy" = 100, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 70)
	layer = PODDOOR_OPEN_LAYER
	open_layer = PODDOOR_OPEN_LAYER
	closed_layer = PODDOOR_CLOSED_LAYER

/obj/machinery/door/poddoor/Bumped(atom/AM)
	if(!density)
		return ..()
	else
		return FALSE

/obj/machinery/door/poddoor/attackby(obj/item/W, mob/user)
	add_fingerprint(user)
	if(!W.pry_capable)
		return
	if(density && (machine_stat & NOPOWER) && !operating && !CHECK_BITFIELD(resistance_flags, INDESTRUCTIBLE))
		spawn(0)
			operating = TRUE
			sleep(15)
			open()
			density = FALSE
			operating = FALSE
			update_icon()


/obj/machinery/door/poddoor/try_to_activate_door(mob/user)
	return

/*/obj/machinery/door/poddoor/open()
	if(operating == 1) //doors can still open when emag-disabled
		return
	if(!SSticker)
		return 0
	if(!operating) //in case of emag
		operating = 1
	flick("pdoorc0", src)
	icon_state = "pdoor0"
	SetOpacity(0)
	sleep(10)
	layer = PODDOOR_OPEN_LAYER
	density = 0

	if(operating == 1) //emag again
		operating = 0
	if(autoclose)
		spawn(150)
			autoclose()
	return 1
*/

/obj/machinery/door/poddoor/update_icon()
	if(density)
		icon_state = "pdoor1"
	else
		icon_state = "pdoor0"

/*/obj/machinery/door/poddoor/close()
	if(operating)
		return TRUE
	operating = TRUE
	layer = PODDOOR_CLOSED_LAYER
	flick("pdoorc1", src)
	icon_state = "pdoor1"
	density = TRUE
	SetOpacity(initial(opacity))

	sleep(10)
	operating = FALSE
	return*/

/obj/machinery/door/poddoor/do_animate(animation)
	switch(animation)
		if("opening")
			flick("pdoorc0", src)
		if("closing")
			flick("pdoorc1", src)
/*
/obj/machinery/door/poddoor/two_tile_hor/open()
	if(operating == 1) //doors can still open when emag-disabled
		return
	if(!SSticker)
		return 0
	if(!operating) //in case of emag
		operating = 1
	flick("pdoorc0", src)
	icon_state = "pdoor0"
	SetOpacity(0)
	f1.SetOpacity(0)
	f2.SetOpacity(0)

	sleep(10)
	density = 0
	f1.density = 0
	f2.density = 0

	if(operating == 1) //emag again
		operating = 0
	if(autoclose)
		spawn(150)
			autoclose()
	return 1

/obj/machinery/door/poddoor/two_tile_hor/close()
	if(operating)
		return
	operating = 1
	flick("pdoorc1", src)
	icon_state = "pdoor1"

	density = 1
	f1.density = 1
	f2.density = 1

	sleep(10)
	SetOpacity(initial(opacity))
	f1.SetOpacity(initial(opacity))
	f2.SetOpacity(initial(opacity))

	operating = 0
	return

/obj/machinery/door/poddoor/four_tile_hor/open()
	if(operating == 1) //doors can still open when emag-disabled
		return
	if(!SSticker)
		return 0
	if(!operating) //in case of emag
		operating = 1
	flick("pdoorc0", src)
	icon_state = "pdoor0"
	sleep(10)
	density = 0
	SetOpacity(0)

	f1.density = 0
	f1.SetOpacity(0)
	f2.density = 0
	f2.SetOpacity(0)
	f3.density = 0
	f3.SetOpacity(0)
	f4.density = 0
	f4.SetOpacity(0)

	if(operating == 1) //emag again
		operating = 0
	if(autoclose)
		spawn(150)
			autoclose()
	return 1

/obj/machinery/door/poddoor/four_tile_hor/close()
	if(operating)
		return
	operating = 1
	flick("pdoorc1", src)
	icon_state = "pdoor1"
	density = 1

	f1.density = 1
	f1.SetOpacity(1)
	f2.density = 1
	f2.SetOpacity(1)
	f3.density = 1
	f3.SetOpacity(1)
	f4.density = 1
	f4.SetOpacity(1)

	if(visible)
		SetOpacity(1)

	sleep(10)
	operating = 0
	return

/obj/machinery/door/poddoor/two_tile_ver/open()
	if(operating == 1) //doors can still open when emag-disabled
		return
	if(!SSticker)
		return 0
	if(!operating) //in case of emag
		operating = 1
	flick("pdoorc0", src)
	icon_state = "pdoor0"
	sleep(10)
	density = 0
	SetOpacity(0)

	f1.density = 0
	f1.SetOpacity(0)
	f2.density = 0
	f2.SetOpacity(0)

	if(operating == 1) //emag again
		operating = 0
	if(autoclose)
		spawn(150)
			autoclose()
	return 1

/obj/machinery/door/poddoor/two_tile_ver/close()
	if(operating)
		return
	operating = 1
	flick("pdoorc1", src)
	icon_state = "pdoor1"
	density = 1

	f1.density = 1
	f1.SetOpacity(1)
	f2.density = 1
	f2.SetOpacity(1)

	if(visible)
		SetOpacity(1)

	sleep(10)
	operating = 0
	return

/obj/machinery/door/poddoor/four_tile_ver/open()
	if(operating == 1) //doors can still open when emag-disabled
		return
	if(!SSticker)
		return 0
	if(!operating) //in case of emag
		operating = 1
	flick("pdoorc0", src)
	icon_state = "pdoor0"
	sleep(10)
	density = 0
	SetOpacity(0)

	f1.density = 0
	f1.SetOpacity(0)
	f2.density = 0
	f2.SetOpacity(0)
	f3.density = 0
	f3.SetOpacity(0)
	f4.density = 0
	f4.SetOpacity(0)

	if(operating == 1) //emag again
		operating = 0
	if(autoclose)
		spawn(150)
			autoclose()
	return 1

/obj/machinery/door/poddoor/four_tile_ver/close()
	if(operating)
		return
	operating = 1
	flick("pdoorc1", src)
	icon_state = "pdoor1"
	density = 1

	f1.density = 1
	f1.SetOpacity(1)
	f2.density = 1
	f2.SetOpacity(1)
	f3.density = 1
	f3.SetOpacity(1)
	f4.density = 1
	f4.SetOpacity(1)

	if(visible)
		SetOpacity(1)

	sleep(10)
	operating = 0
	return
*/

/obj/machinery/door/poddoor/two_tile_hor
	icon = 'icons/obj/doors/1x2blast_hor.dmi'
	dir = EAST
	width = 2


	/*Initialize()
		..()
		f1 = new/obj/machinery/door/poddoor/filler_object (loc)
		f2 = new/obj/machinery/door/poddoor/filler_object (get_step(src,EAST))
		f1.density = density
		f2.density = density
		f1.SetOpacity(opacity)
		f2.SetOpacity(opacity)

	Destroy()
		qdel(f1)
		f1 = null
		qdel(f2)
		f2 = null
		. = ..()*/

/obj/machinery/door/poddoor/two_tile_ver
	icon = 'icons/obj/doors/1x2blast_vert.dmi'
	dir = NORTH
	width = 2

	/*New()
		..()
		f1 = new/obj/machinery/door/poddoor/filler_object (loc)
		f2 = new/obj/machinery/door/poddoor/filler_object (get_step(src,NORTH))
		f1.density = density
		f2.density = density
		f1.SetOpacity(opacity)
		f2.SetOpacity(opacity)

	Destroy()
		qdel(f1)
		f1 = null
		qdel(f2)
		f2 = null
		. = ..()
*/

/obj/machinery/door/poddoor/four_tile_hor
	icon = 'icons/obj/doors/1x4blast_hor.dmi'
	dir = EAST
	width = 4

	/*Initialize()
		..()
		bound_height = 32
		bound_width = 128
		f1 = new/obj/machinery/door/poddoor/filler_object (loc)
		f2 = new/obj/machinery/door/poddoor/filler_object (get_step(f1,EAST))
		f3 = new/obj/machinery/door/poddoor/filler_object (get_step(f2,EAST))
		f4 = new/obj/machinery/door/poddoor/filler_object (get_step(f3,EAST))
		f1.density = density
		f2.density = densit
		f3.density = density
		f4.density = density
		f1.SetOpacity(opacity)
		f2.SetOpacity(opacity)
		f4.SetOpacity(opacity)
		f3.SetOpacity(opacity)

	Destroy()
		qdel(f1)
		f1 = null
		qdel(f2)
		f2 = null
		qdel(f3)
		f3 = null
		qdel(f4)
		f4 = null
		. = ..()*/

/obj/machinery/door/poddoor/four_tile_ver
	icon = 'icons/obj/doors/1x4blast_vert.dmi'
	//bound_height = 128
	dir = NORTH
	width = 4

	/*Initialize()
		..()
		f1 = new/obj/machinery/door/poddoor/filler_object (loc)
		f2 = new/obj/machinery/door/poddoor/filler_object (get_step(f1,NORTH))
		f3 = new/obj/machinery/door/poddoor/filler_object (get_step(f2,NORTH))
		f4 = new/obj/machinery/door/poddoor/filler_object (get_step(f3,NORTH))
		f1.density = density
		f2.density = density
		f3.density = density
		f4.density = density
		f1.SetOpacity(opacity)
		f2.SetOpacity(opacity)
		f4.SetOpacity(opacity)
		f3.SetOpacity(opacity)

	Destroy()
		qdel(f1)
		f1 = null
		qdel(f2)
		f2 = null
		qdel(f3)
		f3 = null
		qdel(f4)
		f4 = null
		. = ..()*/

/obj/machinery/door/poddoor/four_tile_hor/secure
	icon = 'icons/obj/doors/1x4blast_hor_secure.dmi'
	openspeed = 17
	resistance_flags = UNACIDABLE|INDESTRUCTIBLE

/obj/machinery/door/poddoor/four_tile_ver/secure
	icon = 'icons/obj/doors/1x4blast_vert_secure.dmi'
	openspeed = 17
	resistance_flags = UNACIDABLE|INDESTRUCTIBLE

/obj/machinery/door/poddoor/two_tile_hor/secure
	icon = 'icons/obj/doors/1x2blast_hor.dmi'
	openspeed = 17
	resistance_flags = UNACIDABLE|INDESTRUCTIBLE

/obj/machinery/door/poddoor/two_tile_ver/secure
	icon = 'icons/obj/doors/1x2blast_vert.dmi'
	openspeed = 17
	resistance_flags = UNACIDABLE|INDESTRUCTIBLE


/obj/machinery/door/poddoor/almayer
	icon = 'icons/obj/doors/almayer/blastdoors_shutters.dmi'
	openspeed = 4 //shorter open animation.
	tiles_with = list(
		/turf/closed/wall,
		/obj/structure/window/framed/almayer,
		/obj/machinery/door/airlock)

/obj/machinery/door/poddoor/almayer/Initialize()
	relativewall_neighbours()
	return ..()
