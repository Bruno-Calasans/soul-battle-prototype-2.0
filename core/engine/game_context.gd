# define os sistemas utilizáveis globalmente
extends Node

# core system
var state: GameState
var rule_engine: RuleEngine
var game_controller: GameController

# systems
var command_system: CommandSystem
var action_system: ActionSystem
var event_system: EventSystem
var effect_system: EffectSystem
var zone_system: ZoneSystem
var damage_system: DamageSystem

# gameplay system
var combat_system: CombatSystem
var turn_system: TurnSystem
var dmg_system: DamageSystem

func _init() -> void:
	state = GameState.new()
	event_system = EventSystem.new()
	combat_system = CombatSystem.new()
	turn_system = TurnSystem.new()
	zone_system = ZoneSystem.new()
	command_system = CommandSystem.new()
	action_system = ActionSystem.new()
	effect_system = EffectSystem.new()
	game_controller = GameController.new()
	dmg_system = DamageSystem.new()
	rule_engine = RuleEngine.new()
