/// "Asay" but wrapped in the command_headset style (bold, large font) and accompanied by a sound, for messages
/// that need to stand out in admin chat. Mirrors code/modules/admin/verbs/adminsay.dm's cmd_admin_say().
/client/proc/cmd_loud_admin_say(msg as text)
	set category = "Admin.Admin"
	set name = "Loud Asay"
	set hidden = 0
	if(!check_rights(0))
		return

	msg = emoji_parse(copytext(sanitize(msg), 1, MAX_MESSAGE_LEN))
	if(!msg)
		return

	mob.log_talk(msg, LOG_ASAY)
	msg = keywords_lookup(msg)
	var/custom_asay_color = (CONFIG_GET(flag/allow_admin_asaycolor) && prefs.asaycolor) ? "<font color=[prefs.asaycolor]>" : "<font color='#FF4500'>"
	msg = "<span class='command_headset'><span class='adminsay'><span class='prefix'>ADMIN:</span> <EM>[key_name(usr, 1)]</EM> [ADMIN_FLW(mob)]: [custom_asay_color]<span class='message linkify'>[msg]</span></span>[custom_asay_color ? "</font>":null]</span>"
	to_chat(GLOB.admins, msg)

	for(var/client/admin_client as anything in GLOB.admins)
		if(admin_client.prefs.toggles & SOUND_ADMINHELP)
			SEND_SOUND(admin_client, sound('modular_solaris/sound/admin/duckhonk.ogg'))
		window_flash(admin_client, ignorepref = TRUE)

	SSblackbox.record_feedback("tally", "admin_verb", 1, "Loud Asay") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/get_loud_admin_say()
	var/msg = input(src, null, "loud asay \"text\"") as text|null
	cmd_loud_admin_say(msg)
