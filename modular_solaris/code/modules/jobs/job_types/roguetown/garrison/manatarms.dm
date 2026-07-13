/datum/outfit/job/roguetown/manorguard/skirmisher/proc/equip_handgonner(mob/living/carbon/human/H)
	beltr = /obj/item/ammopouch/bullets
	backl = /obj/item/gun/ballistic/handgonne
	H.adjust_skillrank(/datum/skill/combat/firearms, SKILL_LEVEL_JOURNEYMAN, TRUE)
