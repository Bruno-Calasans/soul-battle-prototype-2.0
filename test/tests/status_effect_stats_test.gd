extends RefCounted
class_name StatusEffectStatsTest

static func run():
	Utils.log_warn("RODANDO TESTE DE STATUS EFFECT - STATS")
	var player = Player.new()
	var fury_1: StatusEffectData = load("res://data/status_effects/buffs/fury/fury_1.tres")
	var fury_2: StatusEffectData = load("res://data/status_effects/buffs/fury/fury_2.tres")
	
	# criaturas
	var warrior_data: CreatureCardData = preload("res://data/cards/creatures/warrior/warrior.tres")
	var king_data: CreatureCardData = preload("res://data/cards/creatures/king/king.tres")
	var warrior = warrior_data.to_card(player, player.hand)
	var king = king_data.to_card(player, player.hand)
	
	# aplciando status effects
	var applyAction1 = ApplyStatusEffectAction.new(ApplyStatusEffectActionData.new(fury_1), warrior, king)
	var applyAction2 =  ApplyStatusEffectAction.new(ApplyStatusEffectActionData.new(fury_2), warrior, king)
	GameContext.action_system.add_actions_to_queue([applyAction1, applyAction2])
	
	# verificando status effects que afetam stats
	Utils.show_value("King ATK before buff", warrior.get_current_atk())
	
	# rodando loop
	GameContext.command_system.process()
	GameContext.action_system.process()
	GameContext.event_system.process()
	
	var stats_modifiers := warrior.get_stats_modifiers(
		STATUS_EFFECT_ENUM.BUFFABLE_ATRIBUTE.ATTACK
		).map(func(stats): return stats.value)
	Utils.log_info(stats_modifiers)
	
		# verificando status effects depois de afetarem stats
	Utils.show_value("King ATK after buff", warrior.get_current_atk())
	
