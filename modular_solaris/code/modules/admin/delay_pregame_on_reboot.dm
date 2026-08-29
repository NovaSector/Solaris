/// Deciseconds to delay the pre-game lobby by, for the NEXT round only. Loaded from a file so the value survives
/// the actual world restart a round reboot performs; null means no delay is scheduled.
GLOBAL_VAR_INIT(pregame_reboot_delay, load_pregame_reboot_delay())

/proc/load_pregame_reboot_delay()
	var/savefile = file("data/pregame_reboot_delay.txt")
	if(!fexists(savefile))
		return null
	return text2num(trim(file2text(savefile)))

/proc/save_pregame_reboot_delay(newtime)
	var/savefile = file("data/pregame_reboot_delay.txt")
	fdel(savefile)
	if(!isnull(newtime))
		WRITE_FILE(savefile, "[newtime]")

/// Applies and immediately consumes a pending scheduled delay. Called once from ticker Initialize() so a
/// scheduled delay only ever affects the single round immediately following the reboot it was set on.
/datum/controller/subsystem/ticker/proc/apply_scheduled_pregame_delay()
	var/newtime = GLOB.pregame_reboot_delay
	if(isnull(newtime))
		return
	GLOB.pregame_reboot_delay = null
	save_pregame_reboot_delay(null)
	SetTimeLeft(newtime)
	if(newtime < 0)
		log_game("A previously scheduled admin delay has paused this round's pre-game lobby indefinitely.")
	else
		log_game("A previously scheduled admin delay has set this round's pre-game lobby to [DisplayTimeText(newtime)].")

/datum/admins/proc/delay_next_round()
	set category = "Server"
	set desc = "Schedules a pre-game delay for the round that starts AFTER this one reboots, without affecting the current round."
	set name = "Delay Pre-game on Reboot"

	var/default_value = GLOB.pregame_reboot_delay ? round(GLOB.pregame_reboot_delay / 10) : 0
	var/newtime = input(usr, "Set a time in seconds to delay the pre-game lobby of the NEXT round, applied once this round reboots. Set -1 for an indefinite delay (same meaning as Delay Pre-game). Set 0 to cancel a pending scheduled delay.", "Delay Pre-game on Reboot", default_value) as num|null
	if(isnull(newtime))
		return

	newtime = round(newtime) * 10

	if(newtime == 0)
		if(isnull(GLOB.pregame_reboot_delay))
			return
		GLOB.pregame_reboot_delay = null
		save_pregame_reboot_delay(null)
		message_admins("[key_name(usr)] cancelled the scheduled pre-game delay for the next round.")
		log_admin("[key_name(usr)] cancelled the scheduled pre-game delay for the next round.")
		return

	GLOB.pregame_reboot_delay = newtime
	save_pregame_reboot_delay(newtime)

	if(newtime < 0)
		message_admins("[key_name(usr)] has scheduled the NEXT round's pre-game lobby to be delayed indefinitely once this round reboots.")
		log_admin("[key_name(usr)] scheduled an indefinite pre-game delay for the next round, to take effect on reboot.")
	else
		message_admins("[key_name(usr)] has scheduled the NEXT round's pre-game lobby to be delayed by [DisplayTimeText(newtime)] once this round reboots.")
		log_admin("[key_name(usr)] scheduled the next round's pre-game delay to [DisplayTimeText(newtime)], to take effect on reboot.")

	SSblackbox.record_feedback("tally", "admin_verb", 1, "Delay Next Round Pre-game On Reboot")
