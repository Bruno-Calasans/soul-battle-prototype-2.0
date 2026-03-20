extends Resource
class_name ActionSystem

var queue: Array[Action] = []


func add_actions_to_queue(actions: Array[Action]):
	for action in actions:
		add_to_queue(action)
		

func add_to_queue(action: Action):
	queue.append(action)
	
	
func get_next() -> Action:
	return queue.pop_front()


func has_actions() -> bool:
	return queue.size() > 0


func process():
	while has_actions():
		var action = get_next()
		if action.is_cancelled: return
		if not action.can_execute(): return
		action.execute()
	
