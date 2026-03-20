extends Resource
class_name GameCommand

var is_invalid: bool = false
var reason: String = ""


# validação simples
# valida os dados necessários para executar o comando
func can_execute() -> bool:
	return true


func to_action() -> Action:
	return null
	
	
func reject(_reason: String = ""):
	is_invalid = true
	reason = _reason
	RejectGameCommand.new(self, reason).emit()
