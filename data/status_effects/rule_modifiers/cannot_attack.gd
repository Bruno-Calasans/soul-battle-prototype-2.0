extends RuleModifier
class_name CannotAttack


func _init() -> void:
	hook = Enums.RULE_HOOK.BEFORE_ATTACK
	
	
func can_apply(context: RuleContext) -> bool:
	if not context.action.type == Enums.ACTION_TYPE.ATTACK:
		return false
		
		
	if not context.source is CreatureCard:
		return false
		
	
	if not context.source.has_rule_modifier(self):
		return false
		
	return true
	
	
func apply(context: RuleContext) -> void:
	context.deny()
