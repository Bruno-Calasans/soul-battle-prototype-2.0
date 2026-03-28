extends ActionData
class_name SummonActionData

@export var card_data: CreatureCardData

func _init(summoned_card_data: CreatureCardData) -> void:
	card_data = summoned_card_data
	
		
func to_action(summoner: Variant, summoned_card: Variant = null) -> Action:
	return SummonAction.new(self, summoner, summoned_card)
