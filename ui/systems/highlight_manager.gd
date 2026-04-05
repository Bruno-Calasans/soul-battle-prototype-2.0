extends Node
class_name HighlightManager

var hightlight_card: CardView
@onready var drag_manager: DragManager = $"../DragManager"

func highlight(card_view: CardView):
	if not hightlight_card and not drag_manager.dragged_card and not card_view.slot:
		card_view.scale = CONSTANTS.HIGHLIGHT_CARD_SCALE
		card_view.z_index = CONSTANTS.HIGHLIGHT_CARD_Z_INDEX
		hightlight_card = card_view
		print("apply highlight")
		
	
func remove_highlight(card_view: CardView):
	if hightlight_card and not drag_manager.dragged_card and not card_view.slot:
		card_view.scale = CONSTANTS.NORMAL_CARD_SCALE
		card_view.z_index = CONSTANTS.NORMAL_CARD_Z_INDEX
		hightlight_card = null
		print("remove highlight")
		
