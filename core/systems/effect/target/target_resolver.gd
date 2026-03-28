# encontra os alvos do efeito
extends Resource
class_name TargetResolver

static func get_targets(effect: Effect) -> Array[Card]:
	var found_targets: Array[Card] = []
	var cards: Array[Card] = GameContext.state.get_all_board_cards()
	var effect_target = effect.data.target
	
	for card in cards:
		if not FilterResolver.match_team(card, effect.source, effect_target.side): 
			continue
			
		if not FilterResolver.match_filters(card, effect_target.filters): 
			continue
		
		found_targets.append(card)
		
	# exclui a si mesmo
	if not effect.data.target.include_self:
		found_targets.erase(effect.source)
		
	return found_targets
