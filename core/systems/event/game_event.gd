extends Resource
class_name GameEvent

signal event(event: GameEvent)

var type: Enums.GAME_EVENT_TYPE
var source: Card = null
var target: Card = null


func _init(_type: Enums.GAME_EVENT_TYPE):
	type = _type


func emit():
	event.emit(self)
