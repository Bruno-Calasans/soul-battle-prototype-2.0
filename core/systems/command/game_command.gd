extends Resource
class_name GameCommand

var type: Enums.COMMAND_TYPE
var source: Variant
var data: Dictionary[String, Variant] = {}
var is_rejected: bool = false
var reason: String = ""


# validação simples
# valida os dados necessários para executar o comando
func can_execute() -> bool:
	return true


func to_action() -> Action:
	return null
	
	
func reject(_reason: String = ""):
	is_rejected = true
	reason = _reason
	RejectGameCommandEvent.new(self, reason).emit()
