extends Resource
class_name ZoneSystem


func move_card(card: Card, target_zone: Zone, slot: BoardSlot = null):
	var old_zone = card.zone
	if old_zone: old_zone.remove_card(card)
	
	if slot != null:
		slot.card = card
	
	target_zone.add_card(card)
	card.zone = target_zone
