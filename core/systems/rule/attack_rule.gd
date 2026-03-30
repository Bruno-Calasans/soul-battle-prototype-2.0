extends RefCounted
class_name AttackRule

static func validate(source: GameEntity, target: GameEntity) -> ValidationResult:
	var validation = ValidationResult.new()
	
	if source == null:
		validation.fail("Source não encontrado")
		
	if target == null:
		validation.fail("Target não encontrado")
		
	if target == source:
		validation.fail("Não pode atacar a si mesmo")
		
	return validation
		
		
