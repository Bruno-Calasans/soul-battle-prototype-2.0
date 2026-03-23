extends Resource
class_name StatusEffectData

@export var id: String
@export var duration: int # -1 é infinita
@export var triggers: Array[StatusEffectTriggerData] = []
@export var stats_modifiers: Array[StatusEffectModifierData] = []
@export var event_modifiers: Array[StatusEffectEventModifierData] = []
@export var rules_modifier: Array[Enums.RULE_MODIFIERS] = []
