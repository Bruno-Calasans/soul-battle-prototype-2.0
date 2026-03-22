# encontra os alvos do efeito
extends Resource
class_name TargetResolver

static func get_targets(effect: Effect) -> Array[Card]:
	var targets: Array[Card] = GameContext.state.get_all_cards()
	var effect_target = effect.data.target

	for target in targets:
		
		if not FilterResolver.match_team(target, effect.source, effect_target.side): 
			print("Team match finalizado")
			continue
			
		if not FilterResolver.match_filters(target, effect_target.filters): 
			print("filter match finalizado")
			continue
		
		targets.append(target)
		
	# exclui a si mesmo
	if not effect.data.target.include_self:
		targets.erase(effect.source)
		
	
	return targets
