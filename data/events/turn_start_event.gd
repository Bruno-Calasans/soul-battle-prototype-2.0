extends GameEvent
class_name TurnStartEvent

func _init(current_player: Player):
	type = Enums.GAME_EVENT.TURN_START
	data = {
		"current_player": current_player
	}
