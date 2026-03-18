extends Zone
class_name Board

var slots: Array[BoardSlot] = []

func _init(_owner: Player, slot_num: int = 3) -> void:
	owner = _owner
	for i in range(slot_num):
		slots.append(BoardSlot.new(_owner))
		
		
func get_empty_slots(player: Player):
	var player_slots: Array[BoardSlot] = []
	
	for slot in slots:
		if slot.player == player and slot.card == null:
			player_slots.append(slot)
			
	return player_slots
