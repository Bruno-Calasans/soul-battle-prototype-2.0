extends Resource
class_name EffectSystem

var queue: Array[Effect] = []


func add_to_queue(effect: Effect):
	queue.append(effect)
	
	
func get_next() -> Effect:
	return queue.pop_front()


func has_effects() -> bool:
	return queue.size() > 0


func handle_card_effects(event: GameEvent):
	# verifica efeitos das cartas no campo
	var cards: Array[Card] = GameContext.state.get_all_cards()
	
	for card in cards:
		# verifica se tem efeito para ativar
		if not card.has_effect(): continue
	
		for effect_data in card.data.effects:
			var effect = Effect.new(effect_data, event.source, event.target)
			if not TriggerResolver.can_trigger(effect, event): continue 
			# transforma effect_data em effect
			add_to_queue(effect)


func handle_status_effects(event: GameEvent):
	var status_effects = GameContext.status_effect_system.status_effects
	
	for status_effect in status_effects:
		if not status_effect.has_triggers(): continue
		
		var triggers = status_effect.effect.triggers 
		
		for trigger in triggers:
			if not trigger.event == event.type: continue
			
			for action in trigger.actions:
				var active_action = action.create()
				GameContext.action_system.add_to_queue(active_action)
		

func handle_event(event: GameEvent):
	var effects = TriggerResolver.get_effects(event)
	queue.append_array(effects)
	#handle_status_effects(event)


func resolve(effect: Effect):
	# pega os alvos do efeito
	var targets = TargetResolver.get_targets(effect)
	
	# verifica se pode ativar efeito
	for target in targets:
		# adiciona à fila de ações
		for action_data in effect.data.actions:
			var action = action_data.to_action(effect.source, target)
			GameContext.action_system.add_to_queue(action)


func process(event: GameEvent):
	print("Verificando efeitos...")
	handle_event(event)
	
	while has_effects():
			print("Resolvendo efeito...")
			var effect = get_next()
			resolve(effect)
		
