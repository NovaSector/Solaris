/datum/migrant_wave/fablefield
	name = "The Fablefield Troupe"
	max_spawns = 1
	weight = 30
	downgrade_wave = /datum/migrant_wave/fablefield_down_one
	roles = list(
		/datum/migrant_role/fablefield/goliard = 1,
		/datum/migrant_role/fablefield/troubadour = 3,
	)
	greet_text = "A troupe of troubadours from the small township of Ale's Well, you travel to Sunmarch seeking inspiration. The people here look like they could do with a good show, give them one they'll remember!"

/datum/migrant_wave/fablefield_down_one
	name = "The Fablefield Troupe"
	shared_wave_type = /datum/migrant_wave/fablefield
	downgrade_wave = /datum/migrant_wave/fablefield_down_two
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/fablefield/goliard = 1,
		/datum/migrant_role/fablefield/troubadour = 2,
	)
	greet_text = "A troupe of troubadours from the small township of Ale's Well, you travel to Sunmarch seeking inspiration. The people here look like they could do with a good show, give them one they'll remember!"

/datum/migrant_wave/fablefield_down_two
	name = "The Fablefield Troupe"
	shared_wave_type = /datum/migrant_wave/fablefield
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/fablefield/goliard = 1,
		/datum/migrant_role/fablefield/troubadour = 1,
	)
	greet_text = "A troupe of troubadours from the small township of Ale's Well, you travel to Sunmarch seeking inspiration. The people here look like they could do with a good show, give them one they'll remember!"
