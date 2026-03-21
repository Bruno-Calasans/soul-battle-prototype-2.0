extends Node2D
class_name Test

var engine: GameEngine

func _ready() -> void:
	engine = GameEngine.new()
	
	var warrior_data = load("res://data/cards/creatures/warrior/warrior.tres")
	var player = Player.new()
	var warrior = CreatureCard.new(warrior_data, player, player.hand)
	
	print(player)
	
	var summon_cmd = SummonCardCommand.new(player, warrior_data)
	
	GameContext.command_system.add_to_queue(summon_cmd)
	GameContext.command_system.process()
