extends Action
class_name ApplyStatusEffectAction


func _init(
	status_effect_action_data: ApplyStatusEffectActionData, 
	status_effect_target: CreatureCard, 
	status_effect_source: GameEntity
	) -> void:
	target = status_effect_target
	source = status_effect_source
	data = status_effect_action_data


func can_execute() -> bool:
	var status_effect_data: StatusEffectData = data.status_effect_data
	var validation := ApplyStatusEffectRule.validade(status_effect_data, target, source)
	var rule_context := RuleContext.new(source, target, self)
	RuleSystem.apply_rules(Enums.RULE_HOOK.BEFORE_APPLY_STATUS_EFFECT, rule_context)
	
	if not validation.ok:
		cancel(validation.reason)
		return false
		
		
	if not rule_context.allowed or rule_context.canceled:
		cancel(rule_context.reason)
		return false
		
	return true

func execute():
	var status_effect_data: StatusEffectData = data.status_effect_data
	var status_effect = StatusEffect.new(status_effect_data, source, target)
	target.add_status_effect(status_effect)
	ApplyStatusEffectEvent.new(status_effect).emit()
	
