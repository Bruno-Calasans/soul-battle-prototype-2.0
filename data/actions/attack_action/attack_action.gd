extends Action
class_name AttackAction


func _init(attack_data: AttackActionData) -> void:
	data = attack_data
	source = attack_data.attacker
	target = attack_data.attacked
	

func can_execute() -> bool:
	var context: RuleContext = RuleContext.new(source, target, self)
	RuleSystem.apply_rules(Enums.RULE_HOOK.BEFORE_ATTACK, context)
	
	if context.canceled or not context.allowed:
		cancel("")
		return false
	
	return true
	
	
func execute():
	var action = data.to_action(source, target)
	GameContext.action_system.add_to_queue(action)
	AttackEvent.new(source, target).emit()
	
