# jogador invoca criatura
extends GameCommand
class_name SummonCardCommand

# source = Player or Card
# target = Card invocado
# data = quem quer invoca (source), o que quer invocar (target), onde quer invocar (slot)

func _init(card_data: CreatureCardData, summoner: Variant, slot: BoardSlot = null) -> void:
	type = Enums.COMMAND_TYPE.SUMMON
	source = summoner
	data = {
		"summoner": summoner,
		"card_data": card_data,
		"slot": slot
	}
	
	
func can_execute() -> bool:
	var player: Player = source if source is Player else source.owner
	var card_data: CreatureCardData = data.card_data
	var slot: BoardSlot = data.slot
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
			reject(validation.reason)
			return false
	
	return true


func to_action():
	var summon_action_data = SummonActionData.new(data.card_data)
	return SummonAction.new(summon_action_data, source, data.slot)
	
