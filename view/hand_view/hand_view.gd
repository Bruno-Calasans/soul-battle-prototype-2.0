extends Control
class_name HandView

const NORMAL_CARD_SIZE = CONSTANTS.NORMAL_CARD_SIZE
const CARD_WIDTH = NORMAL_CARD_SIZE.x
const HAND_Y_POSITION = 10 #
const ANIMATION_FROM_HAND_SPEED = 0.4
const ANIMATION_TO_HAND_SPEED = 0.4

var cards: Array[CardView] = []
var center_screen_x: float
var invert_add_card_to_hand: bool = true

@onready var highlight_manager: HighlightManager = $"../GameManager/HighlightManager"


func _ready() -> void:
	scale = CONSTANTS.HAND_CONTAINER_SCALE
	spawn_cards(4)


func spawn_cards(amount: int = 2):
	var card_scene: PackedScene = preload("res://view/card_view/card_view.tscn")
	
	for index in range(amount):
		var card_view = card_scene.instantiate()
		connect_card_signals(card_view)
		add_card(card_view)


func connect_card_signals(card_view: CardView):
	card_view.on_hovered.connect(highlight_manager.highlight)
	card_view.on_hovered_off.connect(highlight_manager.remove_highlight)


func config():
	center_screen_x = get_viewport_rect().size.x / 2


func has_card(card: Card):
	if cards.size() == 0: return false
	return card in cards


func add_card(card: CardView):
	# new card in the hand
	if card not in cards:
		
		#  insert at the end
		if invert_add_card_to_hand:
			cards.append(card)
		# insert at the start
		else:
			cards.insert(0, card)
			
		update_hand_position()
		add_child(card)
		
	# returning card to hand
	else:
		animate_card_to_position(card, card.position_in_hand)
	

func remove_card(card: CardView):
	if card in cards:
		cards.erase(card)
		update_hand_position()
		# test
		#remove_child(card)
		

func update_hand_position():
	for card_index in range(cards.size()):
		var x_position: float = calculate_card_position(card_index)
		var new_position: Vector2 = Vector2(x_position, HAND_Y_POSITION)
		var card: CardView = cards.get(card_index)
		
		card.position_in_hand = new_position
		animate_card_to_position(card, new_position)
	

func calculate_card_position(index: int) -> float:
	# tamanho total da mão com todos os cards nela
	var total_width: float = (cards.size() - 1) * CARD_WIDTH
	var card_x_offset: float
	
	# inverted card order
	if invert_add_card_to_hand:
		card_x_offset = center_screen_x - index * CARD_WIDTH + total_width / 2
		
	# normal order
	else:
		card_x_offset = center_screen_x + index * CARD_WIDTH - total_width / 2
		
	return card_x_offset
	
	
func animate_card_from_position(card: CardView, card_position: Vector2):
	var tween_animation = create_tween()
	tween_animation.tween_property(card, 'position', card_position, ANIMATION_FROM_HAND_SPEED)
	
	
func animate_card_to_position(card: CardView, card_position: Vector2):
	var tween_animation = create_tween()
	tween_animation.tween_property(card, 'position', card_position, ANIMATION_TO_HAND_SPEED)
	
