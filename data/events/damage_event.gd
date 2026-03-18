extends GameEvent
class_name DamageEvent

func _init(_source: Card, _target: Card) -> void:
	super(Enums.GAME_EVENT_TYPE.DAMAGE)
	source = _source
	target = _target
