extends Action
class_name AttributeModifierAction

var target: CreatureCard
var modifier_data: AttributeModifierActionData

func _init(_modifier_data: AttributeModifierActionData,  _target: CreatureCard,) -> void:
	modifier_data = _modifier_data
	target = _target
	

func can_execute() -> bool:
	if target == null:
		cancel("Target não encontrado")
		return false
	return true
	
func execute():
	var value = modifier_data.value
	
	match modifier_data.modifier_type:
		Enums.MODIFIER_TYPE.INCREASE:
			match modifier_data.attribute:
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
					
		Enums.MODIFIER_TYPE.DECREASE:
			match modifier_data.attribute:
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
					
		Enums.MODIFIER_TYPE.SET:
			match modifier_data.attribute:
				Enums.ATTRIBUTE.HP:
					target.set_current_health(value)
					
				Enums.ATTRIBUTE.ATTACK:
					target.set_current_atk(value)
					
				Enums.ATTRIBUTE.DEF:
					target.set_current_def(value)
					
				Enums.ATTRIBUTE.EVADE:
					target.set_current_evade(value)
