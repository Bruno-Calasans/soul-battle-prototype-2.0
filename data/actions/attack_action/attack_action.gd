extends Action
class_name AttackAction


func _init(attacker: CreatureCard, attacked: GameEntity) -> void:
	source = attacker
	target = attacked
	
	if attacker is CreatureCard:
		type = GAME_ENUM.ACTION_TYPE.BATTLE_ATTACK
		
	elif attacked is Player:
		type = GAME_ENUM.ACTION_TYPE.DIRECT_ATTACK
		
	else:
		type = GAME_ENUM.ACTION_TYPE.DEMOLITION_ATTACK
	

func can_execute() -> bool:
	var atk_validation: ValidationResult = AttackRule.validate(source, target)
	var rule_ctx: RuleContext = RuleContext.new(source, target, self)
	RuleSystem.apply_rules(GAME_ENUM.RULE_HOOK.BEFORE_ATTACK, rule_ctx)
	
	if not atk_validation.ok:
		cancel(atk_validation.reason)
		return false
		
	if rule_ctx.canceled or not rule_ctx.allowed:
		cancel(rule_ctx.reason)
		return false
	
	return true
	
	
func execute():
	# cria dados do dano
	var attacker: CreatureCard = source
	var dmg_data: DamageActionData = DamageActionData.new()
	dmg_data.value = attacker.get_current_atk()
	dmg_data.type = attacker.data.dmg_type
	
	# adiciona à fila
	var dmg_action = DamageAction.new(source, target, dmg_data)
	GameContext.action_system.add_to_queue(dmg_action)
	
	# emit evento
	AttackEvent.new(source, target).emit()
	
