extends Resource
class_name BoardSlot

var card: Card
var owner: Player
var slot_type


func _init(_owner: Player) -> void:
	owner = _owner
