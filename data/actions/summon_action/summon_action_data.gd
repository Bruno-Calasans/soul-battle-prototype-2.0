extends ActionData
class_name SummonActionData

@export var card: CreatureCardData

func _init(_card: CreatureCardData) -> void:
	type = Enums.ACTION_TYPE.SUMMON
	card = _card
	
		
func create(config: Dictionary[String, Variant]):
	if not config.has('player'): return
	if not config.has('card'): return
	return SummonAction.new(self, config.player, config.card, config.slot)
