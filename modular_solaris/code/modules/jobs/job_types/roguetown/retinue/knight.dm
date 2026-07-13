/datum/advclass/knight/reiter
	name = "Reiter"
	tutorial = "You are a Reiter Cavalryman, a new type of heavily armed knight, known for using pistols in coordinated volleys while wearing plate armor. They emphasize mobility and firepower over the traditional shock tactics of knights."
	outfit = /datum/outfit/job/roguetown/knight/reiter

	category_tags = list(CTAG_ROYALGUARD)

	traits_applied = list(TRAIT_MEDIUMARMOR)
	subclass_stats = list(
		STATKEY_PER = 2,
		STATKEY_SPD = 2,
		STATKEY_INT = 1,
		STATKEY_LCK = 1,
		STATKEY_WIL = 1,
	)
	subclass_skills = list(
		/datum/skill/combat/swords = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/riding = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/climbing = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/sneaking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/tracking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/firearms = SKILL_LEVEL_JOURNEYMAN,
	)

/datum/outfit/job/roguetown/knight/reiter/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/sallet/visored
	cloak = /obj/item/clothing/cloak/tabard
	neck = /obj/item/clothing/neck/roguetown/bevor
	gloves = /obj/item/clothing/gloves/roguetown/chain
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor
	belt = /obj/item/storage/belt/rogue/leather/black
	beltl = /obj/item/rogueweapon/sword/sabre
	beltr = /obj/item/ammopouch/bullets
	backr = /obj/item/storage/backpack/rogue/satchel/black
	pants = /obj/item/clothing/under/roguetown/chainlegs
	armor = /obj/item/clothing/suit/roguetown/armor/plate/cuirass
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	id = /obj/item/scomstone/bad/garrison
	backpack_contents = list(
		/obj/item/gun/ballistic/arquebus_pistol = 1,
		/obj/item/flashlight/flare/torch/lantern = 1,
		/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1,
		/obj/item/rope/chain = 1,
		/obj/item/bait = 1
		)

	H.dna.species.soundpack_m = GLOB.voice_packs[/datum/voicepack/male/knight]
	add_verb(H, /mob/proc/haltyell)
