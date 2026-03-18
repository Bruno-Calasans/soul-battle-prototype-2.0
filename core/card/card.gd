extends Resource
class_name Card

@export var card_name: String = ""
@export var desc: String = ""
@export var type: Enums.CARD_TYPE
@export var rarity: Enums.CARD_RARITY
@export var cost: int = 0
@export var is_destroyed: bool = false
@export var can_be_destroyed: bool = true
@export var effects: Array[Effect] = []
@export var owner: Player
@export var zone: Zone
@export var slot: BoardSlot

func set_card_name(new_name: String):
	self.name = new_name
	
	
func set_cad_desc(new_desc: String):
	self.desc = new_desc
	
	
func set_card_type(new_card_type: Enums.CARD_TYPE):
	self.type = new_card_type
	

func set_card_rarity(new_card_rarity: Enums.CARD_RARITY):
	self.rarity = new_card_rarity
	
	
func set_soul_cost(new_soul_cost: int):
	self.cost = max(new_soul_cost, 0)
	
	
func destroy():
	if can_be_destroyed and not is_destroyed:
		is_destroyed = true
	
