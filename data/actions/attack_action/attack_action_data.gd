extends ActionData
class_name AttackActionData

@export var apply_status_effect: StatusEffectData
@export var ignore_def: bool

	
func to_action(source: GameEntity, target: GameEntity) -> Action:
	var dmg_data: DamageActionData = DamageActionData.new()
	dmg_data.value = source.get_current_atk()
	dmg_data.type = attacker.data.dmg_type
	return dmg_data.to_action(source, target)
