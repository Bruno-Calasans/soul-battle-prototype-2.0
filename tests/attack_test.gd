extends Node
class_name AttackTest

static func run():
	Utils.log_warn("TESTANDO ATTACK" + " *".repeat(30))
	
	var player = Player.new()
	var warrior_data: CreatureCardData = preload("res://data/cards/creatures/warrior/warrior.tres")
	var king_data: CreatureCardData = preload("res://data/cards/creatures/king/king.tres")
	
	var warrior = warrior_data.to_card(player, player.hand)
	var king = king_data.to_card(player, player.hand)
	
	var atk_cmd := AttackCommand.new(warrior, king)
	GameContext.command_system.add_to_queue(atk_cmd)
	
	
	GameContext.state.add_player(player)
	GameContext.state.players[0].board.add_card(warrior)
	GameContext.state.players[0].board.add_card(king)
	
	
	# before
	Utils.show_value("ATK DO ATACANTE", warrior.current_atk)
	Utils.show_value("VIDA antes", king.current_health)
	Utils.show_value("DEF antes", king.current_def)
	
	GameContext.command_system.process()
	GameContext.action_system.process()
	GameContext.event_system.process()
	GameContext.state_based_system.check()
	
	GameContext.action_system.process()
	GameContext.event_system.process()
	
	# after
	Utils.show_value("VIDA depois", king.current_health)
	Utils.show_value("DEF depois", king.current_def)
	
