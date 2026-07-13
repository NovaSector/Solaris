// Fixes the icon on the pre-existing (previously unreachable) core gunpowder ammo:
// destination's shared ammo.dmi doesn't have the musketball/musketball_proj states.
/obj/item/ammo_casing/caseless/rogue/bullet
	icon = 'modular_solaris/icons/roguetown/weapons/ammo_musketball.dmi'

/obj/projectile/bullet/reusable/bullet
	icon = 'modular_solaris/icons/roguetown/weapons/ammo_musketball_proj.dmi'

// Solaris-owned copy of the base musket ball/projectile, so future Azure Peak changes to the
// parent type don't silently change gunpowder weapon behavior out from under us.
// Parented off the plain bullet type rather than /obj/projectile/bullet/reusable: a fired shot is
// a spent paper cartridge, not an arrow, so it should never embed in a wound or leave a
// recoverable casing behind on a miss or wall hit.
/obj/projectile/bullet/solaris
	name = "lead ball"
	icon = 'modular_solaris/icons/roguetown/weapons/ammo_musketball_proj.dmi'
	icon_state = "musketball_proj"
	damage = 45
	damage_type = BRUTE
	range = 12
	hitsound = 'sound/combat/hits/hi_arrow2.ogg'
	embedchance = 0
	woundclass = BCLASS_PIERCE
	impact_effect_type = null
	armor_penetration = PEN_HEAVY
	npc_simple_damage_mult = 3
	speed = 0.1

/obj/item/ammo_casing/caseless/rogue/bullet/solaris
	name = "lead shot paper cartridge"
	desc = "A lead ball shot with pre-measured powder packed into a paper cartridge for ease of loading."
	projectile_type = /obj/projectile/bullet/solaris
	icon = 'modular_solaris/icons/roguetown/weapons/paper_cartridges.dmi'
	icon_state = "lead"

/obj/projectile/bullet/solaris/steel
	name = "steel ball"
	damage = 50
	woundclass = BCLASS_STAB

/obj/item/ammo_casing/caseless/rogue/bullet/solaris/steel
	name = "steel shot paper cartridge"
	desc = "A steel ball shot with pre-measured powder packed into a paper cartridge for ease of loading."
	projectile_type = /obj/projectile/bullet/solaris/steel
	icon = 'modular_solaris/icons/roguetown/weapons/paper_cartridges.dmi'
	icon_state = "steel"
	dropshrink = 0.5
	possible_item_intents = list(/datum/intent/use)
	max_integrity = 0
	armor_penetration = 85
	w_class = WEIGHT_CLASS_TINY
