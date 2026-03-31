# card em jogo
extends GameEntity
class_name Card

var data: CardData
var owner: Player
var zone: Zone
var slot: BoardSlot
var is_destroyed: bool = false

func get_cost():
	return data.cost

func set_id(_id: String):
	data.id = _id
	
	
func set_desc(_desc: String):
	data.desc = _desc
	
	
func set_type(_card_type: CARD_ENUM.CARD_TYPE):
	data.type = _card_type
	

func set_rarity(_rarity: CARD_ENUM.CARD_RARITY):
	data.rarity = _rarity
	
	
func set_cost(_cost: int):
	data.cost = max(_cost, 0)


func has_effect():
	return data.effects.size() > 0


func destroy():
	is_destroyed = true
