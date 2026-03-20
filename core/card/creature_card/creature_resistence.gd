extends Resource
class_name CreatureResistence

const DMG_TYPE = Enums.DMG_TYPE
var DMG_TYPE_NAMES = EnumNames.DMG_TYPE_NAMES
var RESISTENCES = {
	[DMG_TYPE_NAMES.get(DMG_TYPE.PHYSICAL)]: 0,
	[DMG_TYPE_NAMES.get(DMG_TYPE.WATER)]: 0,
	[DMG_TYPE_NAMES.get(DMG_TYPE.FIRE)]: 0,
	[DMG_TYPE_NAMES.get(DMG_TYPE.EARTH)]: 0,
	[DMG_TYPE_NAMES.get(DMG_TYPE.AIR)]: 0,
	[DMG_TYPE_NAMES.get(DMG_TYPE.ELETRICITY)]: 0,
	[DMG_TYPE_NAMES.get(DMG_TYPE.FROST)]: 0,
	[DMG_TYPE_NAMES.get(DMG_TYPE.LIGHT)]: 0,
	[DMG_TYPE_NAMES.get(DMG_TYPE.DARK)]: 0
}

func get_resistence(dmg_type: DMG_TYPE) -> int:
	var dmg_resistence_name = Utils.get_dmg_type_name_by_value(dmg_type)
	return RESISTENCES[dmg_resistence_name]
	

func set_resistence(dmg_type: DMG_TYPE, value: int):
	var final_value = clamp(value, Limits.MIN_RESISTENCE, Limits.MAX_RESISTENCE)
	var dmg_resistence_name = Utils.get_dmg_type_name_by_value(dmg_type)
	if dmg_resistence_name != null:
		RESISTENCES[dmg_resistence_name] = final_value
		
		
func increase_resistence(dmg_type: DMG_TYPE, value: int):
	var current_resistence = get_resistence(dmg_type)
	var final_value = clamp(current_resistence + value,  Limits.MIN_RESISTENCE, Limits.MAX_RESISTENCE)
	set_resistence(dmg_type, final_value)
	
	
func drecrease_resistence(dmg_type: DMG_TYPE, value: int):
	var current_resistence = get_resistence(dmg_type)
	var final_value = clamp(current_resistence - value,  Limits.MIN_RESISTENCE, Limits.MAX_RESISTENCE)
	set_resistence(dmg_type, final_value)
