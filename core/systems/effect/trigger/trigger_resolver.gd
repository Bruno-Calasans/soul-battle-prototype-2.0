extends Node
class_name TriggerResolver

# determina se o efeito pode ativar
# a partir de um determinado evento

static func get_effects(event: GameEvent):
	# verifica efeitos das cartas no campo
	var cards: Array[Card] = GameContext.state.get_all_board_cards()
	var active_effects: Array[Effect] = []
	
	for card in cards:
		Utils.log_effect("Verificando se card '%s' tem efeito para ativar" % card.data.id)
		# verifica se tem efeito para ativar
		if not card.has_effect():
			continue
	
		for effect_data in card.data.effects:
			var effect = Effect.new(effect_data, card, event.target)
			if not TriggerResolver.can_trigger(effect, event): continue
			
			# transforma effect_data em effect
			active_effects.append(effect)
			
	return active_effects

static func can_trigger(effect: Effect, event: GameEvent):
	var effect_trigger = effect.data.trigger
	
	if effect_trigger.event != event.type:
		return false
		
	if not FilterResolver.match_team(effect.source, event.target, effect_trigger.side):
		return false
		
	if not FilterResolver.match_filters(event.source, effect_trigger.filters):
		return false
		
	return true
