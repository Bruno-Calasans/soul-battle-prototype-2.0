extends Node

func get_dmg_type_name_by_value(value: Enums.DMG_TYPE):
	if value in EnumNames.DMG_TYPE_NAMES:
		return EnumNames.DMG_TYPE_NAMES[value]
	return null
	
