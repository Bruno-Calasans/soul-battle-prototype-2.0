extends Resource
class_name CommandSystem

var queue: Array[GameCommand] = []

func add_to_queue(command: GameCommand):
	queue.append(command)
	
	
func get_next():
	return queue.pop_front()

func has_commands() -> bool:
	return queue.size() > 0
	
	
func process():
	print("Command system is running")
	while has_commands():
		var command = get_next()
		GameContext.game_controller.execute(command)
		
