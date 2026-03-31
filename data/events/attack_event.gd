extends GameEvent
class_name AttackEvent

func _init(attacker: CreatureCard, attacked: CreatureCard) -> void:
	type = GAME_ENUM.GAME_EVENT.ATTACK
	source = attacker
	target = attacked


func show_log():
	Utils.log_event("ATTACK EVENT: {0} atacou {1}".format([source.data.id, target.data.id]))
	
