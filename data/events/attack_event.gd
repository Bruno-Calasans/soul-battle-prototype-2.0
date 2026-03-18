extends GameEvent
class_name AttackEvent

func _init(_source: Card, _target: Card) -> void:
	super(Enums.GAME_EVENT_TYPE.ATTACK)
	source = _source
	target = _target
