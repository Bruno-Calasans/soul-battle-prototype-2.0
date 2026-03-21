extends ActionData
class_name AttributeModifierActionData

@export var attribute: Enums.ATTRIBUTE
@export var modifier_type: Enums.MODIFIER_TYPE
@export var value: int

func _init(_attribute: Enums.ATTRIBUTE, _modifier_type: Enums.MODIFIER_TYPE, _value: int) -> void:
	attribute = _attribute
	modifier_type = _modifier_type
	value = _value
	

func to_action(config: Dictionary[String, Variant]) -> Action:
	assert(config.has('target'), "Parâmetro 'target' não encontrado")
	return AttributeModifierAction.new(self, config.target)
