extends GameEvent
class_name SummonEvent

var card: Card
var slot: BoardSlot

func _init(_card: Card, _slot: BoardSlot) -> void:
	type = Enums.GAME_EVENT_TYPE.SUMMON
	card = _card
	slot = _slot
	
