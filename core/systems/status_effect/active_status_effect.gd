extends Resource
class_name ActiveStatusEffect

var effect: StatusEffect
var source: CreatureCard
var target: CreatureCard
var remaining_turns: int

func _init(_effect: StatusEffect, _source: Card, _target: Card ) -> void:
	effect = _effect
	source = _source
	target = _target
	remaining_turns = effect.duration

func has_triggers():
	return effect.triggers.size() > 0
	
func has_modifiers():
	return effect.modifiers.size() > 0
	
func has_tag_rules():
	return effect.tag_rules.size() > 0

func is_expired():
	return remaining_turns <= 0
