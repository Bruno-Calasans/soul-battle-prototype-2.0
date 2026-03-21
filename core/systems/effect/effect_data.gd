# define quando algo acontece e o que fazer
# dados do efeito
extends Resource
class_name EffectData

@export var type: Enums.EFFECT_TYPE
@export var trigger: EffectTriggerData
@export var target: EffectTargetData
@export var actions: Array[ActionData] = []
@export var conditions: Array[EffectCondition] = []
