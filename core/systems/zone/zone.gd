extends Resource
class_name Zone

var type: ZONE_ENUM.ZONE_TYPE
var owner: Player
var cards: Array[Card] = []


func add_card(card: Card):
	cards.append(card)
	
	
func remove_card(card: Card):
	cards.erase(card)
