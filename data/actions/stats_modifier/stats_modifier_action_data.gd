extends ActionData
class_name StatsModifierActionData

@export var attribute: Enums.ATTRIBUTE
@export var modifier_type: Enums.MODIFIER_TYPE
@export var value: int

func to_action(config: Dictionary[String, Variant]) -> Action:
	assert(config.has('target'), "Parâmetro 'target' não encontrado")
	return StatsModifierAction.new(self, config.target)
