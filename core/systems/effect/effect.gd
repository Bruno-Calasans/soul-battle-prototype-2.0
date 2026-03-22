# efeito em execução
extends Resource
class_name Effect

var data: EffectData # dados do efeito
var source: Card # quem provocou o efeito
var target: Card # quem sofre o efeito

func _init(effect_data: EffectData, _source: Card, _target: Card) -> void:
	data = effect_data
	source = _source
	target = _target
	
	
func handle(event: GameEvent):
	pass
