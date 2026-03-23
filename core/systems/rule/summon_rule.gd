class_name SummonRule


static func validate_slot(slot: BoardSlot, owner: Player) -> ValidationResult:
	
	var result = ValidationResult.new()
	
	if not slot == null:
		
		if slot.card != null:
			result.fail("Slot está ocupado")
			return result
			
		if slot.owner != owner:
			result.fail("Slot é de outro jogador")
			return result
		
	return result


static func validate_player(player: Player, card_cost: int) -> ValidationResult:
	
	var result = ValidationResult.new()
	
	if player == null:
		result.fail("Player não encontrado")
		return result
		
	if not player.board.has_empty_slot():
		result.fail("Player não tem slot vazio")
		return result
		
	if not player.has_energy(card_cost):
		result.fail("Player não tem energia o suficiente")
		return result
		
	return result


static func validate_card(card: Variant) -> ValidationResult:
	
	var result = ValidationResult.new()
	
	if card == null:
		result.fail("Card não encontrado")
		
	return result
