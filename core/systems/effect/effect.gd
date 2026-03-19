# define quando algo acontece e o que fazer
# dados do efeito
extends Resource
class_name Effect

var type: Enums.EFFECT_TYPE
var trigger: Enums.TRIGGER_TYPE
var target_type: Enums.TARGET_TYPE
var actions: Array[Action] = []
var conditions: Array[EffectCondition] = []
