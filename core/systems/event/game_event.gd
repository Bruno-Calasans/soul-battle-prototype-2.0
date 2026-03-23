extends Resource
class_name GameEvent

var type: Enums.GAME_EVENT
var source: Variant # quem iniciou o evento
var target: Variant # quem vai sofreu ação do evento
var data: Dictionary = {}

func emit():
	GameContext.event_system.add_to_queue(self)
