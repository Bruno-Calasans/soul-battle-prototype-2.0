# player invocou criatura
extends GameEvent
class_name SummonEvent

func _init(
	summoner: Variant, 
	summoned_card: CreatureCard,
	slot: BoardSlot 
	) -> void:
	type = Enums.GAME_EVENT.SUMMON
	source = summoner
	target = summoned_card
	data = {
		"slot": slot
	}
	print("Jogador invocou criatura %s!" % target.data.id)
