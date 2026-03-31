extends Resource
class_name FilterResolver


# verifica se a entidade se encaixa nos filtros criados
static func match_filters(subject: Variant, filters: Array[EffectFilter]):
	if filters == null or filters.is_empty():
		return true
	
	for filter in filters:
		var current_value = get_field_value(subject, filter.field)
		if not check_value(filter.comparator, filter.value, current_value):
			return false
			
	return true
	
	
# pega o valor da propriedade a ser verificada
static func get_field_value(subject: Variant, field: EFFECT_ENUM.FILTER_FIELD) -> Variant:
	if subject is CreatureCard:
		match field:
			EFFECT_ENUM.FILTER_FIELD.ATTACK:
				return subject.current_atk
			
			EFFECT_ENUM.FILTER_FIELD.HEALTH:
				return subject.current_health
				
			EFFECT_ENUM.FILTER_FIELD.DEF:
				return subject.current_def
				
			EFFECT_ENUM.FILTER_FIELD.EVADE:
				return subject.current_evade
			
			EFFECT_ENUM.FILTER_FIELD.CLASS:
				return subject.data.class_type
			
			EFFECT_ENUM.FILTER_FIELD.RACE:
				return subject.data.race
			
			EFFECT_ENUM.FILTER_FIELD.OWNER:
				return subject.owner
				
			EFFECT_ENUM.FILTER_FIELD.SOUL:
				return subject.data.soul
				
	if subject is GameEvent:
		match field:
			EFFECT_ENUM.FILTER_FIELD.SOURCE:
				return subject.source
		
		
	return null
	
	
# compara o valor da entidade com o valor desejado
static func check_value(operation: EFFECT_ENUM.COMPARATOR, search_value: Variant, current_value: Variant):
	match operation:
		
		EFFECT_ENUM.COMPARATOR.EQUALS_TO: 
			return current_value == search_value
			
		EFFECT_ENUM.COMPARATOR.NOT_EQUALS_TO: 
			return current_value != search_value
		
		EFFECT_ENUM.COMPARATOR.ABOVE_TO: 
			return current_value > search_value
			
		EFFECT_ENUM.COMPARATOR.BELOW_TO: 
			return current_value < search_value
			
		EFFECT_ENUM.COMPARATOR.ABOVE_OR_EQUALS_TO:
			return current_value >= search_value
			
		EFFECT_ENUM.COMPARATOR.BELOW_OR_EQUALS_TO: 
			return current_value <= search_value
		
		EFFECT_ENUM.COMPARATOR.CONTAINS:
			return search_value in current_value
		
		EFFECT_ENUM.COMPARATOR.NOT_CONTAINS:
			return not (search_value in current_value)
	
	return false


static func match_team(subject: Card, source: Variant, side: EFFECT_ENUM.SIDE):
	if source == null or subject == null:
		return false
		
	var subject_owner = subject.owner
	var source_owner = source if source is Player else source.owner
	
	match side:
		EFFECT_ENUM.SIDE.SELF:
			return subject.get_instance_id() == source.get_instance_id()
		
		EFFECT_ENUM.SIDE.ALLY:
			return subject_owner.get_instance_id() == source_owner.get_instance_id()
			
		EFFECT_ENUM.SIDE.ENEMY:
			return subject_owner != source_owner
			
		EFFECT_ENUM.SIDE.ANY:
			return true
			
	return false
			
