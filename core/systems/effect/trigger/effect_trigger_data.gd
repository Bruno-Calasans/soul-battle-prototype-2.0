# define quando um efeito ativa
# 
extends Resource
class_name EffectTriggerData

@export var event_type: Enums.GAME_EVENT_TYPE
@export var source_type: Enums.EFFECT_SOURCE_TYPE
@export var timing: Enums.EFFECT_TRIGGER_TIMING
@export var filters: Array[TriggerFilterData] = []
