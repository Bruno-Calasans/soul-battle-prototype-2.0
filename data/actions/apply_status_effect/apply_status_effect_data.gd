extends ActionData
class_name ApplyStatusEffectActionData

@export var status_effect_data: StatusEffectData


func _init(status_effect_data_to_apply: StatusEffectData) -> void:
	status_effect_data = status_effect_data_to_apply


func to_action(source: GameEntity, target: GameEntity) -> Action:
	return ApplyStatusEffectAction.new(self, target, source)
