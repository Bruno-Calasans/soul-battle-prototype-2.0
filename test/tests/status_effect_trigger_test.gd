extends RefCounted
class_name StatusEffectTriggerTest

static func run():
	Utils.log_warn("RODANDO TESTE DE STATUS EFFECT - TRIGGER TEST")
	var player = Player.new()
	
	var warrior_data: CreatureCardData = preload("res://data/cards/creatures/warrior/warrior.tres")
	var king_data: CreatureCardData = preload("res://data/cards/creatures/king/king.tres")
	var warrior: CreatureCard = warrior_data.to_card(player, player.hand)
	var king: CreatureCard  = king_data.to_card(player, player.hand)
	
	GameContext.state.add_player(player)
	GameContext.zone_system.move_card(king, player.board)
	GameContext.zone_system.move_card(warrior, player.board)
	
	var bleed_1: StatusEffectData = load("res://data/status_effects/debuffs/bleed/bleed_1.tres")
	var action = ApplyStatusEffectAction.new(ApplyStatusEffectActionData.new(bleed_1), warrior, king)
	GameContext.action_system.add_to_queue(action)
	
	Utils.show_value("Warrior HEALTH before BLEED", warrior.current_health)
	
	# trocando turno
	GameContext.turn_system.start_turn()
	
	# loop
	GameContext.command_system.process()
	GameContext.action_system.process()
	GameContext.event_system.process()
	
	GameContext.command_system.process()
	GameContext.action_system.process()
	GameContext.event_system.process()
	
	Utils.show_value("Warrior HEALTH after BLEED", warrior.current_health)

	
