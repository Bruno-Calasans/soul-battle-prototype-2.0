extends Action
class_name DamageAction

@export var value: int
@export var dmg_type: Enums.DMG_TYPE

func _init(_value: int, _dmg_type: Enums.DMG_TYPE)  -> void:
	super(Enums.ACTION_TYPE.DAMAGE)
	value = _value
	dmg_type = _dmg_type
	
	
func execute():
	if source is CreatureCard and target is CreatureCard:
		var damage = GameContext.damage_system.calculate_dmg(source, target, value, dmg_type)
		target.take_damage(damage)
		GameContext.event_system.add_to_queue(DamageEvent.new(source, target))
		
		
	
