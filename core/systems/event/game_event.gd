extends Resource
class_name GameEvent

var type: Enums.GAME_EVENT
var source: GameEntity # quem iniciou o evento
var target: GameEntity # quem vai sofreu ação do evento
var data: Variant

func emit():
	GameContext.event_system.add_to_queue(self)


func show_log():
	pass
