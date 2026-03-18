extends Resource
class_name GameState

var players: Array[Player] = []
var turn_player: Player
var turn_number: int = 1


func get_all_enemies(player: Player) -> Array[Card]:
	var cards = get_all_cards()
	return cards.filter(func (card: Card): return card.owner != player)
	
	
func get_all_allies(player: Player) -> Array[Card]:
	var cards = get_all_cards()
	return cards.filter(func (card: Card): return card.owner == player)


func get_all_cards() -> Array[Card]:
	var cards: Array[Card] = []
	
	for player in players:
		cards.assign(player.board.cards)
	return cards
