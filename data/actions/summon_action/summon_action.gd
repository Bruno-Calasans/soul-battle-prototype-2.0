extends Action
class_name SummonAction

func _init(
	summon_data: SummonActionData,
	_source: Variant,
	_target: BoardSlot = null
	) -> void:
	type = Enums.ACTION_TYPE.SUMMON
	source = _source
	target = _target
	data = summon_data
	

func can_execute() -> bool:
	var player: Player = source if source is Player else source.owner
	var card_data = (data as SummonActionData).card_data
	var slot: BoardSlot = target
	
	if card_data == null: 
		cancel("Card não encontrado")
		return false
		
	if not player.board.has_empty_slot():
		cancel("Nenhum slot disponnível")
		return false

	# jogador invocando card
	if source is Player:
		
		if source == null: 
			cancel("Jogador não encontrado")
			return false

		# jogador tem energia para invocar criatura
		if not source.has_energy(card_data.cost):
			cancel("Energia insuficiente")
			return false
		
	# creature invocada por outro card	
	if source is CreatureCard:
		
		if source == null: 
			cancel("Criatura não encontrada")
			return false
		
	if slot:
		# se slot está vazio
		if not slot.card == null:
			cancel("Slot não está vazio")
			return false
			
		# se slot é do jogador
		if not target.owner == player:
			cancel("Jogador não possui esse slot")
			return false
						
	return true


func execute():
	var card_data = data.card_data
	var slot: BoardSlot = target
	var card: CreatureCard
	
	if source is Player:
		card = card_data.to_card(source, source.hand)
		source.consume_energy(card.get_cost())
		GameContext.zone_system.move_card(card, source.board, slot)
	
	if source is Card:
		card = card_data.to_card(source.owner, source.owner.board)
		GameContext.zone_system.move_card(card, source.owner, slot)
		
	SummonEvent.new(source, card, slot).emit()
