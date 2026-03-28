extends Zone
class_name Board

var slots: Array[BoardSlot] = []

func _init(_owner: Player, slot_amount: int = 3) -> void:
	owner = _owner
	for i in range(slot_amount):
		slots.append(BoardSlot.new(_owner))
		
	
func summon_card(summoned_card: Card, summoned_slot: BoardSlot):
	for slot in slots:
		if  slot == summoned_slot:
			slot.card = summoned_card
			summoned_card.slot = slot
	
	
func has_empty_slot():
	return get_empty_slots().size() > 0
	
		
func get_empty_slots() -> Array[BoardSlot]:
	var empty_slots: Array[BoardSlot] = []
	
	for slot in slots:
		if slot.card == null: empty_slots.append(slot)
		
	return empty_slots


func get_slot(slot_position: Enums.SLOT_POSITION) -> BoardSlot:
	var found_slot: BoardSlot
	
	for slot in slots:
		if slot.position == slot_position:
			found_slot = slot
			
	return found_slot
