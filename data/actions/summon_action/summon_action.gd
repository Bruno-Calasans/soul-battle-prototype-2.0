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
	var validations: Array[ValidationResult] = []
	
	if source is Player:
		var player_validation = SummonRule.validate_player(source, card_data.cost)
		validations.append(player_validation)
		
	if source is Card:
		var card_validation = SummonRule.validate_card(card_data)
		validations.append(card_validation)
			
	var slot_validation = SummonRule.validate_slot(slot, player)
	validations.append(slot_validation)
		
	for validation in validations:
		if not validation.ok:
			cancel(validation.reason)
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
