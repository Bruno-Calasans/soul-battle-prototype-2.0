extends GameEvent
class_name RemoveStatusEffectEvent

func _init(status_effect: StatusEffect, _source: Card, _target: Card):
	type = GAME_ENUM.GAME_EVENT_TYPE.REMOVE_STATUS_EFFECT
	source = _source
	target = _target
	data = {
		"status_effect": status_effect,
	}
