extends GameEvent
class_name RejectGameCommandEvent

func _init(command: GameCommand, reason: String = "") -> void:
	type = Enums.GAME_EVENT.CANCEL_GAME_COMMAND
	data = {
		"command": command,
		"reason": reason
	}
	print("Comando rejeitado: " + reason)
