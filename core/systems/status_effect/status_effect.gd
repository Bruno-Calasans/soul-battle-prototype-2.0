extends Resource
class_name StatusEffect

@export var id: String
@export var duration: int
@export var triggers: Array[StatusEffectTrigger] = []
@export var modifiers: Array[StatusEffectModifier] = []
@export var tags: Array[Enums.STATUS_EFFECT_TAG] = []
