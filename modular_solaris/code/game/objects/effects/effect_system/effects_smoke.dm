/obj/effect/particle_effect/smoke/arquebus
	name = "smoke"
	icon = 'icons/effects/96x96.dmi'
	icon_state = "smoke"
	pixel_x = -32
	pixel_y = -32
	opacity = FALSE
	layer = FLY_LAYER
	plane = GAME_PLANE_UPPER
	anchored = TRUE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	animate_movement = 0
	amount = 4
	lifetime = 2 // 2 SSobj ticks (wait = 2s) = 4 seconds of full visibility before fading out
	opaque = FALSE

// Narrows the 3x3 tile puff down to a 1x3 tile cone stretching away from the shooter, rather than
// a fixed north/south column - the base matrix is oriented for a north-facing shot and gets rotated
// to match however the gun was actually aimed when it was fired.
/obj/effect/particle_effect/smoke/arquebus/Initialize(mapload, facing_dir)
	. = ..()
	var/matrix/cone = matrix(0.333, 0, 0, 0, 1, 0)
	if(facing_dir)
		cone.Turn(dir2angle(facing_dir))
	transform = cone
