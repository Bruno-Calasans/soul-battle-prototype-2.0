extends ActionData
class_name DamageActionData

@export var value: int
@export var dmg_type: Enums.DMG_TYPE


func _init(_value: int, _dmg_type: Enums.DMG_TYPE)  -> void:
	type = Enums.ACTION_TYPE.DAMAGE
	value = _value
	dmg_type = _dmg_type


func to_action(config: Dictionary[String, Variant]) -> DamageAction:
	if not config.has('target'): return
	if not config.has('source'): return
	var dmg_action = DamageAction.new(self, config.source, config.target)
	return dmg_action
