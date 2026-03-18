# efeito ativável
extends Resource
class_name TriggeredEffect

var effect: Effect
var source: Card

func _init(_effect: Effect, _source: Card) -> void:
	self.effect = _effect
	self.source = _source
