extends Resource
class_name GameController


func execute(command: GameCommand):
	# verifica se o comando é valido
	if not GameContext.rule_engine.validade_command(command): return
	var action = command.to_action()
	GameContext.action_system.add_to_queue(action)
