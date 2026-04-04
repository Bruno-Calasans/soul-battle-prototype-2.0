extends Control
class_name CardSlotView

var slot: BoardSlot
var card: CardView

@onready var card_slot_area2d: Area2D = $CardSlotArea2D
@onready var card_slot_collision_shape: CollisionShape2D = $CardSlotArea2D/CardSlotCollisionShape2D

func _ready() -> void:
	slot = BoardSlot.new(null)
	z_index = CONSTANTS.SLOT_Z_INDEX
	size = CONSTANTS.NORMAL_CARD_SIZE
	scale = CONSTANTS.SLOT_SCALE


func disable_collision():
	card_slot_collision_shape.disabled = true


func enable_collision():
	card_slot_collision_shape.disabled = false


func place_card(card_view: CardView):
	card_view.position = position
	card_view.z_index = CONSTANTS.CARD_IN_SLOT_Z_INDEX
	card_view.scale = CONSTANTS.NORMAL_CARD_SCALE
	card = card_view
	slot.card = card_view.card
	card_view.disable_collision()
	disable_collision()
	
	
func remove_card():
	card = null
	slot.card = null
	enable_collision()
