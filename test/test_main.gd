extends Node2D
class_name TestMain

var engine: GameEngine

func _ready() -> void:
	engine = GameEngine.new()
	#SummonTest.run()
	StatusEffectStatsTest.run()
	#AttackTest.run()
	
