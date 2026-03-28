# define os sistemas utilizáveis globalmente
extends Node

# core system
var state: GameState

# systems
var command_system: CommandSystem
var action_system: ActionSystem
var event_system: EventSystem
var effect_system: EffectSystem
var zone_system: ZoneSystem
var damage_system: DamageSystem
var status_effect_system: StatusEffectSystem
var state_based_system: StateBasedSystem

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
	damage_system = DamageSystem.new()
	status_effect_system = StatusEffectSystem.new()
	state_based_system = StateBasedSystem.new()
