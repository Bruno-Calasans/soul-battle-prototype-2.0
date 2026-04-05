extends Control
class_name CardSlotView

var slot: BoardSlot
var card: CardView

@onready var card_slot_area2d: Area2D = $CardSlotArea2D
@onready var card_slot_collision_shape: CollisionShape2D = $CardSlotArea2D/CardSlotCollisionShape2D
@onready var card_slot_panel: Panel = $CardSlotPanel


func _ready() -> void:
	slot = BoardSlot.new(null)
	size = CONSTANTS.NORMAL_CARD_SIZE
	scale = CONSTANTS.SLOT_SCALE
	z_index = CONSTANTS.SLOT_Z_INDEX
	

func disable_collision():
	card_slot_collision_shape.disabled = true


func enable_collision():
	card_slot_collision_shape.disabled = false


func place_card(card_view: CardView):
	card_view.reparent(self)
	card_view.position = Vector2.ZERO # em relação ao slot view
	card_view.z_index = CONSTANTS.CARD_IN_SLOT_Z_INDEX
	card_view.scale = CONSTANTS.CARD_IN_SLOT_SCALE
	
	# ajusta os dados das views
	card = card_view
	slot.card = card_view.card
	card_view.slot = self
	
	# colisões
	card_view.disable_collision()
	disable_collision()
	
	
func remove_card():
	card.enable_collision()
	enable_collision()
	
	card.slot = null
	card = null
	slot.card = null
