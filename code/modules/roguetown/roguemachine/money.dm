GLOBAL_VAR(moneymaster)

/obj/structure/roguemachine/money
	name = "machine"
	desc = ""
	icon = 'icons/roguetown/misc/machines.dmi'
	icon_state = "money1" // SOLARIS NOTE: not in the DMI? As far as I can see?
	density = FALSE
	blade_dulling = DULLING_BASH
	var/budget = 0
	var/izmaster = FALSE
	anchored = TRUE

/obj/structure/roguemachine/money/attackby(obj/item/P, mob/user, params)
	if(!user.cmode)
		if(istype(P, /obj/item/roguecoin))
			budget += P.get_real_price()
			qdel(P)
			update_icon()
			playsound(loc, 'sound/misc/machinevomit.ogg', 100, TRUE, -1)
			return
		else if(P.get_real_price())
			if(izmaster)
				return ..()
			if(!GLOB.moneymaster)
				say("The masters have perished?")
				playsound(src, 'sound/misc/machinequestion.ogg', 100, FALSE, -1)
				return
			if(P.get_real_price() > 100)
				say("This must be traded to a Guildmaster.")
				playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
				return
			var/obj/structure/roguemachine/money/twins/T = GLOB.moneymaster
			var/amtofsale = round(P.get_real_price()/2)
			if(amtofsale >= 1)
				if(T.budget >= amtofsale)
					T.budget -= amtofsale
					budget += amtofsale
					update_icon()
				else
					say("The masters cannot afford...")
					playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
					return
			P.forceMove(T.loc)
			playsound(T.loc, 'sound/misc/hiss.ogg', 100, TRUE, -1)
			say("Item accepted for [amtofsale] sunmarks.")
			playsound(src, 'sound/misc/machineyes.ogg', 100, FALSE, -1)
			playsound(T, 'sound/misc/machinevomit.ogg', 100, TRUE, -1)

		return
	..()


/obj/structure/roguemachine/money/Initialize()
	. = ..()
	icon_state = "money[rand(1,2)]"
	update_icon()

MAPPING_DIRECTIONAL_HELPERS(/obj/structure/roguemachine/money, 32)

/obj/structure/roguemachine/money/attack_hand(mob/living/user)
	. = ..()
	user.changeNext_move(CLICK_CD_MELEE)
	to_chat(user, span_info("I rub the machine clockwise."))
	if(budget > 0)
		say("[budget] SUNMARKS ARE MINE...")
		playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
		playsound(loc, 'sound/misc/beep.ogg', 100, FALSE, -1)
	update_icon()

/obj/structure/roguemachine/money/attack_right(mob/user)
	. = ..()
	if(.)
		return
	user.changeNext_move(CLICK_CD_MELEE)
	var/inputt = alert(user,"Gold, Silver, or Bronze?",,"BRONZE","SILVER","GOLD")
	if(inputt && Adjacent(user))
		to_chat(user, span_info("I pull on the [inputt] tongue."))
		if(inputt == "BRONZE" && budget >= 50)
			budget2change(budget, user, inputt)
			budget = 0
			if(isliving(user))
				var/mob/living/L = user
				L.emote("scream")
				L.Paralyze(50)
				L.Stun(50)
				L.visible_message(span_danger("[user] is buried under a mountain of coins!"))
		else
			budget2change(budget, user, inputt)
			switch(inputt)
				if("GOLD")
					var/kingmarks = budget/10
					if(kingmarks >= 1)
						for(var/i in 1 to kingmarks)
							budget -= 10
				if("SILVER")
					var/kingmarks = budget/5
					if(kingmarks >= 1)
						for(var/i in 1 to kingmarks)
							budget -= 5
				if("BRONZE")
					if(budget >= 1)
						for(var/i in 1 to budget)
							budget -= 1
		update_icon()

/obj/structure/roguemachine/proc/budget2change(budget, mob/user, specify)
	var/turf/T
	if(!user || (!ismob(user)))
		T = get_turf(src)
	else
		T = get_turf(user)
	if(!budget || budget <= 0)
		return
	budget = floor(budget)
	var/type_to_put
	var/kingmarks_to_put
	if(specify)
		switch(specify)
			if("GOLD")
				kingmarks_to_put = budget/10
				type_to_put = /obj/item/roguecoin/gold
			if("SILVER")
				kingmarks_to_put = budget/5
				type_to_put = /obj/item/roguecoin/silver
			if("BRONZE")
				kingmarks_to_put = budget
				type_to_put = /obj/item/roguecoin/copper
	else
		var/highest_found = FALSE
		var/kingmarks = floor(budget/10)
		if(kingmarks)
			budget -= kingmarks * 10
			highest_found = TRUE
			type_to_put = /obj/item/roguecoin/gold
			kingmarks_to_put = kingmarks
		kingmarks = floor(budget/5)
		if(kingmarks)
			budget -= kingmarks * 5
			if(!highest_found)
				highest_found = TRUE
				type_to_put = /obj/item/roguecoin/silver
				kingmarks_to_put = kingmarks
			else
				new /obj/item/roguecoin/silver(T, kingmarks)
		if(budget >= 1)
			if(!highest_found)
				type_to_put = /obj/item/roguecoin/copper
				kingmarks_to_put = budget
			else
				new /obj/item/roguecoin/copper(T, budget)
	if(!type_to_put || kingmarks_to_put < 1)
		return
	var/obj/item/roguecoin/G = new type_to_put(T, floor(kingmarks_to_put))
	if(user)
		user.put_in_hands(G)
	playsound(T, 'sound/misc/coindispense.ogg', 100, FALSE, -1)
/*
/obj/structure/roguemachine/money/attack_right(mob/user)
	. = ..()
	if(.)
		return
	user.changeNext_move(CLICK_CD_MELEE)
	playsound(loc, 'sound/misc/beep.ogg', 100, FALSE, -1)
	speaking = !speaking
	to_chat(user, span_info("I press the right eye."))
	update_icon()
*/
/obj/structure/roguemachine/money/obj_break(damage_flag)
	..()
	budget2change(budget)
	budget = 0
	update_icon()

/obj/structure/roguemachine/money/update_icon()
	cut_overlays()
	if(obj_broken)
		set_light(0)
		return
	set_light(1, 1, 1, l_color = "#1b7bf1")

/obj/structure/roguemachine/money/Destroy()
	set_light(0)
	budget2change(budget)
	budget = 0
	return ..()

/obj/structure/roguemachine/money/twins
	name = "janus twins"
	desc = "They may hold money for you."
	icon_state = "twins"
	icon = 'icons/roguetown/misc/64x64.dmi' // SOLARIS NOTE: ditto
	budget = 0
	pixel_x = -16
	izmaster = TRUE

/obj/structure/roguemachine/money/twins/Initialize()
	. = ..()
	budget = rand(50,200)
	icon_state = "twins"
	update_icon()
	GLOB.moneymaster = src

/obj/structure/roguemachine/money/twins/obj_break(damage_flag)
	. = ..()
	GLOB.moneymaster = null

/obj/structure/roguemachine/money/twins/update_icon()
	cut_overlays()
	if(obj_broken)
		set_light(0)
		return
	if(budget > 10)
		add_overlay(mutable_appearance(icon, "[icon_state]-e"))
	else
		add_overlay(mutable_appearance(icon, "[icon_state]-b"))
	set_light(1, 1, 1, l_color = "#1b7bf1")
