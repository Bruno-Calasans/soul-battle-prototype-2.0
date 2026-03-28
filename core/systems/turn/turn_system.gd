extends Resource
class_name TurnSystem


func start_turn():
	var current_player = GameContext.state.turn_player
	TurnStartEvent.new(current_player).emit()
	
	
func end_turn():
	var previous_player = GameContext.state.turn_player
	GameContext.state.turn_number += 1
	GameContext.state.turn_player = get_next_player()
	TurnEndEvent.new(previous_player).emit()
	
	
	
# determinar qual o próximo jogador para o próximo turno
func get_next_player():
	var players = GameContext.state.players
	var current_player = GameContext.state.turn_player
	var current_player_index = players.find(current_player)
	var next_index = current_player_index + 1
	var next_player: Player
	
	# pega último player
	if next_index > players.size() - 1:
		next_player = players[0]
	else:
		next_player = players[next_index]
		
	return next_player
