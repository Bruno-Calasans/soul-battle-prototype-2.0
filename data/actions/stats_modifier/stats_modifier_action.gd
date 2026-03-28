extends Action
class_name StatsModifierAction

func _init(_modifier_data: StatsModifierActionData,  _source: Card, _target: CreatureCard,) -> void:
	data = _modifier_data
	source = _source
	target = _target
	

func can_execute() -> bool:
	if target == null:
		cancel("Target não encontrado")
		return false
		
	return true
	
	
func execute():
	var modifier_data: StatsModifierActionData = data
	var value = modifier_data.value
	
	match modifier_data.operation:
		
		Enums.OPERATION.INCREASE:
			match data.attribute:
				Enums.ATTRIBUTE.HP:
					var health = target.current_health + value
					target.set_current_health(health)
					
				Enums.ATTRIBUTE.ATTACK:
					var atk = target.current_atk + value
					target.set_current_atk(atk)
					
				Enums.ATTRIBUTE.DEF:
					var def = target.current_def + value
					target.set_current_def(def)
					
				Enums.ATTRIBUTE.EVADE:
					var evade = target.current_evade + value
					target.set_current_evade(evade)
					
		Enums.OPERATION.DECREASE:
			match data.attribute:
				Enums.ATTRIBUTE.HP:
					var health = target.current_health - value
					target.set_current_health(health)
					
				Enums.ATTRIBUTE.ATTACK:
					var atk = target.current_atk - value
					target.set_current_atk(atk)
					
				Enums.ATTRIBUTE.DEF:
					var def = target.current_def - value
					target.set_current_def(def)
					
				Enums.ATTRIBUTE.EVADE:
					var evade = target.current_evade - value
					target.set_current_evade(evade)
					
		Enums.OPERATION.SET:
			match data.attribute:
				Enums.ATTRIBUTE.HP:
					target.set_current_health(value)
					
				Enums.ATTRIBUTE.ATTACK:
					target.set_current_atk(value)
					
				Enums.ATTRIBUTE.DEF:
					target.set_current_def(value)
					
				Enums.ATTRIBUTE.EVADE:
					target.set_current_evade(value)
	
	
