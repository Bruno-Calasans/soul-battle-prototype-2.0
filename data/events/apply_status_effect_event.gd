extends GameEvent
class_name ApplyStatusEffectEvent

var effect: StatusEffect

func _init(_effect: StatusEffect, _source: Card, _target: Card):
	type = Enums.GAME_EVENT_TYPE.APPLY_STATUS_EFFECT
	effect = _effect
	source = _source
	target = _target
