extends Resource
class_name StateBasedSystem

const DESTROY_CAUSE = DestroyCauseEnum.DESTROY_CAUSE 


func check_cards():
	Utils.log_warn("Verificando cards")
	var cards := GameContext.state.get_all_board_cards()
	
	for card in cards:
		if card is CreatureCard:
			if card.is_destroyed or card.current_health > 0: continue
			var destroy_action := DestroyAction.new(card)
			GameContext.action_system.add_to_queue(destroy_action)
			
		# if card is StructureCard
			
	
	
func check_players():
	pass


func check():
	check_cards()
	check_players()
