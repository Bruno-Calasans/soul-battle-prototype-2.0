# executa passos para determinar o dano final
extends Resource
class_name DamagePipeline

var steps: Array[DamageStep] = []

func process(dmg_context: DamageContext) -> int:
	for step in steps:
		step.apply(dmg_context)
		
	return clamp(dmg_context.damage, Limits.MIN_DMG, Limits.MAX_DMG)
