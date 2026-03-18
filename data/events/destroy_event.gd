extends GameEvent
class_name DestroyEvent

var card: Card

func _init(_card: Card) -> void:
	super(Enums.GAME_EVENT_TYPE.DESTROY)
	card = _card
