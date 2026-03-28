extends Node
class_name Test2

static func run():
	print("RODANDO TESTE 2")
	var fury_1: StatusEffectData = load("res://data/status_effects/buffs/fury/fury_1.tres")
	var fury_2: StatusEffectData = load("res://data/status_effects/buffs/fury/fury_2.tres")
	var bleed_1: StatusEffectData = load("res://data/status_effects/debuffs/bleed/bleed_1.tres")
	
	var cards := GameContext.state.get_all_cards()
	var warrior: CreatureCard = cards[0]
	var king: CreatureCard = cards[1]
	
	# aplicando efeito
	GameContext.status_effect_system.apply(fury_1, warrior, king)
	GameContext.status_effect_system.apply(fury_2, warrior, king)
	GameContext.status_effect_system.apply(bleed_1, warrior, king)
	
	
	# verificando status effects que afetam stats
	print(king.get_stats_modifiers(Enums.ATTRIBUTE.ATTACK).map(
		func(modifier: StatusEffectModifierData): return modifier.value))
	print("king current atk = ", king.get_current_atk())
	
	# trocando de turno
	print("King current healtha BEFORE bleed = ", king.current_health)
	
	GameContext.turn_system.start_turn()
	
	GameContext.command_system.process()
	GameContext.action_system.process()
	GameContext.event_system.process()
	
	GameContext.command_system.process()
	GameContext.action_system.process()
	GameContext.event_system.process()
	
	print("King current healtha AFTTER bleed = ", king.current_health)
	
	var atk_data = AttackActionData.new(king, warrior)
	var atk_action = AttackAction.new(atk_data)
	GameContext.action_system.add_to_queue(atk_action)
	
	GameContext.action_system.process()
	GameContext.event_system.process()
	
	
	
	
	
	
