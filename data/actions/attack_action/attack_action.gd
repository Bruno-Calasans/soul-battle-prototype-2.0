extends Action
class_name AttackAction


func _init(attacker: CreatureCard, attacked: GameEntity) -> void:
	source = attacker
	target = attacked
	
	if attacker is CreatureCard:
		type = Enums.ACTION_TYPE.BATTLE_ATTACK
		
	elif attacked is Player:
		type = Enums.ACTION_TYPE.DIRECT_ATTACK
		
	else:
		type = Enums.ACTION_TYPE.DEMOLITION_ATTACK
	

func can_execute() -> bool:
	var attack_validation := AttackRule.validate(source, target)
	if not attack_validation.ok:
		cancel(attack_validation.reason)
		return false
	
	var context: RuleContext = RuleContext.new(source, target, self)
	RuleSystem.apply_rules(Enums.RULE_HOOK.BEFORE_ATTACK, context)
	
	if context.canceled or not context.allowed:
		cancel(context.reason)
		return false
	
	return true
	
	
func execute():
	# cria dados do dano
	var attacker: CreatureCard = source
	var dmg_data := DamageActionData.new()
	dmg_data.value = attacker.get_current_atk()
	dmg_data.type = attacker.data.dmg_type
	
	# adiciona à fila
	var dmg_action = DamageAction.new(dmg_data, source, target)
	GameContext.action_system.add_to_queue(dmg_action)
	
	# emit evento
	AttackEvent.new(source, target).emit()
	
