# player invocou criatura
extends GameEvent
class_name SummonEvent

var player: Player
var card: CreatureCard
var slot: BoardSlot

func _init(
	_player: Player, 
	_card: CreatureCard, 
	_slot: BoardSlot, 
	) -> void:
	type = Enums.GAME_EVENT_TYPE.SUMMON	
	player = _player
	card = _card
	slot = _slot
	print("Jogador invocou criatura %s!" % card.data.id)
