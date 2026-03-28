extends Resource
class_name StatusEffectModifierData

@export var operation: Enums.OPERATION
@export var attribute: Enums.ATTRIBUTE
@export var value: int

#func _init(_operation: Enums.OPERATION, _attribute: Enums.ATTRIBUTE, _value: int) -> void:
#	operation = _operation
#	attribute = _attribute
#	value = _value
