# player invocou criatura
extends GameEvent
class_name SummonEvent

func _init(
	_source: Variant, 
	_target: CreatureCard,
	slot = BoardSlot 
	) -> void:
	type = Enums.GAME_EVENT.SUMMON
	source = _source
	target = _target
	data = {
		"slot": slot
	}
	print("Jogador invocou criatura %s!" % target.data.id)
