# recebe todos os eventos
# consome evento
extends Node
class_name GameEngine

func run() -> void:
	GameContext.command_system.process()
	GameContext.action_system.process()
	GameContext.event_system.process()
