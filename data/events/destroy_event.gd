extends GameEvent
class_name DestroyEvent

func _init(_source: Card, _target: Card) -> void:
	type = Enums.GAME_EVENT_TYPE.DESTROY
	source = _source
	target = _target
