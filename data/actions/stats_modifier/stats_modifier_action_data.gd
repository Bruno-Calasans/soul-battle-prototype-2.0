extends ActionData
class_name StatsModifierActionData

@export var attribute: Enums.ATTRIBUTE
@export var operation: Enums.OPERATION
@export var value: int

	
func to_action(source: Variant, target: Variant = null) -> Action:
	return StatsModifierAction.new(self, source, target)
