# efeito em execução
extends Resource
class_name Effect

var data: EffectData # dados do efeito
var source: Card # quem provocou o efeito
var target: Card # quem sofre o efeito

func _init(effect_data: EffectData, effect_source: GameEntity, target_effect: CreatureCard) -> void:
	data = effect_data
	source = effect_source
	target = target_effect
	
	
func handle(event: GameEvent):
	pass
