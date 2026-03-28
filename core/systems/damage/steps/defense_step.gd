extends DamageStep
class_name DefenseStep

func apply(dmg_context: DamageContext):
	
	
	var target: CreatureCard = dmg_context.target
	var def = target.get_current_def()
	var effective_def = def - dmg_context.ignore_def
	
	# desgasta defesa
	target.set_current_def(def - 1)
	
	# aplica redução de dano por def
	dmg_context.damage -= effective_def
	
	Utils.log_warn("Aplicando DEF")
	Utils.show_value("TARGET DEF", def)
	
	
	
