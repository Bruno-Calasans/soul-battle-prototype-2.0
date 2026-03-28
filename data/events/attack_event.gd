extends GameEvent
class_name AttackEvent

func _init(attacker: CreatureCard, attacked: CreatureCard) -> void:
	type = Enums.GAME_EVENT.ATTACK
	source = attacker
	target = attacked
	print("{0} atacou {1}".format([attacker.data.id, attacked.data.id]))
