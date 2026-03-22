extends Node
class_name Test1

static func run():
	# teste player
	var player = Player.new()
	GameContext.state.add_player(player)
	
	# card de teste 1
	var warrior_data: CreatureCardData = preload("res://data/cards/creatures/warrior/warrior.tres")
	var warrior = warrior_data.create({
		"owner": player,
		"zone": player.hand
	})
	
	var king_data: CreatureCardData = preload("res://data/cards/creatures/king/king.tres")
	var king = king_data.create({
		"owner": player,
		"zone": player.hand
	})
	
	var summon_warrior_cmd = SummonCardCommand.new(player, warrior)
	var summon_king_cmd = SummonCardCommand.new(player, king)
	
	print("warrior atk before = ", warrior.current_atk)
	print("king atk before = ", king.current_atk)
	
	#teste effect
	GameContext.command_system.add_to_queue(summon_warrior_cmd)
	GameContext.command_system.add_to_queue(summon_king_cmd)
	
	GameContext.command_system.process()
	GameContext.action_system.process()
	GameContext.event_system.process()
	
	GameContext.command_system.process()
	GameContext.action_system.process()
	GameContext.event_system.process()
	
	print("king atk after = ", king.current_atk)
	print("warrior atk after = ", warrior.current_atk)
