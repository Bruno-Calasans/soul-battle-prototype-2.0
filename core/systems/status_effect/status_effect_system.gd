extends Resource
class_name StatusEffectSystem

var status_effects: Array[StatusEffect] = []


func apply(effect_data: StatusEffectData, source: Card, target: Card):
	var status_effect = StatusEffect.new(effect_data, source, target)
	status_effects.append(status_effect)
	
	
func remove(status_effect: StatusEffect):
	status_effects.erase(status_effect)


func update_duration():
	for status_effect in status_effects:
		status_effect.decrease_duration()
		if status_effect.is_expired(): remove(status_effect)


func handle_event(status_effect: StatusEffect, event: GameEvent):
	var event_modifiers = status_effect.data.event_modifiers
	
	for event_modifier in event_modifiers:
		var event_field = event_modifier.event_field
		var value = event_modifier.value
		
		match status_effect.event_field:
			Enums.EVENT_FIELD.TARGET:
				if not event.get("target"): return
				
			Enums.EVENT_FIELD.SOURCE:
				if not event.get("source"): return
				
			Enums.EVENT_FIELD.VALUE:
				if event.get("data") and not event.data.get("value"): return
		
		match status_effect.operation:
			Enums.OPERATION.SET:
				if event_field == Enums.EVENT_FIELD.TARGET:
					event.target = value
					
				if event_field == Enums.EVENT_FIELD.SOURCE:
					event.source = value
			
				if event_field == Enums.EVENT_FIELD.VALUE:
						event.data.value = value


func can_trigger(trigger: StatusEffectTriggerData, event: GameEvent):
	if not trigger.event == event.type:
		return false
		
	if not FilterResolver.match_filters(event, trigger.filters):
		return false
		
	return true


func handle_triggers(status_effect: StatusEffect, event: GameEvent):
	var triggers: Array[StatusEffectTriggerData] = status_effect.data.triggers
	
	for trigger in triggers:
		if not can_trigger(trigger, event): return
		if trigger.actions.is_empty(): continue
		
		for action_data in trigger.actions:
			var action = action_data.to_action(event.target, event.target)
			GameContext.action_system.add_to_queue(action)
		

func process(event: GameEvent):
	
	for status_effect in status_effects:
		
		# event modifiers
		if status_effect.has_event_modifiers():
			handle_event(status_effect, event)
		
		# triggers
		if status_effect.has_triggers():
			handle_triggers(status_effect, event)
			
