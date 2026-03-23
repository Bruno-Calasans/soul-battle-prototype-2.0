extends Zone
class_name Board

var slots: Array[BoardSlot] = []

func _init(_owner: Player, slot_num: int = 3) -> void:
	owner = _owner
	for i in range(slot_num):
		slots.append(BoardSlot.new(_owner))
		
	
func summon_card(card: Card, _slot: BoardSlot):
	for slot in slots:
		if  slot == _slot:
			slot.card = card
			card.slot = slot
	
	
func has_empty_slot():
	return get_empty_slots().size() > 0
	
		
func get_empty_slots() -> Array[BoardSlot]:
	var empty_slots: Array[BoardSlot] = []
	
	for slot in slots:
		if slot.card == null: empty_slots.append(slot)
		
	return empty_slots


func get_slot(slot_position: Enums.SLOT_POSITION) -> BoardSlot:
	var index =  slots.find_custom(func(slot: BoardSlot): slot.position == slot_position)
	return slots.get(index)
