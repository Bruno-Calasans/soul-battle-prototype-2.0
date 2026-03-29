extends GameEvent
class_name DestroyEvent


func _init(
	destroyer: Card, 
	destroyed: Card = null, 
	cause: DestroyCauseEnum.DESTROY_CAUSE = DestroyCauseEnum.DESTROY_CAUSE.COMBAT
	) -> void:
	type = Enums.GAME_EVENT.DESTROY
	source = destroyer
	target = destroyed
	data = {
		"cause": cause
	}

func show_log():
	Utils.log_event("DESTROY EVENT: {0} foi destruído".format([target.data.id]))
