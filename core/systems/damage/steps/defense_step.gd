extends DamageStep
class_name DefenseStep

func apply(dmg_context: DamageContext):
	var def = dmg_context.target.get_current_def()
	var effective_def = def - dmg_context.ignore_def
	dmg_context.damage -= effective_def
