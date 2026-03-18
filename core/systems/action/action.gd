extends Resource
class_name Action

@export var type: Enums.ACTION_TYPE
@export var source: Card
@export var target: Card

func _init(_type: Enums.ACTION_TYPE) -> void:
	type = _type

func execute():
	pass
