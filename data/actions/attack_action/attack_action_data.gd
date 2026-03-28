extends ActionData
class_name AttackActionData

var attacker: Card
var attacked:  Card

func _init(attacker_card: Card, attacked_card: Card) -> void:
	attacker = attacker_card
	attacked = attacked_card
	

func to_action(source: Variant, target: Variant) -> Action:
	var dmg_data: DamageActionData = DamageActionData.new()
	dmg_data.value = source.get_current_atk()
	dmg_data.type = attacker.data.dmg_type
	return dmg_data.to_action(source, target)
