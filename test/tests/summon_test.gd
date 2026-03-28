extends Node
class_name SummonTest

static func run():
	# teste player
	var player = Player.new()
	GameContext.state.add_player(player)
	
	# card de teste 1
	var warrior_data: CreatureCardData = preload("res://data/cards/creatures/warrior/warrior.tres")
	var king_data: CreatureCardData = preload("res://data/cards/creatures/king/king.tres")
	
	var warrior = warrior_data.to_card(player, player.hand)
	var king = king_data.to_card(player, player.hand)
	
	var summon_warrior_cmd = SummonCardCommand.new(warrior_data, player)
	var summon_king_cmd = SummonCardCommand.new(king_data, player)
	
	Utils.show_value("warrior ATK before", warrior.current_atk)
	Utils.show_value("king ATK before", king.current_atk)
	
	#teste effect
	GameContext.command_system.add_to_queue(summon_warrior_cmd)
	GameContext.command_system.add_to_queue(summon_king_cmd)
	
	GameContext.command_system.process()
	GameContext.action_system.process()
	GameContext.event_system.process()
	
	GameContext.command_system.process()
	GameContext.action_system.process()
	GameContext.event_system.process()
	
	for card in GameContext.state.get_all_board_cards():
		Utils.show_value("{0} ATK after".format([card.data.id]), card.current_atk)
