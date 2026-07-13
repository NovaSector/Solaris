/datum/advclass/rogue/buccaneer
	name = "Buccaneer"
	tutorial = "You are a daring rogue of the seas! Bucaneers wield arquebus and swordplay to their advanntage - fighting dirty to outmaneuver foes with flair."
	outfit = /datum/outfit/job/roguetown/adventurer/buccaneer
	cmode_music = 'modular_solaris/sound/music/cmode/adventurer/combat_buccaneer.ogg'
	traits_applied = list(TRAIT_DODGEEXPERT, TRAIT_NUTCRACKER, TRAIT_DECEIVING_MEEKNESS)
	subclass_stats = list(
		STATKEY_PER = 1,
		STATKEY_WIL = 1,
		STATKEY_SPD = 2,
	)
	subclass_skills = list(
		/datum/skill/combat/firearms = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/knives = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/swords = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/swimming = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/wrestling = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/sneaking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/stealing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/music = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/lockpicking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/labor/fishing = SKILL_LEVEL_APPRENTICE,
	)

/datum/outfit/job/roguetown/adventurer/buccaneer/pre_equip(mob/living/carbon/human/H)
	..()
	to_chat(H, span_warning("You are a Buccaneer, a pirate who made a decent living elsewhere in the world. you spent your fortunes on clothes, whores and guns; but at least you still have the gun and dirty moves that make you truly a scoundrel."))
	head = /obj/item/clothing/head/roguetown/helmet/bandana
	pants = /obj/item/clothing/under/roguetown/trou/leathertights
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/sailor
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	backr = /obj/item/storage/backpack/rogue/satchel
	backl = /obj/item/rogueweapon/sword/cutlass
	belt = /obj/item/storage/belt/rogue/leather
	shoes = /obj/item/clothing/shoes/roguetown/boots
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	beltl = /obj/item/flashlight/flare/torch/lantern
	beltr = /obj/item/ammopouch/bullets
	backpack_contents = list(
		/obj/item/gun/ballistic/arquebus_pistol = 1,
		/obj/item/rogueweapon/huntingknife = 1,
		/obj/item/recipe_book/survival = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1
		)
	H.set_blindness(0)
