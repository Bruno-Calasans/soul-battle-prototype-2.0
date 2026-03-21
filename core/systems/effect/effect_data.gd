# define quando algo acontece e o que fazer
# dados do efeito
extends Resource
class_name EffectData

@export var type: Enums.EFFECT_TYPE
@export var trigger: Enums.TRIGGER_TYPE
@export var target_type: Enums.TARGET_TYPE
@export var actions: Array[ActionData] = []
@export var conditions: Array[EffectCondition] = []
