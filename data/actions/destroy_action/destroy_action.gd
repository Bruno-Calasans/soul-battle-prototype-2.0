extends Action
class_name DestroyAction


func _init(
	destroyed: Card, 
	destroyer: Card = null, 
	cause: DestroyCauseEnum.DESTROY_CAUSE = DestroyCauseEnum.DESTROY_CAUSE.COMBAT
	) -> void:
	source = destroyer
	target = destroyed
	data = {
		"cause": cause
	}


func can_execute() -> bool:
	var destroy_validation := DestroyRule.validade(target)
	var rule_context := RuleContext.new(source, target, self)
	RuleSystem.apply_rules(Enums.RULE_HOOK.BEFORE_DESTROY, rule_context)
	
	if not destroy_validation.ok:
		cancel(destroy_validation.reason)
		return false
		
	if not rule_context.allowed or rule_context.canceled:
		cancel(rule_context.reason)
		return false
		
	return true


func execute():
	target.destroy()
	GameContext.zone_system.move_card(target, target.owner.player_void)
	DestroyEvent.new(source, target, data.cause).emit()
	
