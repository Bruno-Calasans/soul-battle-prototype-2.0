extends Resource
class_name ApplyStatusEffectRule


static func validade(
	status_effect_data: StatusEffectData, 
	target: CreatureCard, 
	source: GameEntity
	) -> ValidationResult:
		var validation_ressult := ValidationResult.new()
		
		if target == null:
			validation_ressult.fail("Card para aplicar efeito não encontrado")
			return validation_ressult
			
		if source == null:
			validation_ressult.fail("Card que aplicou o status efeito não encontrado")
			return validation_ressult
			
			
		if target.is_immune_to(status_effect_data):
			validation_ressult.fail("Card é imune a {0}".format([status_effect_data.id]))
			return validation_ressult
		
		return validation_ressult
	
