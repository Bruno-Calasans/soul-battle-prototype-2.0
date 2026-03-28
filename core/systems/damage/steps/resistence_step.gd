# calcula o dano baseado na resistência da criatura
extends DamageStep
class_name ResistenceStep

func apply(dmg_context: DamageContext):
	# dano direto não pode ser resistido
	if dmg_context.dmg_type == Enums.DMG_TYPE.DIRECT:
		return
		
	var resistence = dmg_context.target.get_resistence(dmg_context.dmg_type)
	dmg_context.damage -= resistence
