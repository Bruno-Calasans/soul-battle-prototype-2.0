extends Node2D
class_name Test

var engine: GameEngine

func _ready() -> void:
	engine = GameEngine.new()
	var player = Player.new()
	
	var warrior_data: CreatureCardData = load("res://data/cards/creatures/warrior/warrior.tres")
	var warrior = warrior_data.create({
		"owner": player,
		"zone": player.hand
	})
	
	var king_data: CreatureCardData = load("res://data/cards/creatures/king/king.tres")
	var king = king_data.create({
		"owner": player,
		"zone": player.hand
	})
	
	var summon_cmd_warrior = SummonCardCommand.new(player, warrior)
	var summon_cmd_king = SummonCardCommand.new(player, king)
	
	GameContext.command_system.add_to_queue(summon_cmd_warrior)
	GameContext.command_system.add_to_queue(summon_cmd_king)
	
	GameContext.command_system.process()
	GameContext.action_system.process()
	GameContext.event_system.process()
