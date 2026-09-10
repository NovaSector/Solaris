/// Text of the persistent admin notice, if one has been set. Stored separately from GLOB.admin_notice so it
/// survives a world restart (GLOB.admin_notice itself is not saved anywhere and always starts blank on boot).
GLOBAL_VAR_INIT(persistent_admin_notice, load_persistent_admin_notice())

/proc/load_persistent_admin_notice()
	var/savefile = file("data/persistent_admin_notice.txt")
	if(!fexists(savefile))
		return ""
	return file2text(savefile)

/proc/save_persistent_admin_notice(text)
	var/savefile = file("data/persistent_admin_notice.txt")
	fdel(savefile)
	if(text)
		WRITE_FILE(savefile, text)

/// Re-applies the persisted notice (if any) into GLOB.admin_notice at round start, reusing the existing
/// admin_notice display pipeline (new player login message, the Adminnotice check verb, etc.) as-is.
/// Called once from ticker Initialize() so it's in place before anyone can join.
/datum/controller/subsystem/ticker/proc/apply_persistent_admin_notice()
	if(GLOB.persistent_admin_notice)
		GLOB.admin_notice = GLOB.persistent_admin_notice

/datum/admins/proc/set_persistent_admin_notice()
	set category = "Server"
	set name = "Set Persistent Admin Notice"
	set desc = "Set an announcement that appears to everyone who joins the server, every round, until cleared. Unlike Set Admin Notice, this survives a server reboot."
	if(!check_rights(0))
		return

	var/new_notice = input(src, "Set a public notice that persists across round reboots.\nEveryone who joins the server will see it, every round, until this is cleared.\n(Leaving it blank will delete the current persistent notice):", "Set Persistent Notice", GLOB.persistent_admin_notice) as message|null
	if(new_notice == null)
		return
	if(new_notice == GLOB.persistent_admin_notice)
		return

	GLOB.persistent_admin_notice = new_notice
	save_persistent_admin_notice(new_notice)
	GLOB.admin_notice = new_notice // shares the same display pipeline as the round-only notice, so setting/clearing this also updates what's currently shown

	if(new_notice == "")
		message_admins("[key_name(usr)] removed the persistent admin notice.")
		log_admin("[key_name(usr)] removed the persistent admin notice.")
	else
		message_admins("[key_name(usr)] set the persistent admin notice.")
		log_admin("[key_name(usr)] set the persistent admin notice:\n[new_notice]")
		to_world(span_adminnotice("<b>Admin Notice:</b>\n \t [new_notice]"))
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Set Persistent Admin Notice") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
