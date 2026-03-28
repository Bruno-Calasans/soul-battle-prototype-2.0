extends Node

func get_dmg_type_name_by_value(value: Enums.DMG_TYPE):
	if value in EnumNames.DMG_TYPE_NAMES:
		return EnumNames.DMG_TYPE_NAMES[value]
	return null
	
	
func log_warn(msg):
	CLog.w(msg)
	
	
func log_info(msg: String):
	CLog.c(Color.SEA_GREEN, msg)
	
	
	
func log_cmd(msg: String):
	CLog.c(Color.DARK_ORANGE, msg)


func log_action(msg):
	CLog.c(Color.GREEN, msg)


func log_event(msg: String):
	CLog.c(Color.CORAL, msg)


func log_effect(msg: String):
	CLog.c(Color.BURLYWOOD, msg)
	

func show_value(title: String, value: Variant):
	CLog.c(Color.MEDIUM_PURPLE, title + " = {0}".format([value]))
