extends Node2D
class_name TestMain

var engine: GameEngine

func _ready() -> void:
	engine = GameEngine.new()
	SummonTest.run()
	#Test2.run()
	#AttackTest.run()
	
