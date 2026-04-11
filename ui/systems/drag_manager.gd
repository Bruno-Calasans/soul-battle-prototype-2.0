extends Node2D
class_name DragManager

@onready var entity_detector: EntityDetector = $"../EntityDetector"
@onready var hightlight_manager: HighlightManager = $"../HighlightManager"
@onready var hand_manager: HandView = $"../../HandView"

var dragged_card: CardView
var can_drag: bool = true
var screen_size: Vector2

func _ready() -> void:
	screen_size = get_viewport_rect().size
	

func _process(delta: float) -> void:
	update_card_position_with_mouse()
	

func update_card_position_with_mouse():
	if not dragged_card: return

	var mouse_pos: Vector2 = get_global_mouse_position()
	var card_size: Vector2 = dragged_card.size
	
	# limit card position on the screen, don't go outside the windows
	var max_x: float = clamp(mouse_pos.x, 0, screen_size.x)
	var max_y: float = clamp(mouse_pos.y, 0, screen_size.y)
	
	dragged_card.position = Vector2(max_x - card_size.x / 2, max_y - card_size.y / 2)


func start_drag(card_view: CardView):
	if not dragged_card == null or not can_drag or card_view == null: 
		return
		
	# remove highlight
	hightlight_manager.remove_highlight(card_view)
	
	# faz card ficar por cima de outros cards
	can_drag = false
	dragged_card = card_view
	dragged_card.scale = CONSTANTS.DRAGGED_CARD_SCALE
	dragged_card.z_index = CONSTANTS.DRAGGED_CARD_Z_INDEX
	dragged_card.top_level = true
	
	
func end_drag():
	if dragged_card == null: return
	
	var previous_dragged_card: CardView = dragged_card
	var previous_global_pos: Vector2 = dragged_card.global_position
	dragged_card = null
	can_drag = true
	
	hightlight_manager.remove_highlight(previous_dragged_card)
	previous_dragged_card.scale = CONSTANTS.NORMAL_CARD_SCALE
	previous_dragged_card.z_index = CONSTANTS.NORMAL_CARD_Z_INDEX
	
	# evita animação quebrada
	previous_dragged_card.top_level = false
	previous_dragged_card.global_position = previous_global_pos
	
	var slot_found = entity_detector.get_first_card_slot()
	
	# drop card em cima do slot
	if slot_found: 
		slot_found.place_card(previous_dragged_card)
		
	# retorna para mão
	else:
		previous_dragged_card.scale = CONSTANTS.CARD_IN_HAND_SCALE
		hand_manager.animate_card_to_position(previous_dragged_card, previous_dragged_card.position_in_hand)
		
	
func on_card_clicked(card_view: CardView):
	#start_drag(card)
	#print("Card clicked = ", card_view)
	pass
	
	
func on_card_released(card_view: CardView):
	#print("Card released = ", card_view)
	pass
	
	
