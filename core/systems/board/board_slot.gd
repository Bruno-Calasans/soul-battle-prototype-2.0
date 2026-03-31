extends Resource
class_name BoardSlot

var card: Card
var owner: Player
var position: ZONE_ENUM.SLOT_POSITION

func _init(_owner: Player) -> void:
	owner = _owner
