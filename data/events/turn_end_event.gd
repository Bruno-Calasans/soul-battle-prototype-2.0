extends GameEvent
class_name TurnEndEvent

func _init(previous_player: Player):
	type = Enums.GAME_EVENT.TURN_END
	data = {
		"previous_player": previous_player
	}
