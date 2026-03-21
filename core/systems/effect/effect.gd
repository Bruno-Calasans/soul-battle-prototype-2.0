# efeito em execução
extends Resource
class_name Effect

var data: EffectData
var source: Card
var target: Card

func _init(effect_data: EffectData, _source: Card, _target: Card) -> void:
	data = effect_data
	source = _source
	target = _target
	
	
func handle(event: GameEvent):
	pass
