extends Action
class_name SummonAction

var card: Card
var slot: BoardSlot

func _init(_card: Card, _slot: BoardSlot) -> void:
	card = _card
	slot = _slot
	
func execute():
	GameContext.zone_system.move_card(card, GameContext.state.board, slot)
	var event = SummonEvent.new(card, slot)
	GameContext.event_system.add_to_queue(event)
