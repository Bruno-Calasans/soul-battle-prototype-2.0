# dmg_source = player (ainda não sei) ou card
# dmg_target = creature, player or structure

extends GameEvent
class_name DamageEvent

func _init(dmg_source: GameEntity, dmg_target: GameEntity, dmg_data: DamageActionData) -> void:
	type = GAME_ENUM.GAME_EVENT.DAMAGE
	source = dmg_source
	target = dmg_target
	data = dmg_data
	
	
func show_log():
	Utils.log_event("DAMAGE EVENT: {0} recebeu {1} de dano ({2})"
	.format([target.data.id, data.value, CONSTANTS.DMG_TYPE_NAMES[data.type], ], "{_}"))
