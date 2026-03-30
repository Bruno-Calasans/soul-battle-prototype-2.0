extends GameCommand
class_name AttackCommand

func _init(attacker: Card, attacked: Card) -> void:
	type = Enums.COMMAND_TYPE.ATTACK
	source = attacker
	target = attacked


func can_execute() -> bool:
	var atk_validation := AttackRule.validate(source, target)
	
	if not atk_validation.ok:
		reject(atk_validation.reason)
		return false

	return true
	
	
func to_action() -> Action:
	return AttackAction.new(source, target)
