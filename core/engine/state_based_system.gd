extends Resource
class_name StateBasedSystem


func check_cards():
	pass
	
	
func check_players():
	pass


func check():
	var cards = GameContext.state.get_all_cards()
	
	for card in cards:
		
		# check creatures states
		if card is CreatureCard:
			
			if card.status.current_health < 0:
				DestroyEvent.new(card).emit()
				
	
