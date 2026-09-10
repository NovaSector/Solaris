/// Shared abstract parent for paper-cartridge muzzleloading firearms (arquebus, handgonne).
/// Holds the reload-state examine text so it isn't duplicated across each weapon type.
/obj/item/gun/ballistic/muzzleloader
	var/reloaded = FALSE

/obj/item/gun/ballistic/muzzleloader/examine(mob/user)
	. = ..()
	if(!chambered)
		. += span_notice("The firearm is unloaded.")
	else if(!reloaded)
		. += span_notice("The firearm has shot loaded. I should probably tamp it down with a ram rod.")
	else
		. += span_notice("The firearm is loaded and ready to fire.")
