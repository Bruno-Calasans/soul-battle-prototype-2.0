# jogador invoca criatura
extends GameCommand
class_name SummonCardCommand

func _init(card_data: CreatureCardData, _source: Variant, slot: BoardSlot = null) -> void:
	type = Enums.COMMAND_TYPE.SUMMON
	source = _source
	data = {
		"card_data": card_data,
		"slot": slot
	}
	
	
func can_execute() -> bool:
	var player: Player = source if source is Player else source.owner
	var card_data: CreatureCardData = data.card_data
	var slot: BoardSlot = data.slot
	
	if card_data == null: 
		reject("Card não encontrado")
		return false
		
	if not player.board.has_empty_slot():
		reject("Nenhum slot disponnível")
		return false
		
	if source is Player:
		# dados inválidos
		if source == null: 
			reject("Jogador não encontrado")
			return false
			
		# jogador não tem energia
		if not source.has_energy(card_data.cost): 
			reject("Jogador não tem energia o suficiente")
			return false
	
	
	if source is CreatureCard:
		if source == null: 
			reject("Criatura não encontrada")
			return false
		
	if slot:
		# se slot está vazio
		if not slot.card == null:
			reject("Slot não está vazio")
			return false
			
		# se slot é do jogador
		if not slot.owner == player:
			reject("Jogador não possui esse slot")
		return false
		
	return true


func to_action():
	var summon_action_data = SummonActionData.new(data.card_data)
	return SummonAction.new(summon_action_data, source, data.slot)
	
