extends ActionData
class_name StatsModifierActionData

@export var attribute: STATUS_EFFECT_ENUM.BUFFABLE_ATRIBUTE
@export var operation: STATUS_EFFECT_ENUM.OPERATION
@export var value: int

	
func to_action(stats_modifier_source: GameEntity, stats_modified_target: GameEntity = null) -> Action:
	return StatsModifierAction.new(stats_modifier_source, stats_modified_target, self)
