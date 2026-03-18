extends Node2D
class_name Test

var engine: GameEngine

func _ready() -> void:
	engine = GameEngine.new()

func _process(delta: float) -> void:
	engine.run()
