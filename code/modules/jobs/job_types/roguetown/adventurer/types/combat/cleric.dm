//shield
/datum/advclass/cleric
	name = "Cleric"
	tutorial = "Disciples of the divine - clerics are blessed with the power of miracles from the gods themselves."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	traits_applied = list(TRAIT_OUTLANDER)
	vampcompat = FALSE
	outfit = /datum/outfit/job/roguetown/adventurer/cleric
	category_tags = list(CTAG_ADVENTURER, CTAG_COURTAGENT)
	classes = list("Monk" = "You are a wandering acolyte, versed in both miracles and martial arts. You forego the heavy armor paladins wear in favor of a more nimble approach to combat, utilizing your fists.",
					"Paladin" = "A holy warrior. Where others of the clergy may have spent their free time studying scriptures, you have instead honed your skills with a blade.",
					"Missionary" = "You are a devout worshipper of the divine with a strong connection to your patron god. You've spent years studying scriptures and serving your deity - now you wander into foreign lands, spreading the word of your faith.",
					"Cantor" = "You were a bard once - but you've found a new calling. Your eyes have been opened to the divine, now you wander from city to city singing songs and telling tales of your patron's greatness.")

/datum/outfit/job/roguetown/adventurer/cleric
	allowed_patrons = ALL_PATRONS

/datum/outfit/job/roguetown/adventurer/cleric/pre_equip(mob/living/carbon/human/H)
	..()

	// Add druidic skill for Tamari followers
	if(istype(H.patron, /datum/patron/change/tamari))
		H.mind.adjust_skillrank(/datum/skill/magic/druidic, 3, TRUE)
		to_chat(H, span_notice("As a follower of Tamari, you have innate knowledge of druidic magic."))

	// CLASS ARCHETYPES
	H.adjust_blindness(-3)
	var/classes = list("Monk","Paladin","Cantor","Missionary")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)

		if("Monk")
			H.set_blindness(0)
			to_chat(H, span_warning("You are a wandering acolyte, versed in both miracles and martial arts. You forego the heavy armor paladins wear in favor of a more nimble approach to combat, utilizing your fists."))
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
			wrists = /obj/item/clothing/wrists/roguetown/bracers
			gloves = /obj/item/clothing/gloves/roguetown/chain
			pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
			shoes = /obj/item/clothing/shoes/roguetown/boots
			backl = /obj/item/storage/backpack/rogue/satchel
			belt = /obj/item/storage/belt/rogue/leather
			beltr = /obj/item/flashlight/flare/torch/lantern
			beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
			backpack_contents = list(/obj/item/flashlight/flare/torch = 1)
			var/datum/devotion/C = new /datum/devotion(H, H.patron)
			C.grant_spells_templar(H)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			var/weapons = list("Katar","Knuckle Dusters","MY BARE HANDS!!!")
			var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
			switch(weapon_choice)
				if("Katar")
					backpack_contents += list(/obj/item/rogueweapon/katar = 1)
				if("Knuckle Dusters")
					backpack_contents += list(/obj/item/rogueweapon/knuckles = 1)
				if("MY BARE HANDS!!!")
					ADD_TRAIT(H, TRAIT_CIVILIZEDBARBARIAN, TRAIT_GENERIC)
			switch(H.patron?.type)
				if(/datum/patron/light/aeternus)
					head = /obj/item/clothing/head/roguetown/roguehood/aeternus
					cloak = /obj/item/clothing/suit/roguetown/shirt/robe/aeternus
				if(/datum/patron/balance/zira)
					head =  /obj/item/clothing/head/roguetown/zirahood
					cloak = /obj/item/clothing/suit/roguetown/shirt/robe/zira
				if(/datum/patron/change/cinella)
					head = /obj/item/clothing/head/roguetown/roguehood/cinella
					cloak = /obj/item/clothing/suit/roguetown/shirt/robe/cinella
				if(/datum/patron/change/tamari)
					head = /obj/item/clothing/head/roguetown/tamarimask
					cloak = /obj/item/clothing/suit/roguetown/shirt/robe/tamari
				if(/datum/patron/balance/tsoridys)
					head = /obj/item/clothing/head/roguetown/tsoridyshood
					cloak = /obj/item/clothing/suit/roguetown/shirt/robe/tsoridys
				if (/datum/patron/balance/nunos)
					head = /obj/item/clothing/head/roguetown/roguehood //placeholder
					cloak = /obj/item/clothing/cloak/templar/nunite
				if (/datum/patron/balance/varielle)
					cloak = /obj/item/clothing/suit/roguetown/shirt/robe/varielle
					head = /obj/item/clothing/head/roguetown/variellemask
				else
					cloak = /obj/item/clothing/suit/roguetown/shirt/robe //placeholder, anyone who doesn't have cool patron drip sprites just gets generic robes
					head = /obj/item/clothing/head/roguetown/roguehood
			H.cmode_music = 'sound/music/combat_holy.ogg'
			H.change_stat("strength", 2)
			H.change_stat("endurance", 1)
			H.change_stat("speed", 2)
			H.change_stat("perception", -1)
			H.change_stat("intelligence", -1)

		if("Paladin")
			to_chat(H, span_warning("A holy warrior. Where others of the clergy may have spent their free time studying scriptures, you have instead honed your skills with a blade."))
			belt = /obj/item/storage/belt/rogue/leather
			backl = /obj/item/storage/backpack/rogue/satchel
			backr = /obj/item/rogueweapon/shield/tower
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
			wrists = /obj/item/clothing/wrists/roguetown/bracers
			pants = /obj/item/clothing/under/roguetown/chainlegs
			shoes = /obj/item/clothing/shoes/roguetown/boots
			gloves = /obj/item/clothing/gloves/roguetown/chain
			beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
			backpack_contents = list(/obj/item/flashlight/flare/torch = 1)
			H.mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
			H.cmode_music = 'sound/music/combat_holy.ogg'
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			switch(H.patron?.type)
				if(/datum/patron/light/aeternus)
					cloak = /obj/item/clothing/cloak/templar/aeternus
					head = /obj/item/clothing/head/roguetown/helmet/heavy/aeternian
				if(/datum/patron/balance/zira)
					cloak = /obj/item/clothing/cloak/templar/zira
					head = /obj/item/clothing/head/roguetown/helmet/heavy/zirahelm
				if(/datum/patron/change/cinella)
					cloak = /obj/item/clothing/cloak/templar/cinella
					head = /obj/item/clothing/head/roguetown/helmet/heavy/bucket
				if(/datum/patron/change/tamari)
					cloak = /obj/item/clothing/cloak/templar/tamari
					head = /obj/item/clothing/head/roguetown/helmet/heavy/tamarihelm
				if(/datum/patron/balance/tsoridys)
					cloak = /obj/item/clothing/cloak/templar/tsoridys
					head = /obj/item/clothing/head/roguetown/helmet/heavy/tsoridyshelm
				if (/datum/patron/balance/nunos)
					cloak = /obj/item/clothing/cloak/templar/nunos
					head = /obj/item/clothing/head/roguetown/helmet/heavy/nunos
				if (/datum/patron/balance/varielle)
					cloak = /obj/item/clothing/cloak/templar/varielle
					head = /obj/item/clothing/head/roguetown/helmet/heavy/variellian
				if (/datum/patron/balance/carthus)
					cloak = /obj/item/clothing/cloak/templar/carthus
					head = /obj/item/clothing/head/roguetown/helmet/heavy/bucket/gold
				if (/datum/patron/change/kasmidian)
					cloak = /obj/item/clothing/cloak/templar/kasmidian
					head = /obj/item/clothing/head/roguetown/helmet/heavy/bucket
				else
					cloak = /obj/item/clothing/cloak/cape/crusader
					head = /obj/item/clothing/head/roguetown/helmet/heavy/bucket
			var/datum/devotion/C = new /datum/devotion(H, H.patron)
			C.grant_spells_templar(H)
			var/weapons = list("Bastard Sword","Mace","Flail")
			var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
			switch(weapon_choice)
				if("Bastard Sword")
					H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
					beltr = /obj/item/rogueweapon/sword/long
				if("Mace")
					H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
					beltr = /obj/item/rogueweapon/mace
				if("Flail")
					H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
					beltr = /obj/item/rogueweapon/flail
			H.set_blindness(0)
			H.change_stat("strength", 2)
			H.change_stat("constitution", 2)
			H.change_stat("endurance", 1)

		if("Cantor")
			H.set_blindness(0)
			to_chat(H, span_warning("You were a bard once - but you've found a new calling. Your eyes have been opened to the divine, now you wander from city to city singing songs and telling tales of your patron's greatness."))
			head = /obj/item/clothing/head/roguetown/bardhat
			armor = /obj/item/clothing/suit/roguetown/armor/leather/vest
			backl = /obj/item/storage/backpack/rogue/satchel
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
			gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			pants = /obj/item/clothing/under/roguetown/trou/leather
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather
			belt = /obj/item/storage/belt/rogue/leather/knifebelt/iron
			beltr = /obj/item/rogueweapon/huntingknife/idagger/steel/special
			beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
			var/datum/devotion/C = new /datum/devotion(H, H.patron)
			C.grant_spells_templar(H)
			backpack_contents = list(/obj/item/flashlight/flare/torch = 1)
			H.mind.adjust_skillrank(/datum/skill/misc/music, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_EMPATH, TRAIT_GENERIC)
			H.cmode_music = 'sound/music/combat_bard.ogg'
			H.change_stat("strength", 1)
			H.change_stat("endurance", 1)
			H.change_stat("speed", 2)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/mockery)
			switch(H.patron?.type)
				if(/datum/patron/light/aeternus)
					cloak = /obj/item/clothing/cloak/templar/aeternus
				if(/datum/patron/balance/zira)
					cloak = /obj/item/clothing/cloak/templar/zira
				if(/datum/patron/change/cinella)
					cloak = /obj/item/clothing/cloak/templar/cinella
				if(/datum/patron/change/tamari)
					cloak = /obj/item/clothing/cloak/templar/tamari
				if(/datum/patron/balance/tsoridys)
					cloak = /obj/item/clothing/cloak/templar/tsoridys
				if (/datum/patron/balance/nunos)
					cloak = /obj/item/clothing/cloak/templar/nunos
				if (/datum/patron/balance/varielle)
					cloak = /obj/item/clothing/cloak/templar/varielle
				if (/datum/patron/balance/carthus)
					cloak = /obj/item/clothing/cloak/templar/carthus
				if (/datum/patron/change/kasmidian)
					cloak = /obj/item/clothing/cloak/templar/kasmidian
				else
					cloak = /obj/item/clothing/cloak/cape/crusader
			var/weapons = list("Harp","Lute","Accordion","Guitar","Hurdy-Gurdy","Viola","Vocal Talisman")
			var/weapon_choice = input("Choose your instrument.", "TAKE UP ARMS") as anything in weapons
			H.set_blindness(0)
			switch(weapon_choice)
				if("Harp")
					backr = /obj/item/rogue/instrument/harp
				if("Lute")
					backr = /obj/item/rogue/instrument/lute
				if("Accordion")
					backr = /obj/item/rogue/instrument/accord
				if("Guitar")
					backr = /obj/item/rogue/instrument/guitar
				if("Hurdy-Gurdy")
					backr = /obj/item/rogue/instrument/hurdygurdy
				if("Viola")
					backr = /obj/item/rogue/instrument/viola
				if("Vocal Talisman")
					backr = /obj/item/rogue/instrument/vocals

		if("Missionary")
			H.set_blindness(0)
			to_chat(H, span_warning("You are a devout worshipper of the divine with a strong connection to your patron god. You've spent years studying scriptures and serving your deity - now you wander into foreign lands, spreading the word of your faith."))
			backl = /obj/item/storage/backpack/rogue/satchel
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/priest
			pants = /obj/item/clothing/under/roguetown/trou/leather
			shoes = /obj/item/clothing/shoes/roguetown/boots
			backr = /obj/item/rogueweapon/woodstaff
			belt = /obj/item/storage/belt/rogue/leather
			beltr = /obj/item/flashlight/flare/torch/lantern
			backpack_contents = list(/obj/item/storage/belt/rogue/pouch/coins/poor = 1, /obj/item/flashlight/flare/torch = 1)
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
			H.cmode_music = 'sound/music/combat_holy.ogg'
			H.change_stat("intelligence", 2)
			H.change_stat("endurance", 1)
			H.change_stat("perception", 2)
			H.change_stat("speed", 1)
			switch(H.patron?.type)
				if(/datum/patron/light/aeternus)
					head = /obj/item/clothing/head/roguetown/roguehood/aeternus
					cloak = /obj/item/clothing/suit/roguetown/shirt/robe/aeternus
				if(/datum/patron/balance/zira)
					head =  /obj/item/clothing/head/roguetown/zirahood
					cloak = /obj/item/clothing/suit/roguetown/shirt/robe/zira
				if(/datum/patron/change/cinella)
					head = /obj/item/clothing/head/roguetown/roguehood/cinella
					cloak = /obj/item/clothing/suit/roguetown/shirt/robe/cinella
				if(/datum/patron/change/tamari)
					head = /obj/item/clothing/head/roguetown/tamarimask
					cloak = /obj/item/clothing/suit/roguetown/shirt/robe/tamari
					H.cmode_music = 'sound/music/combat_druid.ogg'
				if(/datum/patron/balance/tsoridys)
					head = /obj/item/clothing/head/roguetown/tsoridyshood
					cloak = /obj/item/clothing/suit/roguetown/shirt/robe/tsoridys
				if (/datum/patron/balance/nunos)
					head = /obj/item/clothing/head/roguetown/roguehood //placeholder
					cloak = /obj/item/clothing/cloak/templar/nunite
				if (/datum/patron/balance/varielle)
					cloak = /obj/item/clothing/suit/roguetown/shirt/robe/varielle
					head = /obj/item/clothing/head/roguetown/variellemask
				else
					cloak = /obj/item/clothing/suit/roguetown/shirt/robe //placeholder, anyone who doesn't have cool patron drip sprites just gets generic robes
					head = /obj/item/clothing/head/roguetown/roguehood
			var/datum/devotion/C = new /datum/devotion(H, H.patron)
			C.grant_spells(H)
			START_PROCESSING(SSobj, C)

	switch(H.patron?.type)
		if(/datum/patron/light/aeternus)
			neck = /obj/item/clothing/neck/roguetown/psicross/aeternus
		if(/datum/patron/balance/zira)
			neck = /obj/item/clothing/neck/roguetown/psicross/zira
		if(/datum/patron/change/cinella)
			neck = /obj/item/clothing/neck/roguetown/psicross/cinella
		if(/datum/patron/change/tamari)
			neck = /obj/item/clothing/neck/roguetown/psicross/tamari
		if(/datum/patron/balance/tsoridys)
			neck = /obj/item/clothing/neck/roguetown/psicross/tsoridys
		if(/datum/patron/balance/carthus)
			neck = /obj/item/clothing/neck/roguetown/psicross/carthus
		if(/datum/patron/balance/nunos)
			neck = /obj/item/clothing/neck/roguetown/psicross/nunos
		if(/datum/patron/balance/varielle)
			neck = /obj/item/clothing/neck/roguetown/psicross/varielle
		if(/datum/patron/change/kasmidian) // SOLARIS NOTE: kasmidian would ideally have their own psicross but idc to change this off xylix behavior rn
			var/list/psicross_options = list(
			/obj/item/clothing/neck/roguetown/psicross,
			/obj/item/clothing/neck/roguetown/psicross/aeternus,
			/obj/item/clothing/neck/roguetown/psicross/zira,
			/obj/item/clothing/neck/roguetown/psicross/cinella,
			/obj/item/clothing/neck/roguetown/psicross/tamari,
			/obj/item/clothing/neck/roguetown/psicross/tsoridys,
			/obj/item/clothing/neck/roguetown/psicross/carthus,
			/obj/item/clothing/neck/roguetown/psicross/nunos,
			/obj/item/clothing/neck/roguetown/psicross/varielle
			)
			neck = pick(psicross_options)

	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
