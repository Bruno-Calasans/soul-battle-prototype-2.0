extends Action
class_name DamageAction


func _init(dmg_source: GameEntity, dmg_target: CreatureCard, dmg_data: DamageActionData) -> void:
	source = dmg_source
	target = dmg_target
	data = dmg_data
	

func can_execute() -> bool:
	var dmg_validation = DamageRule.validate(source, target)
	
	if not dmg_validation.ok:
		return false
		
	return true


func execute():
	var final_damage = GameContext.damage_system.calculate_dmg(
		source, 
		target, 
		data.value, 
		data.type
	)
	
	# recebe dano
	target.take_damage(final_damage)
	
	data.value = final_damage
	DamageEvent.new(source, target, data).emit()
	
	
