extends GameEvent
class_name DestroyEvent

var card: Card

func _init(_source: Card, _target: Card) -> void:
	type = Enums.GAME_EVENT_TYPE.DESTROY
	source = _source
	target = _target
