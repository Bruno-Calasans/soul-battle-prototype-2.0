extends ActionData
class_name DamageActionData

@export var type: CARD_ENUM.DMG_TYPE
@export var value: int

func to_action(dmg_source: GameEntity, dmg_target: GameEntity = null) -> Action:
	var dmg_action = DamageAction.new(dmg_source, dmg_target, self)
	return dmg_action
