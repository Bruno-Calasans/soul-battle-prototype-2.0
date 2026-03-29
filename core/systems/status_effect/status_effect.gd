extends Resource
class_name StatusEffect

var data: StatusEffectData
var source: GameEntity
var target: CreatureCard
var remaining_turns: int
var stacks: int

func _init(effect_data: StatusEffectData, effect_source: GameEntity, effect_target: CreatureCard ) -> void:
	data = effect_data
	source = effect_source
	target = effect_target
	remaining_turns = data.duration
	stacks = effect_data.max_stacks


func has_triggers():
	return data.triggers.size() > 0
	
	
func has_stats_modifiers():
	return data.stats_modifiers.size() > 0
	
	
func has_event_modifiers():
	return data.event_modifiers.size() > 0

	
func has_rule_modifiers():
	return data.rule_modifiers.size() > 0


func is_expired():
	return remaining_turns <= 0


func decrease_duration():
	remaining_turns = max(0, remaining_turns - 1)


	
	
	
