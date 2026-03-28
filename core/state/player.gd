extends GameEntity
class_name Player

var deck: Deck
var hand: Hand
var board: Board
var player_void: Zone
var life: int = 50
var energy: int = 10


func _init() -> void:
	deck = Deck.new()
	board = Board.new(self, 3)
	hand = Hand.new()
	player_void = Void.new()
	

func has_energy(action_energy: int):
	return energy >= action_energy


func consume_energy(action_energy: int):
	if not has_energy(action_energy): return
	energy = clamp(energy - action_energy, Limits.MIN_ENERGY, Limits.MAX_ENERGY)
