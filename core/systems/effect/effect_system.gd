extends Node
class_name EffectSystem


func handle_event(event: GameEvent) -> Array[TriggeredEffect]:
	var results: Array[TriggeredEffect] = []
	
	var cards = GameContext.state.cards
	for card in cards:
		if len(card.effects) > 0:
			for effect in card.effects:
				if effect.type == event.type: 
					results.append(TriggeredEffect.new(effect, card))
	return results


func get_targets(target_type: Enums.TARGET_TYPE, source: Card, event: GameEvent) -> Array[Card]:
	
	match target_type:
		
		Enums.TARGET_TYPE.SELF:
			return [source]
			
		Enums.TARGET_TYPE.ENEMY:
			return [event.target]
			
		Enums.TARGET_TYPE.ALLY:
			return [event.target]
			
		Enums.TARGET_TYPE.ALL_ALLIES:
			return GameContext.state.get_all_allies(source.player)
			
		Enums.TARGET_TYPE.ALL_ENEMIES:
			return GameContext.state.get_all_enemies(source.player)

	return []	


func check_conditions(conditions: Array[EffectCondition], target: Card) -> bool:
	if conditions.is_empty(): return true
	
	for condition in conditions:
		
		# criatura
		if target is CreatureCard:
			
			match condition.property:
				# health below value
				Enums.EFFECT_CONDITION_PROPERTY.HP:
					
					if Enums.EFFECT_CONDITION_COMPARATOR.BELOW_TO:
						return target.current_health < condition.value
						
					if Enums.EFFECT_CONDITION_COMPARATOR.ABOVE_TO:
						return target.current_health < condition.value
				
				# health above value
				Enums.EFFECT_CONDITION_TYPE.HP_ABOVE_TO:
					return target.status.current_health > condition.value
						
				Enums.EFFECT_CONDITION_TYPE.HP_EQUALS_TO:
					return target.status.current_health == condition.value
		
	return false


func resolve(effect: Effect, source: Card, event: GameEvent):
	# pega os alvos do efeito
	var targets = get_targets(effect.target_type, source, event)
	
	# verifica se pode ativar efeito
	for target in targets:
		if not check_conditions(effect.conditions, target): continue
		
		# executa ações
		for action in effect.actions:
			action.source = source
			action.target = target
			action.execute()


func process(event: GameEvent):
	var effects = handle_event(event)
	for effect in effects:
		resolve(effect, event.source, event)
