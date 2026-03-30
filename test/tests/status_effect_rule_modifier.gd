extends RefCounted
class_name StatusEffectRuleModifierTest

static func run():
	Utils.log_warn("RODANDO TESTE DE STATUS EFFECT - RULE MODIFIER")
	
	var player = Player.new()
	var warrior_data: CreatureCardData = preload("res://data/cards/creatures/warrior/warrior.tres")
	var king_data: CreatureCardData = preload("res://data/cards/creatures/king/king.tres")
	
	var warrior := warrior_data.to_card(player, player.hand)
	var king := king_data.to_card(player, player.hand)
	
	# add cards para o campo
	GameContext.state.add_player(player)
	GameContext.zone_system.move_card(warrior, player.board)
	GameContext.zone_system.move_card(king, player.board)
	
	# aplica status effect
	var stun: StatusEffectData = preload("res://data/status_effects/debuffs/stun/stun.tres")
	var apply_stun_action := ApplyStatusEffectAction.new(
		ApplyStatusEffectActionData.new(stun),
		warrior,
		king
	)
	GameContext.action_system.add_to_queue(apply_stun_action)

	# loop 1
	GameContext.command_system.process()
	GameContext.action_system.process()
	GameContext.event_system.process()
	GameContext.state_based_system.check()


	# inicia comando de ataque
	var atk_cmd := AttackCommand.new(warrior, king)
	GameContext.command_system.add_to_queue(atk_cmd)
	
	# before
	Utils.show_value("ATK DO ATACANTE", warrior.current_atk)
	Utils.show_value("VIDA antes", king.current_health)
	Utils.show_value("DEF antes", king.current_def)
	
	# loop 2
	GameContext.command_system.process()
	GameContext.action_system.process()
	GameContext.event_system.process()
	GameContext.state_based_system.check()
	
	# after
	Utils.show_value("VIDA depois", king.current_health)
	Utils.show_value("DEF depois", king.current_def)
	
