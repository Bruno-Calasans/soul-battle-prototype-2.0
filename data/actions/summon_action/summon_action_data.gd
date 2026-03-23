extends ActionData
class_name SummonActionData

@export var card_data: CreatureCardData

func _init(_card_data: CreatureCardData) -> void:
	card_data = _card_data
	
		
func to_action(source: Variant, target: Variant = null) -> Action:
	return SummonAction.new(self, source, target)
