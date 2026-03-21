extends Resource
class_name EventSystem

var queue: Array[GameEvent] = []

func add_to_queue(event: GameEvent):
	queue.append(event)


func get_next() -> GameEvent:
	if queue.is_empty():
		return null
	return queue.pop_front()


func has_events() -> bool:
	return queue.size() > 0
	
	
func process():
	print("Processando eventos...")
	while has_events():
		var event = get_next()
		GameContext.effect_system.process(event)
