extends Resource
class_name StatusEffectSystem

var active_effects: Array[ActiveStatusEffect] = []


func apply(effect: StatusEffect, source: Card, target: Card):
	var active_effect = ActiveStatusEffect.new(effect, source, target)
	active_effects.append(active_effect)
	
	
func remove(active_effect: ActiveStatusEffect):
	active_effects.erase(active_effect)


func update_duration():
	for active_effect in active_effects:
		active_effect.remaining_turns -= 1
		if active_effect.is_expired(): 
			remove(active_effect)
