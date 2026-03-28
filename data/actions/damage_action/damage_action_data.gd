extends ActionData
class_name DamageActionData

@export var type: Enums.DMG_TYPE
@export var value: int

func to_action(source: Variant, target: Variant = null) -> Action:
	var dmg_action = DamageAction.new(self, source, target)
	return dmg_action
