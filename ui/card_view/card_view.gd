extends Control
class_name CardView

var card: Card
@onready var background: TextureRect = $BackgroundPanel/BackgroundMargin/CardBackground
@onready var card_name: RichTextLabel = $NameMargin/NamePanel/CardName
@onready var desc: RichTextLabel = $DescMargin/DescPanel/DescLabelMargin/CardDesc
@onready var cost: Label = $CardCostPanel/CardCost
@onready var tags: Label = $HBoxContainer/CardTags/CardTagsMargin/Tags
@onready var type: Label = $HBoxContainer/TypeContainer/CardType/MarginContainer/CardType
@onready var type_icon: TextureRect = $HBoxContainer/TypeContainer/PanelIcon/MarginContainer/IconTexture
@onready var subtype: Label = $HBoxContainer/SubtypeContainer/CardSubtype/MarginContainer/CardSubtype 
@onready var subtype_icon: TextureRect = $HBoxContainer/SubtypeContainer/PanelIcon/MarginContainer/SubtypeIcon


func _ready() -> void:
	card_name.text = "Card Name"
	desc.text = "Description"
	cost.text = "2"
	type.text = "ty"
	subtype.text = "sub"
	tags.text = "creature - zombie - common"
