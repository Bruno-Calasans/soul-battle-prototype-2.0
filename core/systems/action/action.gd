extends Resource
class_name Action

var type: Enums.ACTION_TYPE
var source: GameEntity # quem fez a ação
var target: GameEntity # quem sofreu a ação
var data: Variant # dados da ação

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
	
