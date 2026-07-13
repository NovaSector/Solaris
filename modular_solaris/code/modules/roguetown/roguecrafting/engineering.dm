/datum/crafting_recipe/roguetown/engineering/firearmstock
	name = "Firearm stock"
	category = "Firearms"
	display_category = ITEM_CAT_ENG_COMBAT
	tools = (/obj/item/rogueweapon/huntingknife)
	reqs = list(/obj/item/grown/log/tree/small = 1)
	result = list(/obj/item/weaponcrafting/stock)
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 2

/datum/crafting_recipe/roguetown/engineering/firearmparts
	name = "Firearm parts"
	category = "Firearms"
	display_category = ITEM_CAT_ENG_COMBAT
	reqs = list(/obj/item/ingot/steel = 2)
	result = list(/obj/item/weaponcrafting/receiver)
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 4

/datum/crafting_recipe/roguetown/engineering/firearmbarrel
	name = "Firearm barrel"
	category = "Firearms"
	display_category = ITEM_CAT_ENG_COMBAT
	reqs = list(/obj/item/ingot/iron = 2)
	result = list(/obj/item/weaponcrafting/barrel)
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 3

/datum/crafting_recipe/roguetown/engineering/arquebus
	name = "Arquebus"
	category = "Firearms"
	display_category = ITEM_CAT_ENG_COMBAT
	reqs = list(/obj/item/ingot/steel = 8, /obj/item/ingot/bronze = 2, /obj/item/weaponcrafting/barrel = 1, /obj/item/weaponcrafting/receiver = 1, /obj/item/grown/log/tree/small = 1, /obj/item/weaponcrafting/stock = 1)
	result = list(/obj/item/gun/ballistic/arquebus)
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 5 //le ultimate challenge

/datum/crafting_recipe/roguetown/engineering/handgonne
	name = "Handgonne"
	category = "Firearms"
	display_category = ITEM_CAT_ENG_COMBAT
	reqs = list(/obj/item/ingot/iron = 4, /obj/item/weaponcrafting/barrel = 1, /obj/item/weaponcrafting/receiver = 1, /obj/item/grown/log/tree/small = 1, /obj/item/weaponcrafting/stock = 1)
	result = list(/obj/item/gun/ballistic/handgonne)
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 3

/datum/crafting_recipe/roguetown/engineering/arquebuspistol
	name = "Arquebus pistol"
	category = "Firearms"
	display_category = ITEM_CAT_ENG_COMBAT
	reqs = list(/obj/item/ingot/steel = 4, /obj/item/ingot/bronze = 1 , /obj/item/weaponcrafting/barrel = 1, /obj/item/weaponcrafting/receiver = 1, /obj/item/grown/log/tree/small = 1)
	result = list(/obj/item/gun/ballistic/arquebus_pistol)
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 4

/datum/crafting_recipe/roguetown/engineering/firearmramrod
	name = "replacement ramrod"
	category = "Firearms"
	display_category = ITEM_CAT_ENG_COMBAT
	reqs = list(/obj/item/ingot/iron = 1)
	result = list(/obj/item/ramrod)
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 3
