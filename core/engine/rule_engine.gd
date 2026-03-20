extends Resource
class_name RuleEngine

func validade_command(command: GameCommand):
	if command.player != GameContext.state.turn_player:
		return false
		
	return command.validade()
	

func validate_action(action: Action):
	match action.type:
		Enums.ACTION_TYPE.ATTACK:
			pass
			
	
