# responsável pelo attack entre criaturas
extends Resource
class_name CombatSystem

# quando criaturas se atacam
func attack(source: CreatureCard, target: CreatureCard):
	GameContext.event_system.add_to_queue(AttackEvent.new(source, target))
	
