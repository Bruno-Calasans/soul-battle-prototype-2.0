extends Resource
class_name StatusEffectData

@export var id: String
@export var type: STATUS_EFFECT_ENUM.STATUS_EFFECT_TYPE
@export var duration: int # -1 é infinita
@export var max_stacks: int
@export var triggers: Array[StatusEffectTriggerData] = []
@export var stats_modifiers: Array[StatusEffectModifierData] = []
@export var event_modifiers: Array[StatusEffectEventModifierData] = []
@export var rule_modifiers: Array[RuleModifier] = []
