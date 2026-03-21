extends ActionData
class_name SummonActionData

@export var card_data: CreatureCardData

func _init(_card_data: CreatureCardData) -> void:
	type = Enums.ACTION_TYPE.SUMMON
	card_data = _card_data
	
		
func to_action(config: Dictionary[String, Variant]):
	assert(config.has("owner"), "Parâmentro 'owner' faltando")
	var creature = card_data.create({
		"owner": config.owner,
		"zone": config.zone
	})
	return SummonAction.new(config.player, creature, config.slot)
