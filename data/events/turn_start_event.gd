extends GameEvent
class_name TurnStartEvent

func _init(current_player: Player):
	type = GAME_ENUM.GAME_EVENT.TURN_START
	data = {
		"current_player": current_player
	}
	
func show_log():
	Utils.log_event("START TURN EVENT")
