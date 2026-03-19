extends Resource
class_name GameEvent

var type: Enums.GAME_EVENT_TYPE
var source: Card = null
var target: Card = null

func emit():
	GameContext.event_system.add_to_queue(self)
