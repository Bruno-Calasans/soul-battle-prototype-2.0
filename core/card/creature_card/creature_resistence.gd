extends Resource
class_name CreatureResistence

const DMG_TYPE = Enums.DMG_TYPE

var DMG_TYPE_NAMES = EnumNames.DMG_TYPE_NAMES

@export var resistences = {
	"PHYSICAL": 0,
	"FIRE": 0,
	"WATER": 0,
	"EARTH": 0,
	"WIND": 0,
	"ELETRICITY": 0,
	"ICE": 0,
	"LIGHT": 0,
	"DARKNESS": 0
}

func get_resistence_name(dmg_type: DMG_TYPE):
	var resistence_name = DMG_TYPE_NAMES[dmg_type]
	if resistence_name == null: return 
	return resistence_name


func get_resistence(dmg_type: DMG_TYPE) -> int:
	var resistence_name = get_resistence_name(dmg_type)
	return resistences.get(resistence_name)
	

func set_resistence(dmg_type: DMG_TYPE, value: int):
	var resistence_name = get_resistence_name(dmg_type)
	var final_value = clamp(value, Limits.MIN_RESISTENCE, Limits.MAX_RESISTENCE)
	resistences[resistence_name] = final_value
		
		
func increase_resistence(dmg_type: DMG_TYPE, value: int):
	var current_resistence = get_resistence(dmg_type)
	var final_value = clamp(current_resistence + value,  Limits.MIN_RESISTENCE, Limits.MAX_RESISTENCE)
	set_resistence(dmg_type, final_value)
	
	
func drecrease_resistence(dmg_type: DMG_TYPE, value: int):
	var current_resistence = get_resistence(dmg_type)
	var final_value = clamp(current_resistence - value,  Limits.MIN_RESISTENCE, Limits.MAX_RESISTENCE)
	set_resistence(dmg_type, final_value)
