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
	transform = matrix(0.333, 0, 0, 0, 1, 0) // narrows the 3x3 tile puff down to a 1x3 tile cone, since a 2x3 doesn't sit cleanly on the tile grid
