extends Resource
class_name Zone

var type: Enums.ZONE_TYPE
var owner: Player
var cards: Array[Card] = []


func add_card(card: Card):
	cards.append(card)
	
	
func remove_card(card: Card):
	cards.erase(card)
