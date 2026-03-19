# efeito em execução
extends Resource
class_name ActiveEffect

var effect: Effect
var source: Card
var target: Card

func _init(_effect: Effect, _source: Card, _target: Card) -> void:
	effect = _effect
	source = _source
	target = _target
