extends GameEvent
class_name RejectGameCommand

var command: GameCommand
var reason: String = ""

func _init(_command: GameCommand, _reason: String = "") -> void:
	type = Enums.GAME_EVENT_TYPE.CANCEL_GAME_COMMAND
	command = _command
	reason = _reason
