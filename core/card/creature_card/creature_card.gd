extends Card
class_name CreatureCard

var status: CreatureStatus
var status_effects = []
	
	
func set_current_atk(atk: int):
	status.current_atk = clamp(atk, Limits.MIN_ATK, Limits.MAX_ATK)


func set_current_health(health: int):
	status.current_health = clamp(health, Limits.MIN_HEALTH, Limits.MAX_HEALTH)
	

func set_current_def(def: int):
	status.current_def = clamp(def, Limits.MIN_DEF, Limits.MAX_DEF)
	

func set_current_evade(evade: int):
	status.current_evade = clamp(evade, Limits.MIN_EVADE, Limits.MAX_EVADE)


func get_current_health():
	return status.current_health
	

func get_current_def():
	return status.current_def


func get_resistence(dmg_type: Enums.DMG_TYPE):
	return status.resistence.get_resistence(dmg_type)
	

func take_damage(value: int):
	set_current_health(get_current_health() - value)
