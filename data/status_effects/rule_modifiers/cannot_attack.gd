extends RuleModifier
class_name CannotAttack


func _init() -> void:
	hook = Enums.RULE_HOOK.BEFORE_ATTACK
	
	
func can_apply(context: RuleContext) -> bool:
	var action := context.action
	var source := context.source

	if not action is AttackAction:
		return false
		
	if not source is CreatureCard:
		return false
		
	if not source.has_rule_modifier(self):
		return false
		
	return true
	
	
func apply(context: RuleContext) -> void:
	context.deny()
