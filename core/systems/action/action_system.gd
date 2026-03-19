extends Resource
class_name ActionSystem

var queue: Array[ActiveAction] = []


func add_actions_to_queue(actions: Array[ActiveAction]):
	for action in actions:
		add_to_queue(action)
		

func add_to_queue(action: ActiveAction):
	queue.append(action)
	
	
func get_next() -> ActiveAction:
	return queue.pop_front()


func has_actions() -> bool:
	return queue.size() > 0


func process():
	while has_actions():
		var action = get_next()
		action.execute()
		
