extends Node2D
class_name InputManager

@onready var drag_manager: DragManager = $"../DragManager"
@onready var entity_detector: EntityDetector = $"../EntityDetector"

func _input(event: InputEvent) -> void:

	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		
		if event.is_pressed(): 
			var card: CardView = entity_detector.get_card_on_top()
			if card is CardView: 
				drag_manager.start_drag(card)
			
		if event.is_released(): 
			drag_manager.end_drag()
