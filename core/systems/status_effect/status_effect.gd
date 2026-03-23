extends Resource
class_name StatusEffect

var data: StatusEffectData
var source: CreatureCard
var target: CreatureCard
var remaining_turns: int

func _init(_effect_data: StatusEffectData, _source: Card, _target: Card ) -> void:
	data = _effect_data
	source = _source
	target = _target
	remaining_turns = data.duration


func has_triggers():
	return data.triggers.size() > 0
	
	
func has_stats_modifiers():
	return data.modifiers.size() > 0
	
	
func has_event_modifiers():
	return data.event_modifiers.size() > 0

	
func has_tag_rules():
	return data.tag_rules.size() > 0


func is_expired():
	return remaining_turns <= 0


func decrease_duration():
	remaining_turns = max(0, remaining_turns - 1)
