extends Node2D
class_name GameManager

@onready var highlight_manager: HighlightManager = $HighlightManager
@onready var drag_manager: DragManager = $DragManager
@onready var input_manager: InputManager = $InputManager
@onready var entity_detector: EntityDetector = $EntityDetector
@onready var cards_container = $"../CardsContainer"

func _ready() -> void:
	if drag_manager and drag_manager.ready and highlight_manager and highlight_manager.ready:
		spawn_cards()


func connect_card_signals(card_view: CardView):
	card_view.on_card_clicked.connect(drag_manager.on_card_clicked)
	card_view.on_card_released.connect(drag_manager.on_card_released)
	card_view.on_hovered.connect(highlight_manager.highlight)
	card_view.on_hovered_off.connect(highlight_manager.remove_highlight)
	

func spawn_cards(amount: int = 2):
	var card_scene: PackedScene = preload("res://ui/card_view/card_view.tscn")
	
	for index in range(amount):
		var card_view = card_scene.instantiate()
		connect_card_signals(card_view)
		cards_container.add_child(card_view)
	
