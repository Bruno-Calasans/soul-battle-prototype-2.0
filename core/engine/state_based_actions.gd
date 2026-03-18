extends Resource
class_name StateBasedActions


func check():
	var cards = GameContext.state.get_all_cards()
	
	for card in cards:
		
		# check creatures states
		if card is CreatureCard:
			
			if card.status.current_health < 0:
				GameContext.event_system.add_to_queue(DestroyEvent.new(card))
				
	
