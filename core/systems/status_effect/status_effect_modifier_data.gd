extends Resource
class_name StatusEffectModifierData

@export var operation: STATUS_EFFECT_ENUM.OPERATION
@export var attribute: STATUS_EFFECT_ENUM.BUFFABLE_ATRIBUTE
@export var value: int

#func _init(_operation: Enums.OPERATION, _attribute: Enums.ATTRIBUTE, _value: int) -> void:
#	operation = _operation
#	attribute = _attribute
#	value = _value
