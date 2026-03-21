# executa na ordem que foi adicionado
# gerencia todos os comandos
# envia para o game controller
extends Resource
class_name CommandSystem

var queue: Array[GameCommand] = []

func add_to_queue(command: GameCommand):
	queue.append(command)
	
	
func get_next() -> GameCommand:
	return queue.pop_front()


func has_commands() -> bool:
	return queue.size() > 0
	
	
func process():
	while has_commands():
		var command = get_next()
		
		# verifica se comando foi rejeitado
		if command.is_invalid: return
		
		# verifica se comando é válido antes de executar
		if not command.can_execute(): return
			
		# adiciona à fila de ações
		print("Executando comando: " + command.get_script().get_global_name())
		GameContext.action_system.add_to_queue(command.to_action())
