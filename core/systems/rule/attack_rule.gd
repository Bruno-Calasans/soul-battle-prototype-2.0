extends RefCounted
class_name AttackRule

static func validate(source: GameEntity, target: GameEntity) -> ValidationResult:
	var validation = ValidationResult.new()
	
	if source == null:
		validation.fail("Source não encontrado")
		
	if target == null:
		validation.fail("Target não encontrado")
		
	return validation
		
		
