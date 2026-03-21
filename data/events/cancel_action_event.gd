extends GameEvent
class_name CancelActionEvent

var action: Action
var reason: String

func _init(_action: Action, _reason: String) -> void:
	type = Enums.GAME_EVENT_TYPE.CANCEL_ACTION
	action = _action
	reason = _reason
	print("Ação cancelada: " + reason)
