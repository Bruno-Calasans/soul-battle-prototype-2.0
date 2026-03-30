# criatura em campo
extends Card
class_name CreatureCard

# current
var current_atk: int
var current_health: int
var current_def: int
var current_evade: int
var current_resistence: CreatureResistence
var status_effects: Array[StatusEffect] = []


func _init(creature_data: CreatureCardData, _owner: Player, _zone: Zone) -> void:
	data = creature_data
	owner = _owner
	zone = _zone
	current_atk = data.base_atk
	current_def = data.base_def
	current_evade = data.base_evade
	current_health = data.base_health
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
	

func get_current_atk() -> int:
	var atk: int = current_atk
	var atk_modifiers := get_stats_modifiers(Enums.ATTRIBUTE.ATTACK)
	
	for atk_modifier in atk_modifiers:
		atk += atk_modifier.value 
	
	return atk


func get_current_def() -> int:
	var def: int = current_def
	var def_modifiers := get_stats_modifiers(Enums.ATTRIBUTE.DEF)
	
	for deff_modifier in def_modifiers:
		def += deff_modifier.value 
	
	return def
		
		
func take_damage(value: int):
	set_current_health(current_health - value)


func get_stats_modifiers(stat: Enums.ATTRIBUTE) -> Array[StatusEffectModifierData]:
	var found_modifiers: Array[StatusEffectModifierData] = []
	
	for effect in status_effects:
		
		if not effect.has_stats_modifiers(): continue
		
		for modifier in effect.data.stats_modifiers:
			if modifier.attribute == stat: 
				found_modifiers.append(modifier)
				
	return found_modifiers


func get_all_rule_modifiers():
	var modifiers: Array[RuleModifier] = []
	for status_effect in status_effects:
		if not status_effect.has_rule_modifiers(): continue
		modifiers.append_array(status_effect.data.rule_modifiers)
		
	return modifiers
		
		
func has_rule_modifier(rule_modifier: RuleModifier):
	for status_effect in status_effects:
		if status_effect.has_rule_modifier(rule_modifier):
			return true
			
	return false
	
	
func add_status_effect(status_effect: StatusEffect):
	status_effects.append(status_effect)	


func remove_status_effect(status_effect: StatusEffect):
	status_effects.erase(status_effect)


func is_immune_to(status_effect: StatusEffectData):
	return false
