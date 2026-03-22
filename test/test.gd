extends Node2D
class_name Test

var engine: GameEngine

func _ready() -> void:
	engine = GameEngine.new()
	
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
	#
	#GameContext.command_system.add_to_queue(summon_warrior_cmd)
	GameContext.command_system.add_to_queue(summon_king_cmd)
	
	GameContext.command_system.process()
	GameContext.action_system.process()
	GameContext.event_system.process()
