extends GameEvent
class_name ApplyStatusEffectEvent


func _init(effect: StatusEffect, effect_source: Card, effect_target: CreatureCard):
	type = Enums.GAME_EVENT_TYPE.APPLY_STATUS_EFFECT
	source = effect_source
	target = effect_target
	data = {
		"effect_status": effect
	}
