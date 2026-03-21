extends Resource
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
	


func has_energy(energy_to_action: int):
	return energy >= energy_to_action


func consume_energy(value: int):
	energy = clamp(energy - value, Limits.MIN_ENERGY, Limits.MAX_ENERGY)
