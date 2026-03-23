extends Resource
class_name Action

var type: Enums.ACTION_TYPE
var source: Variant # quem fez a ação
var target: Variant # quem sofreu a ação
var data: ActionData # dados da ação

var is_cancelled : bool = false
var reason: String = ""

# verifica regras do jogo
func can_execute() -> bool:
	return true


func execute():
	pass
	
	
func cancel(_reason: String = ""):
	is_cancelled = true
	reason = reason
	CancelActionEvent.new(self, reason).emit()
	
