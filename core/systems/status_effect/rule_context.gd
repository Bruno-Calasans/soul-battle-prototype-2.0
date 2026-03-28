extends Resource
class_name RuleContext

var source: GameEntity
var target: GameEntity
var action: Action

var allowed := true # indica se a ação pode ou não começar a executar
var canceled := false # indica se a ação parou no meio da execução
var reason: String

func _init(source_ctx: GameEntity, target_ctx: GameEntity, action_ctx: Action = null) -> void:
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
	
	
