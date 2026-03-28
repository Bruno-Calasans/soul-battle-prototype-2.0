extends Node

static func validate(source: Card, target: CreatureCard):
	var validation = ValidationResult.new()
	
	if source == null:
		validation.fail("Source não encontrado")
		
	if target == null:
		validation.fail("Target não encontrado")
		
		
		
	RuleSystem.apply_rules(Enums.RULE_HOOK.BEFORE_ATTACK, )
	
	return validation
		
		
