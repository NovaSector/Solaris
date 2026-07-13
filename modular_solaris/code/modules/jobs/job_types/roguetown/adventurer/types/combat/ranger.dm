/datum/advclass/ranger/arquebusier
	name = "Arquebusier"
	tutorial = "You are a arquebusier, a nobleman traveling from far off; with the most modern and powerful equipment money can buy. You trained hard with this new technology and wish to tame this wild frontier may it be for honor, something to prove, or to claim the treasures of long dead empires."
	outfit = /datum/outfit/job/roguetown/adventurer/arquebusier
	traits_applied = list(TRAIT_DODGEEXPERT, TRAIT_OUTDOORSMAN, TRAIT_NOBLE)
	subclass_stats = list(
		STATKEY_PER = 3,
		STATKEY_SPD = 2,
	)
	subclass_skills = list(
		/datum/skill/combat/firearms = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/swords = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/unarmed = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/tracking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/sneaking = SKILL_LEVEL_APPRENTICE,
	)

/datum/outfit/job/roguetown/adventurer/arquebusier/pre_equip(mob/living/carbon/human/H)
	..()
	to_chat(H, span_warning("You are a arquebusier, a nobleman traveling from far off; with the most modern and powerful equipment money can buy. You trained hard with this new technology and wish to tame this wild frontier may it be for honor, something to prove, or to claim the treasures of long dead empires."))
	head = /obj/item/clothing/head/roguetown/grenzelhofthat
	shoes = /obj/item/clothing/shoes/roguetown/grenzelhoft
	shirt = /obj/item/clothing/suit/roguetown/shirt/tunic
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/grenzelpants
	gloves = /obj/item/clothing/gloves/roguetown/angle/grenzelgloves
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	belt = /obj/item/storage/belt/rogue/leather
	armor = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/grenzelhoft
	cloak = /obj/item/clothing/cloak/tabard/stabard/grenzelhoft
	backr = /obj/item/storage/backpack/rogue/satchel
	backl = /obj/item/gun/ballistic/arquebus
	beltr = /obj/item/flashlight/flare/torch/lantern
	beltl = /obj/item/ammopouch/bullets
	backpack_contents = list(
		/obj/item/bait = 1,
		/obj/item/rogueweapon/huntingknife/idagger/steel = 1,
		/obj/item/recipe_book/survival = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1
		)
	H.set_blindness(0)
