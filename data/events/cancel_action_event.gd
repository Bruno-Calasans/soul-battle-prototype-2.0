extends GameEvent
class_name CancelActionEvent


func _init(action: Action, reason: String) -> void:
	type = Enums.GAME_EVENT_TYPE.CANCEL_ACTION
	data = {
		"action": action,
		"reason": reason
	}
	print("Ação cancelada: " + reason)
