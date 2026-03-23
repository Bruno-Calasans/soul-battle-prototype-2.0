extends Resource
class_name BoardSlot

var card: Card
var owner: Player
var position: Enums.SLOT_POSITION

func _init(_owner: Player) -> void:
	owner = _owner
