extends ActionData
class_name DamageActionData

@export var type: Enums.DMG_TYPE
@export var value: int

func to_action(dmg_source: GameEntity, dmg_target: GameEntity = null) -> Action:
	var dmg_action = DamageAction.new(self, dmg_source, dmg_target)
	return dmg_action
