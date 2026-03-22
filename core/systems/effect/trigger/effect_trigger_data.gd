# define quando um efeito ativa
# 
extends Resource
class_name EffectTriggerData

@export var side: Enums.SIDE
@export var event: Enums.GAME_EVENT
#@export var timing: Enums.EFFECT_TRIGGER_TIMING
@export var filters: Array[EffectFilter] = []
