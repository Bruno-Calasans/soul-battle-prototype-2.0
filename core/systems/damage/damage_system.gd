extends Resource
class_name DamageSystem

var dmg_pipeline: DamagePipeline

func _init():
	dmg_pipeline = DamagePipeline.new()
	dmg_pipeline.steps = [
		ResistenceStep.new(),
		DefenseStep.new()
	]

func calculate_dmg(dmg_source: Card, dmg_target: Card, dmg_value: int, dmg_type: Enums.DMG_TYPE):
	var dmg_context = DamageContext.new(dmg_source, dmg_target, dmg_value, dmg_type)
	var final_damage = dmg_pipeline.process(dmg_context)
	return final_damage
