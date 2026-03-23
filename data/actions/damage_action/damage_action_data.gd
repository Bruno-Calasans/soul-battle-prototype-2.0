extends ActionData
class_name DamageActionData

@export var value: int
@export var type: Enums.DMG_TYPE


func _init(dmg_value: int, dmg_type: Enums.DMG_TYPE)  -> void:
	value = dmg_value
	type = dmg_type


func to_action(source: Variant, target: Variant = null) -> Action:
	var dmg_action = DamageAction.new(self, source, target)
	return dmg_action
