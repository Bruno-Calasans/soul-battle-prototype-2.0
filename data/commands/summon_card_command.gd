extends GameCommand
class_name SummonCardCommand

var card: Card
var slot: BoardSlot

func _init(_card: Card, _slot: BoardSlot) -> void:
	card = _card
	slot = _slot
	
	
func to_action():
	return SummonAction.new(card, slot)
	
	
func validade(context: GameContext):
	var current_player = context.state.turn_player
	
	var has_soul = current_player.souls >= card.cost
	if not has_soul: return false
	
	var is_slot_empty = slot.card == null
	if not is_slot_empty: return false
	
	return true
