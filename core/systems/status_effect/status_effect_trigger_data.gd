extends Resource
class_name StatusEffectTriggerData

@export var event: Enums.GAME_EVENT
@export var actions: Array[ActionData] = []
@export var filters: Array[EffectFilter] = []
