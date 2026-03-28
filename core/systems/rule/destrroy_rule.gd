extends RefCounted
class_name DestroyRule


static func validade(destroyed_card: Card) -> ValidationResult:
	var validation := ValidationResult.new()
	
	if destroyed_card == null:
		validation.fail("Card a ser destruído não encontrada")
		return validation
		
	if destroyed_card.is_destroyed:
		validation.fail("Card já está destruído")
		return validation
		

	return validation
