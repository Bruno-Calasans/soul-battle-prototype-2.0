extends Resource
class_name DamageSystem

var dmg_pipeline: DamagePipeline


func _init():
	dmg_pipeline = DamagePipeline.new()
	dmg_pipeline.steps = [
		ResistenceStep.new(),
		DefenseStep.new()
	]

func calculate_dmg(source: Card, target: Card, value: int, dmg_type: Enums.DMG_TYPE):
	var dmg_context = DamageContext.new(source, target, value, dmg_type)
	var final_damage = GameContext.dmg_pipeline.process(dmg_context)
	return final_damage
