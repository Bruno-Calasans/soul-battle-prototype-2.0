extends Resource
class_name CardData

@export var id: String = ""
@export var desc: String = ""
@export var type: Enums.CARD_TYPE
@export var rarity: Enums.CARD_RARITY
@export var cost: int = 0
@export var effects: Array[EffectData] = []


func create(owner: Player, zone: Zone) -> Card:
	return null
