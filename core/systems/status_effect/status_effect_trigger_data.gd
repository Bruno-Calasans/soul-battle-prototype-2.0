extends Resource
class_name StatusEffectTriggerData

@export var event: GAME_ENUM.GAME_EVENT
@export var actions: Array[ActionData] = []
@export var filters: Array[EffectFilter] = []
