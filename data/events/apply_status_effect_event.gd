extends GameEvent
class_name ApplyStatusEffectEvent


func _init(status_effect: StatusEffect):
	type = Enums.GAME_EVENT.APPLY_STATUS_EFFECT
	source = status_effect.source
	target = status_effect.target
	data = {
		"status_effect": status_effect
	}

func show_log():
	Utils.log_event("STATUS EFFECT APPLIED: {0}".format([data.status_effect.data.id]))
