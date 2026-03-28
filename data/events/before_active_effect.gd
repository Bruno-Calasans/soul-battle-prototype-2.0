extends GameEvent
class_name BeforeActiveEffectEvent

func _init(effect: Effect) -> void:
	type = Enums.GAME_EVENT.BEFORE_ACTIVE_EFFECT
	target = effect.target
	source = effect.source
	data = effect
	
func show_log():
	Utils.log_event("ANTES do EFEITO")
