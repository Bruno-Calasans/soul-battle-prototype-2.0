extends Node
class_name Test2

static func run():
	print("RODANDO TESTE 2", "-".repeat(10))
	var fury_1: StatusEffectData = load("res://data/status_effects/buffs/fury/fury_1.tres")
	var fury_2: StatusEffectData = load("res://data/status_effects/buffs/fury/fury_2.tres")
	
	var cards := GameContext.state.get_all_cards()
	var warrior: CreatureCard = cards[0]
	var king: CreatureCard = cards[1]
	
	# 
	GameContext.status_effect_system.apply(fury_1, warrior, king)
	GameContext.status_effect_system.apply(fury_2, warrior, king)
	
	
	# verificando status effects que afetam stats
	print("TESTANDO MODIFICADORES DE STATS", "-".repeat(10))
	print(king.get_stats_modifiers(Enums.ATTRIBUTE.ATTACK).map(
		func(modifier: StatusEffectModifierData): return modifier.value))
	print("king current atk = ", king.get_current_atk())
	
	
	# STATUS EFFECT COM TRIGGERS
	print("TESTANDO STATUS EFFECT COM TRIGGERS", "-".repeat(10))
	
	var bleed_1: StatusEffectData = load("res://data/status_effects/debuffs/bleed/bleed_1.tres")
	GameContext.status_effect_system.apply(bleed_1, warrior, king)
	
	print("King current healtha BEFORE bleed = ", king.current_health)
	
	# trocando turno
	GameContext.turn_system.start_turn()
	GameContext.command_system.process()
	GameContext.action_system.process()
	GameContext.event_system.process()
	
	GameContext.command_system.process()
	GameContext.action_system.process()
	GameContext.event_system.process()
	
	print("King current health AFTER bleed = ", king.current_health)
	
	
	
	
	
	
	
	
	
