extends Action
class_name DamageAction

var dmg_data: DamageActionData
var source: Card
var target: Card

func _init(_dmg_data: DamageActionData, _source: Card, _target: Card) -> void:
	dmg_data = _dmg_data
	source = _source
	target = _target


func can_execute() -> bool:
	if target == null:
		cancel("Target não encontrado")
		return false
		
	if source == null:
		cancel("Source não encontrado")
		
	return true


func execute():
	var damage = GameContext.damage_system.calculate_dmg(
		source, 
		target, 
		dmg_data.value, 
		dmg_data.dmg_type
	)
	target.take_damage(damage)
	DamageEvent.new(source, target).emit()
