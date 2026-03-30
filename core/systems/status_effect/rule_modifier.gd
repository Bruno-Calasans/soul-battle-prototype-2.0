extends Resource
class_name RuleModifier

@export var hook: Enums.RULE_HOOK
@export var priority: int = 0


func can_apply(context: RuleContext) -> bool:
	return true
	
	
func apply(context: RuleContext) -> void:
	pass
