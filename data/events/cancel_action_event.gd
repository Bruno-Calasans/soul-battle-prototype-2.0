extends GameEvent
class_name CancelActionEvent


func _init(action: Action, reason: String) -> void:
	type = Enums.GAME_EVENT.CANCEL_ACTION
	data = {
		"action": action,
		"reason": reason
	}

func show_log():
	Utils.log_action("Ação cancelada: " + data.reason)
	
