class_name ModifierSystem


func get_stat_modifiers(stat: Enums.ATTRIBUTE, target: CreatureCard):
	var stats_effects := target.status_effects
	var found_modifiers: Array[StatusEffectModifierData] = []
 
	
	match stat:
		
		Enums.ATTRIBUTE.HP:
			return target.get_stats_modifiers()

	return found_modifiers
