extends ActionData
class_name StatsModifierActionData

@export var attribute: Enums.ATTRIBUTE
@export var operation: Enums.OPERATION
@export var value: int

	
func to_action(stats_modifier_source: GameEntity, stats_modified_target: GameEntity = null) -> Action:
	return StatsModifierAction.new(stats_modifier_source, stats_modified_target, self)
