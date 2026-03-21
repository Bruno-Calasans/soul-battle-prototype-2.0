extends Resource
class_name Action

var is_cancelled : bool
var reason: String

# verifica regras do jogo
func can_execute() -> bool:
	return true


func execute():
	pass
	
	
func cancel(_reason: String = ""):
	is_cancelled = true
	reason = reason
	CancelActionEvent.new(self, reason).emit()
	
