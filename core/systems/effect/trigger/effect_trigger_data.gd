# define quando um efeito ativa
# 
extends Resource
class_name EffectTriggerData

@export var side: EFFECT_ENUM.SIDE
@export var event: GAME_ENUM.GAME_EVENT
#@export var timing: Enums.EFFECT_TRIGGER_TIMING
@export var filters: Array[EffectFilter] = []
