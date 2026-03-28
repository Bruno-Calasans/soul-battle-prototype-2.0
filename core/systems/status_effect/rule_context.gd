extends Resource
class_name RuleContext

var source: Variant
var target: Variant
var action: Action

var allowed := true # indica se a ação pode ou não começar a executar
var canceled := false # indica se a ação parou no meio da execução


func _init(source_ctx: Variant, target_ctx: Variant, action_ctx: Action) -> void:
	source = source_ctx
	target = target_ctx
	action = action_ctx


func deny():
	allowed = false
	canceled = false
	
	
func cancel():
	canceled = true
	
	
func modify_value():
	pass
	
	
