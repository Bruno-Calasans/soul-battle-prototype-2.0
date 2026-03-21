extends Resource
class_name CardData

@export var id: String = ""
@export var desc: String = ""
@export var type: Enums.CARD_TYPE
@export var rarity: Enums.CARD_RARITY
@export var cost: int = 0
@export var effects: Array[EffectData] = []


func reate(config: Dictionary) -> Card:
	return null


func set_id(_id: String):
	id = _id
	
	
func set_desc(_desc: String):
	desc = _desc
	
	
func set_type(_card_type: Enums.CARD_TYPE):
	type = _card_type
	

func set_rarity(_rarity: Enums.CARD_RARITY):
	rarity = _rarity
	
	
func set_cost(_cost: int):
	cost = max(_cost, 0)
