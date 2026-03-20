extends CardData
class_name CreatureCardData

# info
var race: Enums.CREATURE_RACE
var class_type: Enums.CREATURE_CLASS
var dmg_type: Enums.DMG_TYPE
var souls: int

# base status
var base_atk: int
var base_health: int
var base_def: int
var base_evade: int
var resistence: CreatureResistence


func create(config: Dictionary):
	if not config.has('owner'): push_error("Parâmetro 'owner' faltando")
	if not config.has('zone'): push_error("Parâmetro 'zone' faltando")
	return CreatureCard.new(self, config.owner, config.zone)
