extends Node
class_name TriggerResolver

# determina se o efeito pode ativar
# a partir de um determinado evento
func can_trigger(effect: Effect, event: GameEvent):
	var effect_trigger = effect.data.trigger
	
	if effect_trigger.event != event.type:
		return false
		
	if not match_source(effect, event):
		return false
		
	if not match_filters(effect, event):
		return false
		
	return true


# verifica sem quem causou o evento é o mesmo definido no trigger
func match_source(effect: Effect, event: GameEvent):
	var source_type = effect.data.trigger.source_type

	match source_type:
		# evento veio do próprio card
		Enums.EFFECT_SOURCE_TYPE.SELF:
			return effect.source == event.source
			
		# evento veio de card aliado
		Enums.EFFECT_SOURCE_TYPE.ALLY:
			return event.source.owner == effect.source.owner
			
		# evento veio de card inimigo
		Enums.EFFECT_SOURCE_TYPE.ENEMY:
			return event.source.owner != effect.source.owner
			
		Enums.EFFECT_SOURCE_TYPE.ANY:
			return true
			
	return false
			
			
# verifica se a entidade se encaixa nos filtros criados
func match_filters(effect: Effect, event: GameEvent):
	var entity = event.source
	var filters = effect.data.trigger.filters
	
	for filter in filters:
		var current_value = get_field_value(entity, filter.field)
		if not evaluate(filter.operation, filter.value, current_value):
			return false
			
	return true
	
	
# pega o valor da propriedade a ser verificada
func get_field_value(entity: Variant, field: Enums.FILTER_FIELD) -> Variant:
	if entity is CreatureCard:
		match field:
			Enums.FILTER_FIELD.ATTACK:
				return entity.current_atk
			
			Enums.FILTER_FIELD.HEALTH:
				return entity.current_health
			
			Enums.FILTER_FIELD.RACE:
				return entity.data.race
			
			Enums.FILTER_FIELD.OWNER:
				return entity.owner
		
	return null
	
	
# compara o valor da entidade com o valor desejado
func evaluate(operation: Enums.FILTER_OPERATION, search_value: Variant, current_value: Variant):
	match operation:
		
		Enums.FILTER_OPERATION.EQUALS_TO: 
			return search_value == current_value
			
		Enums.FILTER_OPERATION.NOT_EQUALS_TO: 
			return search_value != current_value
		
		Enums.FILTER_OPERATION.ABOVE_TO: 
			return search_value > current_value
			
		Enums.FILTER_OPERATION.BELOW_TO: 
			return search_value < current_value
			
		Enums.FILTER_OPERATION.ABOVE_OR_EQUALS_TO: 
			return search_value >= current_value
			
		Enums.FILTER_OPERATION.BELOW_OR_EQUALS_TO: 
			return search_value <= current_value
		
		Enums.FILTER_OPERATION.CONTAINS:
			return search_value in current_value
		
		Enums.FILTER_OPERATION.NOT_CONTAINS:
			return not (search_value in current_value)
	
	return false
