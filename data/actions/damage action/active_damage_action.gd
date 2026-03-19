extends ActiveAction
class_name ActiveDamageAction

func _init(_action: DamageAction, _source: Card, _target: Card) -> void:
	action = _action
	source = _source
	target = _target


func execute():
	if action is DamageAction:
		var damage = GameContext.damage_system.calculate_dmg(source, target, action.value, action.dmg_type)
		target.take_damage(damage)
		DamageEvent.new(source, target).emit()
