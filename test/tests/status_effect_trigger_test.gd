extends RefCounted
class_name StatusEffectTriggerTest

static func run():
	Utils.log_warn("RODANDO TESTE DE STATUS EFFECT - TRIGGER TEST")
	var player = Player.new()
	
	var warrior_data: CreatureCardData = preload("res://data/cards/creatures/warrior/warrior.tres")
	var king_data: CreatureCardData = preload("res://data/cards/creatures/king/king.tres")
	var warrior = warrior_data.to_card(player, player.hand)
	var king = king_data.to_card(player, player.hand)
	
	var bleed_1: StatusEffectData = load("res://data/status_effects/debuffs/bleed/bleed_1.tres")

	GameContext.status_effect_system.apply(bleed_1, warrior, king)
	
	Utils.show_value("King HEALTH before BLEED", king.current_health)
	
	# trocando turno
	GameContext.turn_system.start_turn()
	GameContext.command_system.process()
	GameContext.action_system.process()
	GameContext.event_system.process()
	
	GameContext.command_system.process()
	GameContext.action_system.process()
	GameContext.event_system.process()
	
	Utils.show_value("King HEALTH before BLEED", king.current_health)

	
