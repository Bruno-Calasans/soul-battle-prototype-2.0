extends Resource
class_name RuleSystem

static func apply_rules(hook: Enums.RULE_HOOK, context: RuleContext):
	var rules := collect_all_rule_modifiers()
	
	for rule in rules:
		
		if rule.hook != hook: continue
		
		if not rule.can_apply(context): continue
		
		rule.apply(context)
		
		if context.canceled or not context.allowed:
			break
			
	return context


static func collect_all_rule_modifiers() -> Array[RuleModifier] :
	var rule_modifiers: Array[RuleModifier] = []
	var cards = GameContext.state.get_all_board_cards()
	
	for card in cards:
		if card is CreatureCard:
			var modifiers: Array[RuleModifier] = card.get_all_rule_modifiers()
			rule_modifiers.append_array(modifiers)
			
	return rule_modifiers
