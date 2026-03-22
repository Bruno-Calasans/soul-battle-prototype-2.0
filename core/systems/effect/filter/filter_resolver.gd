extends Resource
class_name FilterResolver


# verifica se a entidade se encaixa nos filtros criados
static func match_filters(subject: Variant, filters: Array[EffectFilter]):
	
	if filters == null or filters.is_empty():
		return true
	
	for filter in filters:
		var current_value = get_field_value(subject, filter.field)
		if not check_value(filter.operation, filter.value, current_value):
			return false
			
	return true
	
	
# pega o valor da propriedade a ser verificada
static func get_field_value(subject: Variant, field: Enums.FILTER_FIELD) -> Variant:
	if subject is CreatureCard:
		match field:
			Enums.FILTER_FIELD.ATTACK:
				return subject.current_atk
			
			Enums.FILTER_FIELD.HEALTH:
				return subject.current_health
			
			Enums.FILTER_FIELD.RACE:
				return subject.data.race
			
			Enums.FILTER_FIELD.OWNER:
				return subject.owner
				
	if subject is GameEvent:
		match field:
			Enums.FILTER_FIELD.SOURCE:
				return subject.source
		
		
	return null
	
	
# compara o valor da entidade com o valor desejado
static func check_value(operation: Enums.OPERATION, search_value: Variant, current_value: Variant):
	match operation:
		
		Enums.OPERATION.EQUALS_TO: 
			return search_value == current_value
			
		Enums.OPERATION.NOT_EQUALS_TO: 
			return search_value != current_value
		
		Enums.OPERATION.ABOVE_TO: 
			return search_value > current_value
			
		Enums.OPERATION.BELOW_TO: 
			return search_value < current_value
			
		Enums.OPERATION.ABOVE_OR_EQUALS_TO: 
			return search_value >= current_value
			
		Enums.OPERATION.BELOW_OR_EQUALS_TO: 
			return search_value <= current_value
		
		Enums.OPERATION.CONTAINS:
			return search_value in current_value
		
		Enums.OPERATION.NOT_CONTAINS:
			return not (search_value in current_value)
	
	return false


static func match_team(subject: Variant, source: Variant, side: Enums.SIDE):
	if source == null or subject == null:
		return false
	
	if subject is Card and source is Player:
		match side:
			Enums.SIDE.SELF:
				return subject.owner == source
			
			Enums.SIDE.ALLY:
				return subject.owner == source
				
			Enums.SIDE.ENEMY:
				return subject.owner != source
				
			Enums.SIDE.ANY:
				return true
				
		return false
				
	if subject is Card and source is Card:
		match side:
			Enums.SIDE.SELF:
				return subject == source
			
			Enums.SIDE.ALLY:
				return subject.owner == source.owner
				
			Enums.SIDE.ENEMY:
				return subject.owner != source.owner
				
			Enums.SIDE.ANY:
				return true
				
		return false
