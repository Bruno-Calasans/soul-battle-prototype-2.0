# player invocou criatura
extends GameEvent
class_name SummonEvent

var slot: BoardSlot

func _init(
	_player: Player, 
	_card: CreatureCard, 
	_slot: BoardSlot, 
	) -> void:
	type = Enums.GAME_EVENT.SUMMON	
	player = _player
	target = _card
	source = _player
	slot = _slot
	print("Jogador invocou criatura %s!" % _card.data.id)
