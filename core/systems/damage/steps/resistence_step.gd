# calcula o dano baseado na resistência da criatura
extends DamageStep
class_name ResistenceStep

func apply(dmg_context: DamageContext):
	var resistence = dmg_context.target.get_resistence(dmg_context.dmg_type)
	dmg_context.damage -= resistence
