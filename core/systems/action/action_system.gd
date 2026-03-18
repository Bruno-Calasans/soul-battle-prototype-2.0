extends Resource
class_name ActionSystem

var queue: Array[Action] = []

func add_to_queue(action: Action):
	queue.append(action)
	
	
func get_next():
	return queue.pop_front()


func has_actions() -> bool:
	return queue.size() > 0


func process():
	while has_actions():
		var action = get_next()
		action.execute()
		
