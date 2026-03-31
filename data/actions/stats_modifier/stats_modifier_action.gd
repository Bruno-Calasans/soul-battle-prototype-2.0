extends Action
class_name StatsModifierAction

func _init(stats_modifier_source: Card, stats_modified_target: CreatureCard, modifier_data: StatsModifierActionData) -> void:
	source = stats_modifier_source
	target = stats_modified_target
	data = modifier_data
	
	
func can_execute() -> bool:
	if target == null:
		cancel("Target não encontrado")
		return false
		
	return true
	
	
func execute():
	var modifier_data: StatsModifierActionData = data
	var value = modifier_data.value
	match modifier_data.operation:
		
		STATUS_EFFECT_ENUM.OPERATION.INCREASE:
			match data.attribute:
				STATUS_EFFECT_ENUM.BUFFABLE_ATRIBUTE.HP:
					var health = target.current_health + value
					target.set_current_health(health)
					
				STATUS_EFFECT_ENUM.BUFFABLE_ATRIBUTE.ATTACK:
					var atk = target.current_atk + value
					target.set_current_atk(atk)
					
				STATUS_EFFECT_ENUM.BUFFABLE_ATRIBUTE.DEF:
					var def = target.current_def + value
					target.set_current_def(def)
					
				STATUS_EFFECT_ENUM.BUFFABLE_ATRIBUTE.EVADE:
					var evade = target.current_evade + value
					target.set_current_evade(evade)
					
		STATUS_EFFECT_ENUM.OPERATION.DECREASE:
			match data.attribute:
				STATUS_EFFECT_ENUM.BUFFABLE_ATRIBUTE.HP:
					var health = target.current_health - value
					target.set_current_health(health)
					
				STATUS_EFFECT_ENUM.BUFFABLE_ATRIBUTE.ATTACK:
					var atk = target.current_atk - value
					target.set_current_atk(atk)
					
				STATUS_EFFECT_ENUM.BUFFABLE_ATRIBUTE.DEF:
					var def = target.current_def - value
					target.set_current_def(def)
					
				STATUS_EFFECT_ENUM.BUFFABLE_ATRIBUTE.EVADE:
					var evade = target.current_evade - value
					target.set_current_evade(evade)
					
		STATUS_EFFECT_ENUM.OPERATION.SET:
			match data.attribute:
				STATUS_EFFECT_ENUM.BUFFABLE_ATRIBUTE.HP:
					target.set_current_health(value)
					
				STATUS_EFFECT_ENUM.BUFFABLE_ATRIBUTE.ATTACK:
					target.set_current_atk(value)
					
				STATUS_EFFECT_ENUM.BUFFABLE_ATRIBUTE.DEF:
					target.set_current_def(value)
					
				STATUS_EFFECT_ENUM.BUFFABLE_ATRIBUTE.EVADE:
					target.set_current_evade(value)
	
	
