# define quando algo acontece e o que fazer
extends Resource
class_name Effect

var type: Enums.EFFECT_TYPE
var trigger: Enums.TRIGGER_TYPE
var target_type: Enums.TARGET_TYPE
var actions: Array[Action] = []
var conditions: Array[EffectCondition] = []


func _init(config: Dictionary) -> void:
	self.trigger = config['trigger']
	self.type = config['type']
	self.target_type = config['target_type']
	self.actions = config['actions']
	self.conditions = config['conditions']
		

func check_conditions(target: Card) -> bool:
	return true
