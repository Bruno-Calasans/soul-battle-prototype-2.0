extends GameEvent
class_name DestroyEvent

func _init(destroyer: Card, destroyed: Card) -> void:
	type = Enums.GAME_EVENT.DESTROY
	source = destroyer
	target = destroyed
