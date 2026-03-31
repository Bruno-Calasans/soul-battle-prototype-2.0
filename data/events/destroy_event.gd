extends GameEvent
class_name DestroyEvent


func _init(
	destroyer: Card, 
	destroyed: Card = null, 
	cause: GAME_ENUM.DESTROY_CAUSE = GAME_ENUM.DESTROY_CAUSE.COMBAT
	) -> void:
	type = GAME_ENUM.GAME_EVENT.DESTROY
	source = destroyer
	target = destroyed
	data = {
		"cause": cause
	}

func show_log():
	Utils.log_event("DESTROY EVENT: {0} foi destruído".format([target.data.id]))
