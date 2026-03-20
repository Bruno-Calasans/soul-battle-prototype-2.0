# criatura em campo
extends Card
class_name CreatureCard

# current
var current_atk: int
var current_health: int
var current_def: int
var current_evade: int
var current_resistence: CreatureResistence

func _init(creature_data: CreatureCardData, _owner: Player, _zone: Zone) -> void:
	data = creature_data
	owner = _owner
	zone = _zone
	current_atk = data.base_atk
	current_def = data.base_def
	current_evade = data.base_def
	current_evade = data.base_evade
	current_resistence = data.resistence

	
func set_current_atk(atk: int):
	current_atk = clamp(atk, Limits.MIN_ATK, Limits.MAX_ATK)


func set_current_health(health: int):
	current_health = clamp(health, Limits.MIN_HEALTH, Limits.MAX_HEALTH)
	

func set_current_def(def: int):
	current_def = clamp(def, Limits.MIN_DEF, Limits.MAX_DEF)
	

func set_current_evade(evade: int):
	current_evade = clamp(evade, Limits.MIN_EVADE, Limits.MAX_EVADE)


func get_resistence(dmg_type: Enums.DMG_TYPE):
	return current_resistence.get_resistence(dmg_type)
	

func take_damage(value: int):
	set_current_health(current_health - value)
