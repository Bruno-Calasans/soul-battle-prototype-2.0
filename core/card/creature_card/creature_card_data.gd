extends CardData
class_name CreatureCardData

# info
@export var race: Enums.CREATURE_RACE
@export var class_type: Enums.CREATURE_CLASS
@export var dmg_type: Enums.DMG_TYPE
@export var souls: int

# base status
@export var base_atk: int
@export var base_health: int
@export var base_def: int
@export var base_evade: int
@export var resistence: CreatureResistence


func create(config: Dictionary):
	if not config.has('owner'): push_error("Parâmetro 'owner' faltando")
	if not config.has('zone'): push_error("Parâmetro 'zone' faltando")
	return CreatureCard.new(self, config.owner, config.zone)
