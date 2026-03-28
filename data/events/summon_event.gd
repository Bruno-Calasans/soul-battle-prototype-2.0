# player invocou criatura
extends GameEvent
class_name SummonEvent

func _init(
	summoned_card: CreatureCard,
	summoner: GameEntity, 
	slot: BoardSlot 
	) -> void:
	type = Enums.GAME_EVENT.SUMMON
	source = summoner
	target = summoned_card
	data = {
		"slot": slot
	}


func show_log():
	var summoner_id = source.data.id if source is CreatureCard else "Player"
	Utils.log_event("{0} invocou {1}!".format([summoner_id, target.data.id]))
	
