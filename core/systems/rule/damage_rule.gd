extends RefCounted
class_name DamageRule


static func validate(source: Card, target: CreatureCard):
	var validation = ValidationResult.new()
	
	if source == null:
		validation.fail("Source não encontrado")
		
	if target == null:
		validation.fail("Target não encontrado")
		
	return validation
		
		
