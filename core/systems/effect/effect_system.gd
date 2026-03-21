extends Resource
class_name EffectSystem

var queue: Array[Effect] = []


func add_to_queue(action: Action):
	queue.append(action)
	
	
func get_next() -> Effect:
	return queue.pop_front()


func has_actions() -> bool:
	return queue.size() > 0


func handle_card_effects(event: GameEvent):
	# verifica efeitos das cartas no campo
	var cards = GameContext.state.get_all_cards()
	for card in cards:
		if len(card.effects) > 0:
			for effect_data in card.data.effects:
				if effect_data.type == event.type: 
					var effect = Effect.new(effect_data, event.source, event.target)
					add_to_queue(effect)


func handle_status_effects(event: GameEvent):
	var status_effects = GameContext.status_effect_system.active_effects
	
	for active_effect in status_effects:
		if not active_effect.has_triggers(): continue
		
		var triggers = active_effect.effect.triggers 
		
		for trigger in triggers:
			if not trigger.event == event.type: continue
			
			for action in trigger.actions:
				var active_action = action.create()
				GameContext.action_system.add_to_queue(active_action)
		

func handle_event(event: GameEvent):
	handle_card_effects(event)
	handle_status_effects(event)


func get_targets(effect: Effect) -> Array[Card]:
	
	match effect.target_type:
		
		Enums.TARGET_TYPE.SELF:
			return [effect.source]
			
		Enums.TARGET_TYPE.ENEMY:
			return [effect.target]
			
		Enums.TARGET_TYPE.ALLY:
			return [effect.target]
			
		Enums.TARGET_TYPE.ALL_ALLIES:
			return GameContext.state.get_all_allies(effect.source.player)
			
		Enums.TARGET_TYPE.ALL_ENEMIES:
			return GameContext.state.get_all_enemies(effect.source.player)

	return []	


func check_conditions(conditions: Array[EffectCondition], target: Card) -> bool:
	if conditions.is_empty(): return true
	
	for condition in conditions:
		
		# criatura
		if target is CreatureCard:
			
			match condition.attribute:
				# health below value
				Enums.ATTRIBUTE.HP:
					
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


func resolve(active_effect: Effect):
	
	# pega os alvos do efeito
	var targets = get_targets(active_effect)
	
	# verifica se pode ativar efeito
	for target in targets:
		if not check_conditions(active_effect.conditions, target): continue
		
		# adiciona à fila de ações
		for action in active_effect.effect.actions:
			var active_action = action.create(active_effect.source, target)
			GameContext.action_system.add_to_queue(active_action)


func process(event: GameEvent):
	handle_event(event)
	for effect in queue:
		resolve(effect)
		
