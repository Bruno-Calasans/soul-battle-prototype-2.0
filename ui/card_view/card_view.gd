extends Control
class_name CardView

signal on_card_clicked(card: CardView)
signal on_card_released(card: CardView)
signal on_hovered(card: CardView)
signal on_hovered_off(card: CardView)

# data
var card: Card

# textures
@onready var background: TextureRect = $BackgroundPanel/BackgroundMargin/CardBackground
@onready var card_name: RichTextLabel = $NameMargin/NamePanel/CardName
@onready var desc: RichTextLabel = $DescMargin/DescPanel/DescLabelMargin/CardDesc
@onready var cost: Label = $CardCostPanel/CardCost
@onready var tags: Label = $HBoxContainer/CardTags/CardTagsMargin/Tags
@onready var type: Label = $HBoxContainer/TypeContainer/CardType/MarginContainer/CardType
@onready var type_icon: TextureRect = $HBoxContainer/TypeContainer/PanelIcon/MarginContainer/IconTexture
@onready var subtype: Label = $HBoxContainer/SubtypeContainer/CardSubtype/MarginContainer/CardSubtype 
@onready var subtype_icon: TextureRect = $HBoxContainer/SubtypeContainer/PanelIcon/MarginContainer/SubtypeIcon
@onready var card_area: Area2D = $CardArea2D
@onready var card_collision = $CardArea2D/CardColisionShape2D

func _ready() -> void:
	card_name.text = "Card Name"
	desc.text = "Description"
	cost.text = "2"
	type.text = "ty"
	subtype.text = "sub"
	tags.text = "creature - zombie - common"
	
	size = CONSTANTS.NORMAL_CARD_SIZE
	scale = CONSTANTS.NORMAL_CARD_SCALE

	for child in get_children():
		_set_children_ignore(child)

	
func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_pressed():
			on_card_clicked.emit(self)
			
		else:
			on_card_released.emit(self)

func disable_collision():
	card_collision.disabled = true


func enable_collision():
	card_collision.disabled = false


func _on_mouse_entered() -> void:
	on_hovered.emit(self)


func _on_mouse_exited() -> void:
	on_hovered_off.emit(self)
	

func _set_children_ignore(node):
	if node is Control:
		node.mouse_filter = Control.MOUSE_FILTER_IGNORE

	for c in node.get_children():
		_set_children_ignore(c)
