extends Action
class_name SummonAction

func _init(
	summon_action_data: CreatureCardData,
	summoner_source: GameEntity,
 	slot: BoardSlot = null,
	) -> void:
	type = GAME_ENUM.ACTION_TYPE.SUMMON
	source = summoner_source
	data = {
		"slot": slot,
		"card_data": summon_action_data
	}
	

func can_execute() -> bool:
	var validations: Array[ValidationResult] = []
	var player: Player = source if source is Player else source.owner
	var card_data: CreatureCardData = data.card_data 
	var slot: BoardSlot = data.slot
	
	if source is Player:
		var player_validation = SummonRule.validate_player(source, card_data.cost)
		validations.append(player_validation)
		
	if source is Card:
		var card_validation = SummonRule.validate_card(card_data)
		validations.append(card_validation)
			
	if slot is BoardSlot:
		var slot_validation = SummonRule.validate_slot(slot, player)
		validations.append(slot_validation)
		
	for validation in validations:
		if not validation.ok:
			cancel(validation.reason)
			return false

	return true


func execute():
	var card_data: CreatureCardData = data.card_data
	var slot: BoardSlot = data.slot
	var card: CreatureCard
	var board: Board
	
	if source is Player:
		card = card_data.to_card(source, source.hand)
		board = source.board
		source.consume_energy(card.get_cost())
	
	if source is Card:
		board = source.owner.board
		card = card_data.to_card(source.owner, board)
		
	GameContext.zone_system.move_card(card, board, slot)
	SummonEvent.new(card, source, slot).emit()
