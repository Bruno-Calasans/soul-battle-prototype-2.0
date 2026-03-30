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


func deny(deny_reason: String = ""):
	allowed = false
	canceled = false
	reason = deny_reason
	
	
func cancel(cancel_reason: String = ""):
	canceled = true
	reason = cancel_reason
	
	
func modify_value():
	pass
	
	
