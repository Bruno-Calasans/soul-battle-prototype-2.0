extends Resource
class_name StatusEffectModifier

@export var attribute: Enums.ATTRIBUTE
@export var value: int

func _init(_attribute: Enums.ATTRIBUTE, _value: int) -> void:
	attribute = _attribute
	value = _value
