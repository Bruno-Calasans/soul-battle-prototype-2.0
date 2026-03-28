extends GameEvent
class_name DamageEvent

func _init(dmg_source: Card, damaged_card: Card, dmg_data: DamageActionData) -> void:
	type = Enums.GAME_EVENT.DAMAGE
	source = dmg_source
	target = damaged_card
	data = dmg_data
	
	
	
func show_log():
	Utils.log_event("DAMAGE EVENT: {0} recebeu {1} de dano ({2})"
	.format([target.data.id, data.value, EnumNames.DMG_TYPE_NAMES[data.type], ], "{_}"))
